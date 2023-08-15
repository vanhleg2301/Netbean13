/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package dao;

import java.util.ArrayList;
import model.Admin;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author DELL
 */
public class DAOAdminTest {
    
    public DAOAdminTest() {
    }

    @Test
    public void testGetAllAdmin() {
            // Create an instance of AdminDAO
    DAOAdmin adminDAO = new DAOAdmin();
    
    // Call the getAllAdmin() method to get the admin list
    ArrayList<Admin> adminList = adminDAO.getAllAdmin();
    
    // Assert that the adminList is not null
    assertNotNull(adminList);
    
    // Assert that the adminList contains at least one admin
    assertTrue(adminList.size() > 0);
    
    // Add more assertions to test the properties of each admin in the list
    for (Admin admin : adminList) {
        assertNotNull(admin.getAdmin_id());
        assertNotNull(admin.getUsername());
        assertNotNull(admin.getPassword());
        assertNotNull(admin.getName());
        assertNotNull(admin.getGmail());
        assertNotNull(admin.getPhone());
        assertNotNull(admin.getStatus());
        assertNotNull(admin.getRole());
    }
    }

    @Test
    public void testGetTotalPages() {
    }

    @Test
    public void testPagingAdmin() {
    }

    @Test
    public void testGetAdmin() {
    }

    @Test
    public void testSearchAdmin() {
    }

    @Test
    public void testInsertAdmin() {
    }

    @Test
    public void testUpdateAdmin() {
    }

    @Test
    public void testUpdateAdminStatus() {
    }

    @Test
    public void testCheckLogin() {
    }

    @Test
    public void testRemoveAdmin() {
    }

    @Test
    public void testChangePassword() {
    }

    @Test
    public void testUpdatePassword() {
    }

    @Test
    public void testSaveOTP() {
    }

    @Test
    public void testVerifyOTP() {
    }

    @Test
    public void testGetEmailFromSession() {
    }

    @Test
    public void testCheckUsernameAndEmailExists() {
    }

    @Test
    public void testEditProfileAdmin() {
    }
    
}
