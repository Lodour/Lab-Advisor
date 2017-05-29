package org.gitshu.mail.entity;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Created by Lodour on 17/5/29 11:54.
 * 站内信实体
 */
@Entity
@Table(name = "mail", schema = "test", catalog = "")
public class MailEntity {
    private int id;
    private int author;
    private int sendto;
    private Timestamp createTime;
    private byte isRead;
    private String content;
    private int type;

    @Id
    @Column(name = "id", nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "author", nullable = false)
    public int getAuthor() {
        return author;
    }

    public void setAuthor(int author) {
        this.author = author;
    }

    @Basic
    @Column(name = "sendto", nullable = false)
    public int getSendto() {
        return sendto;
    }

    public void setSendto(int sendto) {
        this.sendto = sendto;
    }

    @Basic
    @Column(name = "createTime", nullable = false)
    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    @Basic
    @Column(name = "isRead", nullable = false)
    public byte getIsRead() {
        return isRead;
    }

    public void setIsRead(byte isRead) {
        this.isRead = isRead;
    }

    @Basic
    @Column(name = "content", nullable = true, length = -1)
    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Basic
    @Column(name = "type", nullable = false)
    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        MailEntity that = (MailEntity) o;

        if (id != that.id) return false;
        if (author != that.author) return false;
        if (sendto != that.sendto) return false;
        if (isRead != that.isRead) return false;
        if (type != that.type) return false;
        if (createTime != null ? !createTime.equals(that.createTime) : that.createTime != null) return false;
        return content != null ? content.equals(that.content) : that.content == null;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + author;
        result = 31 * result + sendto;
        result = 31 * result + (createTime != null ? createTime.hashCode() : 0);
        result = 31 * result + (int) isRead;
        result = 31 * result + (content != null ? content.hashCode() : 0);
        result = 31 * result + type;
        return result;
    }
}
