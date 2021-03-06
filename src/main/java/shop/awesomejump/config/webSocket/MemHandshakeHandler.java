package shop.awesomejump.config.webSocket;

import java.security.Principal;
import java.util.Map;
import java.util.UUID;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.DefaultHandshakeHandler;

public class MemHandshakeHandler extends DefaultHandshakeHandler{
	
	@Override
	 protected Principal determineUser(ServerHttpRequest request, WebSocketHandler wsHandler, Map<String, Object> attributes) {
	        String name = UUID.randomUUID().toString();
	        return new Principal() {
	            @Override
	            public String getName() {
	                return name;
	            }
	        };
	    }
}
