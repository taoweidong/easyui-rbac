package cn.gson.crm.common;

import org.apache.commons.lang.StringUtils;

/**
 * @author taowd
 */
public class AjaxResult {

	private Boolean success = true;

	private Boolean isError = false;

	private String message;

	private Object data;

	public AjaxResult() {

	}

	/**
	 * 成功结果集
	 * @param data 返回前台数据
	 * @return 成功结果集
	 */
	public static AjaxResult success(Object data) {

		AjaxResult ajaxResult = new AjaxResult();
		ajaxResult.setSuccess(true);
		ajaxResult.setMessage(Constants.SUCCESS_MSG);
		ajaxResult.setData(data);
		return ajaxResult;
	}

	/**
	 * 失败结果集
	 * @return 失败结果集
	 */
	public static AjaxResult fail() {

		AjaxResult ajaxResult = new AjaxResult();
		ajaxResult.setSuccess(false);
		ajaxResult.setMessage(Constants.FAIL_MSG);
		ajaxResult.setData(StringUtils.EMPTY);
		return ajaxResult;
	}

	/**
	 * 失败结果集
	 * @param message 失败信息
	 * @return 失败结果集
	 */
	public static AjaxResult fail(String message) {

		AjaxResult ajaxResult = new AjaxResult();
		ajaxResult.setSuccess(false);
		ajaxResult.setMessage(message);
		ajaxResult.setData(StringUtils.EMPTY);
		return ajaxResult;
	}

	public AjaxResult(Boolean success) {

		this.setSuccess(success);
	}

	public AjaxResult(String message) {

		this.message = message;
	}

	public AjaxResult(Boolean success, String message) {

		this.setSuccess(success);
		this.message = message;
	}

	public Boolean getSuccess() {

		return success;
	}

	public void setSuccess(Boolean success) {

		this.success = success;
		if (!success) {
			isError = true;
		}
	}

	public String getMessage() {

		return message;
	}

	public AjaxResult setMessage(String message) {

		this.message = message;
		return this;
	}

	public Object getData() {

		return data;
	}

	public AjaxResult setData(Object data) {

		this.data = data;
		return this;
	}

	public Boolean getIsError() {

		return isError;
	}
}
