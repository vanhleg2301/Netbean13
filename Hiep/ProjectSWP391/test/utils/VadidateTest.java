/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package utils;

import dao.DAOAdmin;
import dao.DAOCustomer;
import java.sql.Date;
import java.time.DateTimeException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;
import java.util.regex.Pattern;
import model.Admin;
import model.Customer;
import org.junit.Assert;
import static org.junit.Assert.*;
import org.junit.Test;
import utils.Vadidate;

/**
 *
 * @author msii
 */
public class VadidateTest {

    public VadidateTest() {
    }

    @Test
    public void testCheckGmail() {
        Vadidate validator = new Vadidate();

        assertTrue("Valid Gmail", validator.checkGmail("example@gmail.com"));
        assertFalse("Invalid Gmail - missing TLD", validator.checkGmail("example@gmail"));
        assertFalse("Invalid Gmail - missing username", validator.checkGmail("@gmail.com"));
        assertFalse("Invalid Gmail - invalid characters", validator.checkGmail("example!@gmail.com"));

        assertFalse("Invalid Gmail - missing domain", validator.checkGmail("example@.com"));
        assertFalse("Invalid Gmail - missing username and domain", validator.checkGmail("@"));
        assertFalse("Invalid Gmail - missing username and TLD", validator.checkGmail("@gmail"));
        assertFalse("Invalid Gmail - invalid TLD", validator.checkGmail("example@gmail.c"));

    }

    @Test
    public void testCheckPassword() {
        Vadidate checker = new Vadidate();

        // Kiểm thử mật khẩu không hợp lệ
        assertFalse(checker.checkPassword("12345")); // quá ngắn
        assertFalse(checker.checkPassword("abcdef")); // không có chữ hoa, không có số, không có ký tự đặc biệt
        assertFalse(checker.checkPassword("ABCD1234")); // không có chữ thường, không có ký tự đặc biệt
        assertFalse(checker.checkPassword("abcd@#$%")); // không có chữ hoa, không có số
        assertFalse(checker.checkPassword("aBcD1")); // quá ngắn, không có ký tự đặc biệt
        assertFalse(checker.checkPassword("abcABC123")); // không có ký tự đặc biệt

        // Kiểm thử mật khẩu hợp lệ
        assertTrue(checker.checkPassword("Abcd1234@")); // tất cả các yêu cầu được đáp ứng
        assertTrue(checker.checkPassword("abcA1@")); // độ dài tối thiểu, tất cả các yêu cầu được đáp ứng

        assertFalse(checker.checkPassword("abcABC@")); // quá ngắn, không có số
        assertFalse(checker.checkPassword("abcdefghi")); // không có chữ hoa, không có số, không có ký tự đặc biệt
        assertFalse(checker.checkPassword("123456789")); // không có chữ hoa, không có ký tự đặc biệt
        assertFalse(checker.checkPassword("@#$%^&*"));
    }

//public void testCheckPhone() {
//    // Test case 1: Valid phone number
//    String phoneNumber1 = "1234567890";
//    assertTrue(Vadidate.checkPhone(phoneNumber1));
//
//    // Test case 2: Invalid phone number with letters
//    String phoneNumber2 = "12a3456789";
//    assertFalse(Vadidate.checkPhone(phoneNumber2));
//
//    // Test case 3: Invalid phone number with symbols
//    String phoneNumber3 = "123-456-7890";
//    assertFalse(Vadidate.checkPhone(phoneNumber3));
//
//    // Test case 4: Empty string
//    String phoneNumber4 = "";
//    assertTrue(Vadidate.checkPhone(phoneNumber4));
//
//    // Additional test cases
//    assertFalse(Vadidate.checkPhone("12345678")); // quá ngắn
//    assertFalse(Vadidate.checkPhone("12345678901")); // quá dài
//    assertFalse(Vadidate.checkPhone("12345abcde")); // chứa ký tự không hợp lệ
//    assertFalse(Vadidate.checkPhone("12 34567890")); // chứa khoảng trắng
//}

    @Test
    public void testCheckAccountAdmin() {
        Vadidate test = new Vadidate();
        // Tạo đối tượng DAOAdmin để truy xuất dữ liệu từ CSDL
        DAOAdmin dao = new DAOAdmin();

        // Tạo hai đối tượng Admin với username là "admin1" và "admin2"
        Admin admin1 = new Admin(1, "admin", "John Doe", "1234567890", "johndoe@gmail.com", "admin1", "password", "active");
        Admin admin2 = new Admin(2, "admin", "Jane Doe", "0987654321", "janedoe@gmail.com", "admin2", "password", "active");

        // Thêm hai đối tượng Admin vào CSDL
        dao.insertAdmin(admin1);
        dao.insertAdmin(admin2);

        // Kiểm tra hàm trả về giá trị true khi đối số là một username chưa tồn tại trong CSDL
        assertTrue(test.checkAccountAdmin("admin3"));

        // Kiểm tra hàm trả về giá trị false khi đối số là một username đã tồn tại trong CSDL
        assertFalse(test.checkAccountAdmin("admin1"));
        
        assertTrue(test.checkAccountAdmin("")); // kiểm tra với username rỗng
        
        assertFalse(test.checkAccountAdmin("admin"));
        // Xóa hai đối tượng Admin khỏi CSDL
        dao.removeAdmin(admin1.getAdmin_id());
        dao.removeAdmin(admin2.getAdmin_id());


    }

