package cn.gson.crm.configuration;

import cn.gson.crm.handler.WebSocketHandler;
import cn.gson.crm.configuration.interceptor.WebSocketHandlerInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

/**
 * WebSocket基本配置
 * @author taowd
 */
@Configuration
@EnableWebSocket
public class WebSocketConfig extends WebMvcConfigurerAdapter implements WebSocketConfigurer {

	@Autowired
	WebSocketHandler webSocketHandler;

	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {

		registry.addHandler(webSocketHandler, "/ws/server")
				.addInterceptors(new WebSocketHandlerInterceptor());
		registry.addHandler(webSocketHandler, "/sockjs/server")
				.addInterceptors(new WebSocketHandlerInterceptor()).withSockJS();
	}
}
