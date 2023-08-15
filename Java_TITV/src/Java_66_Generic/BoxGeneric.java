/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Java_66_Generic;

/**
 *
 * @author DELL
 */
public class BoxGeneric<T> { // T is type 
    private T value;

    public BoxGeneric(T value) {
        this.value = value;
    }

    public T getValue() {
        return value;
    }

    public void setValue(T value) {
        this.value = value;
    }
    
    
}