    @Test
    public void testCheckAccountCustomer() {
        Vadidate test = new Vadidate();
        DAOCustomer dao = new DAOCustomer();
        Customer customer1 = new Customer(1, "John", "123456789", "image1.png",
                Date.valueOf("1990-01-01"), "john@gmail.com", true,
                "123 Main St, Anytown USA", "johndoe", "password", "active");
        Customer customer2 = new Customer(2, "Jane", "987654321", "image2.png",
                Date.valueOf("1995-05-05"), "jane@gmail.com", false,
                "456 Oak Ave, Anytown USA", "janedoe", "pass123", "inactive");

        // Test when there are no existing customers in the database
        assertTrue(dao.getAllCustomer().isEmpty());
        assertTrue(test.checkAccountCustomer(customer1.getUsername()));

        // Test when there is an existing customer in the database with the same username
        dao.insertCustomer(customer1);
        assertFalse(test.checkAccountCustomer(customer1.getUsername()));

        // Test when there are multiple existing customers in the database with different usernames
        dao.insertCustomer(customer2);
        assertTrue(test.checkAccountCustomer("randomUsername"));
        assertFalse(test.checkAccountCustomer(customer1.getUsername()));
        assertFalse(test.checkAccountCustomer(customer2.getUsername()));

        // Clean up by removing added customers from the database
        dao.deleteCustomer(customer1.getCustomer_id());
        dao.deleteCustomer(customer2.getCustomer_id());
    }

    @Test
    public void testCheckAccountGmailCustomer() {
        Vadidate test = new Vadidate();
        // Test case 1: check with empty customer list
        DAOCustomer dao = new DAOCustomer();
        ArrayList<Customer> customers = new ArrayList<>();
        boolean result = test.checkAccountGmailCustomer("test@gmail.com");
        assertTrue(result);

        // Test case 2: check with one customer having different gmail
        Customer customer = new Customer(1, "John Doe", "1234567890", "", Date.valueOf("1990-01-01"), "johndoe@gmail.com", true, "123 Main St", "johndoe", "password", "active");
        customers.add(customer);
        dao.insertCustomer(customer);
        result = test.checkAccountGmailCustomer("test1@gmail.com");
        assertTrue(result);

        // Test case 3: check with one customer having same gmail
        result = test.checkAccountGmailCustomer("johndoe@gmail.com");
        assertFalse(result);

        // Test case 4: check with multiple customers having different gmails
        Customer customer2 = new Customer(2, "Jane Doe", "0987654321", "", Date.valueOf("1990-01-01"), "janedoe@gmail.com",
                false, "456 Elm St", "janedoe", "password", "active");
        customers.add(customer2);
        dao.insertCustomer(customer2);
        result = test.checkAccountGmailCustomer("test2@gmail.com");
        assertTrue(result);

        // Test case 5: check with multiple customers having same gmail
        Customer customer3 = new Customer(3, "Bob Smith", "5555555555", "", Date.valueOf("1990-01-01"), "johndoe@gmail.com",
                true, "789 Oak St", "bobsmith", "password", "active");
        customers.add(customer3);
        dao.insertCustomer(customer3);
        result = test.checkAccountGmailCustomer("janedoe@gmail.com");
        assertFalse(result);
        dao.deleteCustomer(1);
        dao.deleteCustomer(2);
        dao.deleteCustomer(3);

    }

    @Test
    public void testCheckAccountGmailAdmin() {
        Vadidate test = new Vadidate();
        // Test case 1: admin list is empty, the function should return true
        Admin admin = new Admin();
        assertEquals(true, test.checkAccountGmailAdmin("admin@example.com"));

        // Test case 2: admin list has one account with different email address, the function should return true
        DAOAdmin dao = new DAOAdmin();
        dao.insertAdmin(new Admin(1, "admin", "John Doe", "0123456789", "johndoe@example.com", "johndoe", "password", "active"));
        assertEquals(true, test.checkAccountGmailAdmin("admin@example.com"));

        // Test case 3: admin list has one account with the same email address, the function should return false
        dao.insertAdmin(new Admin(2, "admin", "Jane Smith", "0123456789", "janesmith@example.com", "janesmith", "password", "active"));
        assertEquals(false, test.checkAccountGmailAdmin("johndoe@example.com"));

        // Test case 4: admin list has multiple accounts with different email addresses, the function should return true
        dao.insertAdmin(new Admin(3, "admin", "Bob Johnson", "0123456789", "bjohnson@example.com", "bobjohnson", "password", "active"));
        assertEquals(true, test.checkAccountGmailAdmin("admin@example.com"));

        // Test case 5: admin list has multiple accounts with one same email address, the function should return false
        dao.insertAdmin(new Admin(4, "admin", "Mary Lee", "0123456789", "johndoe@example.com", "marylee", "password", "active"));
        assertEquals(false, test.checkAccountGmailAdmin("johndoe@example.com"));
        dao.removeAdmin(1);
        dao.removeAdmin(2);
        dao.removeAdmin(3);
        dao.removeAdmin(4);
    }

