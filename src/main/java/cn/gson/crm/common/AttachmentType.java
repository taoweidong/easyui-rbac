package cn.gson.crm.common;

/**
 * 上传文件类型,规定图片所属模块
 * @author taowd
 */
public enum AttachmentType {
	AVATAR("头像"), PUBLIC("公共目录");

	public String alias;

	AttachmentType(String alias) {

		this.alias = alias;
	}

	@Override
	public String toString() {

		return alias;
	}
}
