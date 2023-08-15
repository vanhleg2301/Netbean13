/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Java_65_Map;

import static java.lang.reflect.Array.set;
import java.util.Arrays;
import java.util.Map;
import java.util.Scanner;
import java.util.Set;
import java.util.TreeMap;

/**
 *
 * @author DELL
 */
public class TuDien {
    private Map<String, String> data = new TreeMap<String, String>();
// Map<Key, value> Từ khóa là String và ý nghĩa của nó cũng là String
    
    public static void main(String[] args) {
        CheckValue cv = new CheckValue();
        TuDien td = new TuDien();
        while(true){
            System.out.println("1.add");
            System.out.println("2.delete");
            System.out.println("3.find");
            System.out.println("4.display");
            System.out.println("5.getAmount");
            System.out.println("6.clear");
            System.out.println("0.quit");   
            System.out.println("------------------------------");
            System.out.print("Your choice: ");
            int choice = cv.getLimit(0, 6);
            switch(choice){
                case 1:
                    String newWord = cv.getString("Enter new word: ", "Enter new Word again: ");
                    String mean = cv.getString("Enter meaning for new word: ", "Enter meaning again: ");
                    td.addWord(newWord, mean);
                    break;
                case 2:
                    newWord = cv.getString("Enter new word: ", "Enter new Word again: ");
                    td.remove(newWord);
                    break;
                case 3:
                    newWord = cv.getString("Enter new word: ", "Enter new Word again: ");
                    td.findMean(newWord);
                    break;
                case 4: 
                    td.displayAll();
                    break;
                case 5: 
                    td.getAmount();
                    break;
                case 6: 
                    td.clearAll();
                    break;
                case 0:
                    return;
            }
        }   
    }
    
    public String addWord(String newWord, String mean) {
        return this.data.put(newWord, mean);
    }
    
    public String remove(String newWord) {
        return this.data.remove(newWord);
    }
    
    public String findMean(String newWord) {
        String mean = this.data.get(newWord);
        return mean;
    }
    
    public void displayAll(){
        Set<String> all = this.data.keySet(); // lay ra toan bo du lieu 
        System.out.println(Arrays.toString(all.toArray()));
    }
    
    public int getAmount() {
        return this.data.size();
    }
    
    public void clearAll() {
        this.data.clear();
    }
}
