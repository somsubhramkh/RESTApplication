package backend.controller;

import java.util.Date;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import backend.model.Message;
import backend.model.OutputMessage;

@Controller

public class ChatController {

    
  @MessageMapping("/chat")
  @SendTo("/topic/message")
  public OutputMessage sendMessage(Message message) {
    return new OutputMessage(message, new Date());
  }
}
