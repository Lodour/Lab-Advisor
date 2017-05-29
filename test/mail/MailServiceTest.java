package mail;

import org.gitshu.entity.MailEntity;
import org.gitshu.mail.service.MailService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

/**
 * Created by Lodour on 17/5/28 09:21.
 * 测试UserDAO
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring-config.xml")
public class MailServiceTest {
    @Autowired
    private MailService mailService;

    @Test
    public void sendTest() {
        mailService.send("lll", "pp", "Hello!");
    }

    @Test
    public void inboxTest() {
        List<MailEntity> mailEntityList = mailService.getInbox("pp");
        outputMailEntityList(mailEntityList);
    }

    @Test
    public void outboxTest() {
        List<MailEntity> mailEntityList = mailService.getOutbox("lll");
        outputMailEntityList(mailEntityList);
    }

    @Test
    public void markTest() {
        MailEntity mailEntity;

        mailEntity = mailService.getById(1);
        System.out.print(mailEntity.getIsRead());

        mailService.read(mailEntity.getId());
        mailEntity = mailService.getById(1);
        System.out.print(" -> " + mailEntity.getIsRead());

        mailService.unread(mailEntity.getId());
        mailEntity = mailService.getById(1);
        System.out.println(" -> " + mailEntity.getIsRead());
    }

    private void outputMailEntityList(List<MailEntity> mailEntityList) {
        for (MailEntity mailEntity : mailEntityList) {
            System.out.print("#" + mailEntity.getId() + " ");
            System.out.print(mailEntity.getCreateTime() + ": ");
            System.out.print(mailEntity.getUserByAuthor().getUsername() + " -> ");
            System.out.print(mailEntity.getUserByReceiver().getUsername() + " ");
            System.out.print("[" + mailEntity.getIsRead() + "] ");
            System.out.println(mailEntity.getContent());
        }
    }
}