    @Test
    public void testHashPassword() {
        Vadidate hash = new Vadidate();

        // Test case 1: password rỗng
        String input1 = "";
        String expectedOutput1 = "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855";
        Assert.assertEquals(expectedOutput1, hash.hashPassword(input1));

        // Test case 2: password chứa ký tự đặc biệt
        String input2 = "P@ssword!123";
        String expectedOutput2 = "d5c14db08d7fbb47d332e7381da642a8b484b95302eaa9ec2dbd2bd8f18d56c9";
        Assert.assertEquals(expectedOutput2, hash.hashPassword(input2));

        // Test case 3: password có độ dài lớn
        String input3 = "This_Is_A_Long_Password_With_Many_Characters123456789";
        String expectedOutput3 = "2ee7170ee0c4a12e2efed1b57853fe1c826cf454224d87efb8a5f8abacd8154d";
        Assert.assertEquals(expectedOutput3, hash.hashPassword(input3));

        // Test case 4: password null
        String input4 = null;
        Assert.assertNull(hash.hashPassword(input4));
    }

    @Test
    public void testConvertMonthNumberToName() {
        Vadidate test = new Vadidate();
        // Test valid month numbers
        assertEquals("JANUARY", test.convertMonthNumberToName("1"));
        assertEquals("FEBRUARY", test.convertMonthNumberToName("2"));
        assertEquals("MARCH", test.convertMonthNumberToName("3"));
        assertEquals("APRIL", test.convertMonthNumberToName("4"));
        assertEquals("MAY", test.convertMonthNumberToName("5"));
        assertEquals("JUNE", test.convertMonthNumberToName("6"));
        assertEquals("JULY", test.convertMonthNumberToName("7"));
        assertEquals("AUGUST", test.convertMonthNumberToName("8"));
        assertEquals("SEPTEMBER", test.convertMonthNumberToName("9"));
        assertEquals("OCTOBER", test.convertMonthNumberToName("10"));
        assertEquals("NOVEMBER", test.convertMonthNumberToName("11"));
        assertEquals("DECEMBER", test.convertMonthNumberToName("12"));

        // Test invalid input
        try {
            test.convertMonthNumberToName("0");
            fail("Expected DateTimeException to be thrown");
        } catch (DateTimeException ex) {
            assertTrue(ex.getMessage().contains("Invalid value for MonthOfYear"));
        }
        try {
            test.convertMonthNumberToName("13");
            fail("Expected DateTimeException to be thrown");
        } catch (DateTimeException ex) {
            assertTrue(ex.getMessage().contains("Invalid value for MonthOfYear"));
        }

        // Test non-numeric input
        try {
            test.convertMonthNumberToName("january");
            fail("Expected NumberFormatException to be thrown");
        } catch (NumberFormatException ex) {
            assertTrue(ex.getMessage().contains("For input string"));
        }
    }

    @Test
    public void testGenerateRandomString() {
        Vadidate test = new Vadidate();
        // Test that the generated string has the correct length
        String randomString = test.generateRandomString();
        assertEquals(6, randomString.length());

        // Test that the generated string matches the required pattern
        assertTrue(Pattern.matches("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]+$", randomString));

        // Test that multiple invocations of the method produce different results
        Set<String> uniqueStrings = new HashSet<>();
        for (int i = 0; i < 100; i++) {
            uniqueStrings.add(test.generateRandomString());
        }
        assertEquals(100, uniqueStrings.size());
    }

    @Test
    public void testGetRandomChar() {
        Vadidate test = new Vadidate();
        String characters = "abcdefghijklmnopqrstuvwxyz";
        Set<Character> uniqueChars = new HashSet<>();

        // Test that multiple invocations of the method produce different results
        for (int i = 0; i < 100; i++) {
            char randomChar = test.getRandomChar(characters);
            assertTrue(characters.contains(String.valueOf(randomChar)));
            uniqueChars.add(randomChar);
        }
        assertTrue(uniqueChars.size() > 1);

        // Test that the method returns a valid character when the input string has only one character
        char singleChar = test.getRandomChar("a");
        assertEquals('a', singleChar);
    }

}
