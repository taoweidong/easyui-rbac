package cn.gson.crm.model.controller;

import cn.gson.crm.common.AjaxResult;
import cn.gson.crm.common.AttachmentType;
import cn.gson.crm.common.Constants;
import cn.gson.crm.model.domain.Attachment;
import cn.gson.crm.model.domain.Member;
import cn.gson.crm.model.service.AttachmentService;
import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.charset.Charset;

/**
 * 附件处理
 * @author taowd
 */
@Controller
@RequestMapping("/attachment")
public class AttachmentController {

	private static final Logger LOGGER = Logger.getLogger(AttachmentController.class);

	@Autowired
	AttachmentService attachmentService;

	/**
	 * 上传
	 * @param type          文件类型
	 * @param member
	 * @param multipartFile
	 * @return
	 */
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	@ResponseBody
	public AjaxResult upload(@RequestParam(defaultValue = "PUBLIC") AttachmentType type,
			@SessionAttribute(Constants.SESSION_MEMBER_KEY) Member member,
			@RequestParam("file") MultipartFile multipartFile) {

		try {
			// 将通用方法，抽成服务，供其他地方调用
			Attachment att = attachmentService.saveFile(member, type, multipartFile);
			return AjaxResult.success(att);
		} catch (Exception e) {
			return AjaxResult.fail(e.getMessage());
		}
	}

	/**
	 * 显示或下载文件
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/**", method = RequestMethod.GET)
	public ResponseEntity<byte[]> loadFile(HttpServletRequest request,
			HttpServletResponse response) {

		try {
			String filePath = request.getServletPath();
			Attachment att = attachmentService.getFile(filePath);
			HttpHeaders headers = new HttpHeaders();
			headers.setContentDispositionFormData("attachment", att.getOriginalName(),
					Charset.forName("utf-8"));
			headers.setContentType(MediaType.parseMediaType(att.getContentType()));
			headers.setContentLength(att.getFileSize());

			return new ResponseEntity<>(FileUtils.readFileToByteArray(att.getFile()), headers,
					HttpStatus.OK);
		} catch (FileNotFoundException e) {
			LOGGER.error("文件不存在", e);
			response.setStatus(404);
		} catch (IOException e) {
			response.setStatus(500);
			LOGGER.error("下载文件失败", e);
		}
		return null;
	}
}
