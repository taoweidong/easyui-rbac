package cn.gson.crm;

import javax.servlet.ServletContext;

import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.support.SpringBootServletInitializer;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.support.MultipartFilter;

/**
 * 如果是要打成war包，放到tomcat之类的web服务器运行，必须有此类
 * @author taowd
 */
public class ServletInitializer extends SpringBootServletInitializer {

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {

		logger.info("SpringApplicationBuilder....");
		return application.sources(CrmApplication.class);
	}

	@Override
	protected WebApplicationContext createRootApplicationContext(ServletContext servletContext) {

		logger.info("WebApplicationContext....");
		servletContext.addFilter("multipartFilter", new MultipartFilter());
		return super.createRootApplicationContext(servletContext);
	}
}
