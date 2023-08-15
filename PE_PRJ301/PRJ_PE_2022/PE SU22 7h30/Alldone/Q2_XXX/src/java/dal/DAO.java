/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Account;
import model.Book;

/**
 *
 * @author Admin
 */
public class DAO extends DBContext {

    public ArrayList<Account> getAccount() {
        ArrayList<Account> list = new ArrayList<>();
        String sql = "select * from [Account]";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Account a = new Account(rs.getString(1), rs.getString(2), rs.getString(3));
                list.add(a);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public ArrayList<Book> getBookByUid(String uid) {
        ArrayList<Book> list = new ArrayList<>();
        String sql = "select * from [Book] where added_by = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, uid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Book b = new Book(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDate(4), rs.getBoolean(5));
                list.add(b);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
}
