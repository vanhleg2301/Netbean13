/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package utils;
import org.junit.Assert;
import org.junit.Test;

import java.util.HashSet;
import java.util.Set;

import jakarta.mail.MessagingException;
/**
 *
 * @author DELL
 */
public class SendGmailTest {
    
    public SendGmailTest() {
    }

    @Test
    public void testIsValidEmail() {
        SendGmail utils = new SendGmail();

        // Test valid email addresses
        Assert.assertTrue(utils.isValidEmail("example@gmail.com"));
        Assert.assertTrue(utils.isValidEmail("john.doe@example.com"));
        Assert.assertTrue(utils.isValidEmail("jane.doe123@example.co.uk"));

        // Test invalid email addresses
        Assert.assertFalse(utils.isValidEmail("example.com")); // Missing @ symbol
        Assert.assertFalse(utils.isValidEmail("john.doe@")); // Missing domain
        Assert.assertFalse(utils.isValidEmail("@example.com")); // Missing username
        Assert.assertFalse(utils.isValidEmail("jane.doe@com")); // Invalid TLD
        Assert.assertFalse(utils.isValidEmail("johndoe")); // Missing @ and TLD
    }

   @Test
    public void testGenerateOTP() {
        SendGmail generator = new SendGmail();

        // Test the length of the generated OTP
        String otp = generator.generateOTP();
        Assert.assertEquals(6, otp.length());

        // Test that the generated OTP is a valid number
        try {
            int parsedOTP = Integer.parseInt(otp);
            // OTP should be a 6-digit number, so it should be between 100000 and 999999
            Assert.assertTrue(parsedOTP >= 100000 && parsedOTP <= 999999);
        } catch (NumberFormatException e) {
            Assert.fail("Generated OTP is not a valid number");
        }

        // Test that multiple invocations of the method produce different results
        Set<String> uniqueOTPs = new HashSet<>();
        int numberOfIterations = 1000; // Increase the number of iterations for more thorough testing
        for (int i = 0; i < numberOfIterations; i++) {
            String generatedOTP = generator.generateOTP();
            Assert.assertTrue(uniqueOTPs.add(generatedOTP));
        }
        Assert.assertEquals(numberOfIterations, uniqueOTPs.size());
        

//        SendGmail generator = new SendGmail();
//
//        // Test the length of the generated OTP
//        String otp = generator.generateOTP();
//        Assert.assertEquals(6, otp.length());
//
//        // Test that the generated OTP is a valid number
//        try {
//            int parsedOTP = Integer.parseInt(otp);
//            // OTP should be a 6-digit number, so it should be between 100000 and 999999
//            Assert.assertTrue(parsedOTP >= 100000 && parsedOTP <= 999999);
//        } catch (NumberFormatException e) {
//            Assert.fail("Generated OTP is not a valid number");
//        }
//
//        // Test that multiple invocations of the method produce different results
//        Set<String> uniqueOTPs = new HashSet<>();
//        for (int i = 0; i < 100; i++) {
//            uniqueOTPs.add(generator.generateOTP());
//        }
//        Assert.assertEquals(100, uniqueOTPs.size());
    }

    @Test
    public void testSendOTPToEmail() {
        SendGmail sendGmail = new SendGmail();
        String email = "recipient@example.com";
        String otp = "123456";
        String content = "Your OTP code is: ";

        sendGmail.sendOTPToEmail(email, otp, content); // If an exception is thrown, the test fails
        // If no exception is thrown, consider the email sent successfully
        Assert.assertTrue(true);
    }
    
}
