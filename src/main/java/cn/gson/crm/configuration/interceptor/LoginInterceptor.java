package cn.gson.crm.configuration.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import java.util.Objects;

/**
 * 登录拦截器
 * @author gson
 */
public class LoginInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2)
			throws Exception {

		HttpSession session = request.getSession();
		if (Objects.isNull(session.getAttribute("s_member"))) {
			if (this.isAjax(request)) {
				// ajax请求，返回错误码
				response.setStatus(402);
			} else {
				response.sendRedirect("/login");
			}
			return false;
		}
		return true;
	}

	private boolean isAjax(HttpServletRequest request) {

		return "XMLHttpRequest".equalsIgnoreCase(request.getHeader("X-Requested-With"));
	}

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2,
			Exception arg3) throws Exception {

	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2,
			ModelAndView arg3) throws Exception {

	}
}
