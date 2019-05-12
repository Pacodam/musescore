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
    
    public SheetRanking(){}
    public SheetRanking(String owner, int number){
        this.owner = owner;
        this.number = number;
    }

    public void setOwner(String owner) {
        this.owner = owner;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public String getOwner() {
        return owner;
    }

    public int getNumber() {
        return number;
    }
    
    
    
    

    @Override
    public int compareTo(SheetRanking o) {
        return o.getNumber() - number;
    }
}
