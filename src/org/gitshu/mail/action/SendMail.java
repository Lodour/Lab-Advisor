package org.gitshu.mail.action;

import org.gitshu.mail.service.MailService;
import org.gitshu.utils.action.ActionVariableSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

/**
 * Created by Lodour on 17/5/29 21:27.
 * 发送邮件
 */
@Controller
public class SendMail extends ActionVariableSupport {
    private final MailService mailService;

    @Autowired
    public SendMail(MailService mailService) {
        this.mailService = mailService;
    }

    public String execute() {
        String author = (String) httpSession.get("username");
        String receiver = (String) httpServletRequest.getAttribute("username");
        String content = (String) httpServletRequest.getAttribute("content");
        try {
            mailService.send(author, receiver, content);
            return SUCCESS;
        } catch (Exception e) {
            return ERROR;
        }
    }
}
