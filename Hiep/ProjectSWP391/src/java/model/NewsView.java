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
public class NewsView {

    private int news_id;
    private String newsgroup_name;
    private String image;
    private String title;
    private String createby;
    private String content;
    private String day;
    private String month;
    private String year;
    private String modifyby;
    private Date modify_date;

    public NewsView() {
    }

    public NewsView(int news_id, String newsgroup_name, String image, String title, String createby, String content, String day, String month, String year, String modifyby, Date modify_date) {
        this.news_id = news_id;
        this.newsgroup_name = newsgroup_name;
        this.image = image;
        this.title = title;
        this.createby = createby;
        this.content = content;
        this.day = day;
        this.month = month;
        this.year = year;
        this.modifyby = modifyby;
        this.modify_date = modify_date;
    }

    public int getNews_id() {
        return news_id;
    }

    public void setNews_id(int news_id) {
        this.news_id = news_id;
    }

    public String getNewsgroup_name() {
        return newsgroup_name;
    }

    public void setNewsgroup_name(String newsgroup_name) {
        this.newsgroup_name = newsgroup_name;
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

    public String getCreateby() {
        return createby;
    }

    public void setCreateby(String createby) {
        this.createby = createby;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getDay() {
        return day;
    }

    public void setDay(String day) {
        this.day = day;
    }

    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
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
