package cn.gson.crm.configuration.interceptor;

import cn.gson.crm.common.Constants;
import cn.gson.crm.common.ImUser;
import cn.gson.crm.model.domain.Member;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

import javax.servlet.http.HttpSession;
import java.util.Map;
import java.util.Objects;

/**
 * 用于WebSocket记录用户信息
 * @author taowd
 */
public class WebSocketHandlerInterceptor extends HttpSessionHandshakeInterceptor {

	@Override
	public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response,
			WebSocketHandler wsHandler, Map<String, Object> attributes) throws Exception {

		if (request instanceof ServletServerHttpRequest) {
			ServletServerHttpRequest servletRequest = (ServletServerHttpRequest) request;
			HttpSession session = servletRequest.getServletRequest().getSession();
			if (Objects.nonNull(session)) {
				Member member = (Member) session.getAttribute(Constants.SESSION_MEMBER_KEY);
				attributes.put(Constants.WEB_SOCKET_USERNAME,
						new ImUser(member.getId(), member.getRealName()));
			}
		}
		return super.beforeHandshake(request, response, wsHandler, attributes);
	}
}
