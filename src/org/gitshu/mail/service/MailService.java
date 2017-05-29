package org.gitshu.mail.service;

import org.gitshu.mail.entity.MailEntity;

import java.util.List;

/**
 * Created by Lodour on 17/5/29 11:56.
 * 邮件服务接口
 */
public interface MailService {
    /**
     * 发送邮件
     *
     * @param from    发送人
     * @param to      接收人
     * @param content 内容
     */
    void send(int from, int to, String content);

    /**
     * 群发邮件
     *
     * @param group 接受邮件的ID
     */
    void sendGroup(int[] group);


    /**
     * 删除邮件
     *
     * @param id 邮件ID
     */
    void delete(int id);

    /**
     * 标记某邮件为已阅读
     *
     * @param id 邮件ID
     */
    void read(int id);


    /**
     * 获取用户未读邮件列表
     *
     * @param user 用户
     * @return 未读邮件实体列表
     */
    List<MailEntity> getUnread(int user);

    /**
     * 获取用户已读邮件列表
     *
     * @param user 用户
     * @return 已读邮件列表
     */
    List<MailEntity> getRead(int user);

    /**
     * 获取用户所有邮件列表
     *
     * @param user 用户
     * @return 所有邮件列表
     */
    List<MailEntity> getAll(int user);

    /**
     * 获取用户发送邮件列表
     *
     * @param author 用户
     * @return 发送邮件列表
     */
    List<MailEntity> getSendList(int author);

    /**
     * 获取邮件实体
     *
     * @param id 邮件ID
     * @return 邮件实体
     */
    MailEntity getById(int id);
}
