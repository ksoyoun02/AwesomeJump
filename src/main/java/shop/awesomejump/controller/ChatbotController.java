package shop.awesomejump.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.api.gax.rpc.ApiException;
import com.google.cloud.dialogflow.cx.v3beta1.Intent;
import com.google.cloud.dialogflow.cx.v3beta1.QueryResult;

import lombok.extern.slf4j.Slf4j;
import shop.awesomejump.util.DetectIntent;

@Slf4j
@Controller
@RequestMapping("/chatbot")
public class ChatbotController {

	@ResponseBody
	@PostMapping("/agent")
	public List<String> responseAgent(@RequestBody String request) throws IOException, ApiException {
		
		String projectId = "dialogflow-awesomejump";
		String locationId = "asia-northeast1";
		String agentId = "ce1d234e-6fc4-4e4e-aa7c-f362d457941e";
		String languageCode = "ko";
		String sessionId = "chatbot-session-" + new Random().nextInt(1000);

		List<String> texts = new ArrayList<>();
		texts.add(request);
		
		Map<String, QueryResult> queryResults = DetectIntent
				.detectIntent(projectId, locationId, agentId, sessionId, languageCode, texts);
		
		List<String> responseTexts = new ArrayList<>();
		
		queryResults.forEach((text, queryResult) -> {
			
			queryResult.getResponseMessagesList().forEach(resp -> {
				
				String responseText = 
						resp.getText().toByteString().substring(2).toStringUtf8();
				
				log.debug("Agent Response: {}", responseText);
				responseTexts.add(responseText);
			});
		});

		return responseTexts;
	}
}
