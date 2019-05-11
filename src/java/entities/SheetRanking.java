/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

/**
 *
 * @author MSI
 */
public class SheetRanking implements Comparable<SheetRanking> {
    
    private String owner;
    private int number;
    
    public SheetRanking(String owner, int number){
        this.owner = owner;
        this.number = number;
    }

    @Override
    public int compareTo(SheetRanking o) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
