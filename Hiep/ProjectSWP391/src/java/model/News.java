/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author Lenovo
 */
public class News {

    private int news_id;
    private int newsgroup_id;
    private String image;
    private String title;
    private String content;
    private String createby;
    private Date created_date;
    private String modifyby;
    private Date modify_date;

    public News() {
    }

    public News(int news_id, String title) {
        this.news_id = news_id;
        this.title = title;
    }

    public News(int news_id, String title, String content) {
        this.news_id = news_id;
        this.title = title;
        this.content = content;
    }

    public News(int news_id, int newsgroup_id, String image, String title, String content, String createby, Date created_date, String modifyby, Date modify_date) {
        this.news_id = news_id;
        this.newsgroup_id = newsgroup_id;
        this.image = image;
        this.title = title;
        this.content = content;
        this.createby = createby;
        this.created_date = created_date;
        this.modifyby = modifyby;
        this.modify_date = modify_date;
    }

    public int getNews_id() {
        return news_id;
    }

    public void setNews_id(int news_id) {
        this.news_id = news_id;
    }

    public int getNewsgroup_id() {
        return newsgroup_id;
    }

    public void setNewsgroup_id(int newsgroup_id) {
        this.newsgroup_id = newsgroup_id;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCreateby() {
        return createby;
    }

    public void setCreateby(String createby) {
        this.createby = createby;
    }

    public Date getCreated_date() {
        return created_date;
    }

    public void setCreated_date(Date created_date) {
        this.created_date = created_date;
    }

    public String getModifyby() {
        return modifyby;
    }

    public void setModifyby(String modifyby) {
        this.modifyby = modifyby;
    }

    public Date getModify_date() {
        return modify_date;
    }

    public void setModify_date(Date modify_date) {
        this.modify_date = modify_date;
    }

}
