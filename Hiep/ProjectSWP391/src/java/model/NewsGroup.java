/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Lenovo
 */
public class NewsGroup {
    private int newsgroup_id;
    private String newsgroup_name;

    public NewsGroup() {
    }

    public NewsGroup(int newsgroup_id, String newsgroup_name) {
        this.newsgroup_id = newsgroup_id;
        this.newsgroup_name = newsgroup_name;
    }

    public int getNewsgroup_id() {
        return newsgroup_id;
    }

    public void setNewsgroup_id(int newsgroup_id) {
        this.newsgroup_id = newsgroup_id;
    }

    public String getNewsgroup_name() {
        return newsgroup_name;
    }

    public void setNewsgroup_name(String newsgroup_name) {
        this.newsgroup_name = newsgroup_name;
    }

    
    
    
}
