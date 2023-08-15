/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

import dao.DAOAdmin;
import dao.DAOCustomer;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Month;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import model.Admin;
import model.Customer;

/**
 *
 * @author Lenovo
 */
public class Vadidate {

    public boolean checkGmail(String gmail) {
        return gmail.matches("[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}");
    }

//    public boolean checkUsername(String username) {
//        if (username.length() >= 6) {
//            return true;
//        } else {
//            return false;
//        }
//    }
    public boolean checkPassword(String password) {
        if (password.length() < 6) {
            return false;
        }
        Pattern pattern = Pattern.compile("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]+$");
        Matcher matcher = pattern.matcher(password);
        return matcher.matches();
    }

    public boolean checkPhone(String str) {
        boolean isNumeric = true;
        for (int i = 0; i < str.length(); i++) {
            if (!Character.isDigit(str.charAt(i))) {
                isNumeric = false;
                break;
            }
        }
        return isNumeric;
    }

    public boolean checkAccountAdmin(String str) {
        DAOAdmin dao = new DAOAdmin();
        ArrayList<Admin> admins = new ArrayList<>();
        admins = dao.getAllAdmin();
        if (admins.size() >= 1) {
            for (int i = 0; i < admins.size(); i++) {
                if (str.equals(admins.get(i).getUsername())) {
                    return false;
                }
            }
        }
        if (admins.size() < 1) {
            return true;
        }
        return true;
    }

    public boolean checkAccountCustomer(String str) {
        DAOCustomer dao = new DAOCustomer();
        ArrayList<Customer> customers = new ArrayList<>();
        customers = dao.getAllCustomer();
        if (customers.size() >= 1) {
            for (int i = 0; i < customers.size(); i++) {
                if (str.equals(customers.get(i).getUsername())) {
                    return false;
                }
            }     
        }
        if (customers.size() < 1) {
            return true;
        }
        return true;
    }

    public boolean checkAccountGmailCustomer(String str) {
        DAOCustomer dao = new DAOCustomer();
        ArrayList<Customer> customers = new ArrayList<>();
        customers = dao.getAllCustomer();
        if (customers.size() >= 1) {
            for (int i = 0; i < customers.size(); i++) {
                if (str.equals(customers.get(i).getGmail())) {
                    return false;
                }
            }
        }
        if (customers.size() < 1) {
            return true;
        }
        return true;
    }

    public boolean checkAccountGmailAdmin(String str) {
        DAOAdmin dao = new DAOAdmin();
        ArrayList<Admin> admins = new ArrayList<>();
        admins = dao.getAllAdmin();
        if (admins.size() >= 1) {
            for (int i = 0; i < admins.size(); i++) {
                if (str.equals(admins.get(i).getGmail())) {
                    return false;
                }
            }
        }
        if (admins.size() < 1) {
            return true;
        }
        return true;
    }

    public String hashPassword(String password) {
        try {
            // Tạo đối tượng MessageDigest với thuật toán SHA-256
            MessageDigest md = MessageDigest.getInstance("SHA-256");

            // Mã hóa mật khẩu
            byte[] hashedBytes = md.digest(password.getBytes());

            // Chuyển đổi byte thành chuỗi hex
            StringBuilder sb = new StringBuilder();
            for (byte b : hashedBytes) {
                sb.append(String.format("%02x", b));
            }
            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return null;
    }

    public String convertMonthNumberToName(String monthNumber) {
        int monthInt = Integer.parseInt(monthNumber);
        Month month = Month.of(monthInt);
        String monthName = month.toString();
        return monthName;
    }

    public String generateRandomString() {
        String lowercaseLetters = "abcdefghijklmnopqrstuvwxyz";
        String uppercaseLetters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        String digits = "0123456789";
        String specialChars = "@$!%*?&";

        StringBuilder stringBuilder = new StringBuilder();

        // Randomly choose one character from each category
        char randomLowercaseLetter = getRandomChar(lowercaseLetters);
        char randomUppercaseLetter = getRandomChar(uppercaseLetters);
        char randomDigit = getRandomChar(digits);
        char randomSpecialChar = getRandomChar(specialChars);

        stringBuilder.append(randomLowercaseLetter);
        stringBuilder.append(randomUppercaseLetter);
        stringBuilder.append(randomDigit);
        stringBuilder.append(randomSpecialChar);

        // Fill the remaining two characters with random choices
        Random random = new Random();
        for (int i = 0; i < 2; i++) {
            int randomIndex = random.nextInt(3);
            switch (randomIndex) {
                case 0:
                    stringBuilder.append(getRandomChar(lowercaseLetters));
                    break;
                case 1:
                    stringBuilder.append(getRandomChar(uppercaseLetters));
                    break;
                case 2:
                    stringBuilder.append(getRandomChar(digits));
                    break;
                case 3:
                    stringBuilder.append(getRandomChar(specialChars));
                    break;
            }
        }

        String randomString = stringBuilder.toString();

        // Ensure the random string matches the required pattern
        if (!Pattern.matches("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]+$", randomString)) {
            randomString = generateRandomString(); // Recursive call if the pattern is not matched
        }

        return randomString;
    }

    public char getRandomChar(String characters) {
        Random random = new Random();
        int randomIndex = random.nextInt(characters.length());
        return characters.charAt(randomIndex);
    }
    
}
