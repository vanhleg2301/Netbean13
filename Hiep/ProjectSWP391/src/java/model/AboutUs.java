/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Lenovo
 */
public class AboutUs {

    private int news_id;
    private int newsgroup_id;
    private String image;
    private String title;
    private String content;

    public AboutUs() {
    }

    public AboutUs(int news_id, int newsgroup_id, String image, String title, String content) {
        this.news_id = news_id;
        this.newsgroup_id = newsgroup_id;
        this.image = image;
        this.title = title;
        this.content = content;
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

   

}
