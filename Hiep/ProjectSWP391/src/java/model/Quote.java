/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Lenovo
 */
public class Quote {

    private int news_id;
    private int newsgroup_id;
    private String content;
    private String author;

    public Quote() {
    }

    public Quote(int news_id, int newsgroup_id, String content, String author) {
        this.news_id = news_id;
        this.newsgroup_id = newsgroup_id;
        this.content = content;
        this.author = author;
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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }
    
    
  
}
