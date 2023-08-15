/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package vnpay;

import java.util.HashMap;
import java.util.Map;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author DELL
 */
public class ConfigTest {
    
    public ConfigTest() {
    }

    @Test
    public void testMd5() {
        String input = "Hello World";
        String expectedOutput = "b10a8db164e0754105b7a99be72e3fe5"; // Expected MD5 hash value
        String actualOutput = Config.md5(input);
        assertEquals(expectedOutput, actualOutput);
    }

    @Test
    public void testSha256() {
        String input = "Hello World";
        String expectedOutput = "a591a6d40bf420404a011733cfb7b190d62c65bf0bcda32b57b277d9ad9f146e"; // Expected MD5 hash value
        String actualOutput = Config.Sha256(input);
        assertEquals(expectedOutput, actualOutput);
    }

    @Test
    public void testHashAllFields() {
        Map<String, String> fields = new HashMap<>();
        fields.put("amount", "10000");
        fields.put("currency", "USD");

        String expectedOutput = "f189dd7d478070f5d1aaf4dbbfe3e90056ea993a31cbeeb66b1577f133f61efc"; // Expected HMAC SHA-512 hash value
        String actualOutput = Config.hashAllFields(fields);
        assertEquals(expectedOutput, actualOutput);
    }

    @Test
    public void testHmacSHA512() {
        String key = "secret";
        String data = "Hello World";
        String expectedOutput = "6d1d186ec481f3e7d1f604e7a74081140a713a8d8bac568e257ed1af9598f64f27f1f4bdaf0edfa1d316a1a7740647db38e7de82e77942cb98c4a08a4d17e89f"; // Expected HMAC SHA-512 hash value
        String actualOutput = Config.hmacSHA512(key, data);
        assertEquals(expectedOutput, actualOutput);
    }

    @Test
    public void testGetIpAddress() {
        
    }

    @Test
    public void testGetRandomNumber() {
        int length = 6;

        String actualOutput = Config.getRandomNumber(length);
        assertNotNull(actualOutput);
        assertEquals(length, actualOutput.length());
    }
    
}