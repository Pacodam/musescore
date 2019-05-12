/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import entities.SheetRanking;
import entities.Sheetmusic;
import entities.User;
import exceptions.MusicException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;
import javax.persistence.Query;

/**
 *
 * @author alu2017454
 */
@Stateless
public class EjbMusic {

    @PersistenceUnit
    EntityManagerFactory emf;
    
    public void insertUser(User t) throws MusicException {
        EntityManager em = emf.createEntityManager();
        User exist = em.find(User.class, t.getUsername());
        if (exist != null) {
            throw new MusicException("User already exists.");
        }
        em.persist(t);
        em.close();
    }
    
    public List<User> loginUser(User t) {
        EntityManager em = emf.createEntityManager();
        Query q = em.createNamedQuery("User.findByUsernameAndPass");
        q.setParameter("username", t.getUsername());
        q.setParameter("password", t.getPassword());
        return q.getResultList();
        
    }
    
    public User getUser(String username){
        EntityManager em = emf.createEntityManager();
        User user = em.find(User.class, username);
        return user;
    }
    
    public void insertSheet(Sheetmusic s) {
        EntityManager em = emf.createEntityManager();
        em.persist(s);
        em.close();
    }
    
    public List<Sheetmusic> getSheetsFromUser(User u){
        EntityManager em = emf.createEntityManager();
        Query q = em.createNamedQuery("Sheetmusic.findByOwner");
        q.setParameter("owner", u);
        return q.getResultList();
    }
    
     public List<Sheetmusic> getSheets(){
        EntityManager em = emf.createEntityManager();
        Query q = em.createNamedQuery("Sheetmusic.findAll");
        return q.getResultList();
    }
    
    public Sheetmusic getSheetById(int id){
        EntityManager em = emf.createEntityManager();
        Sheetmusic orig = em.find(Sheetmusic.class, id);
       // Query q = em.createNamedQuery("Sheetmusic.findByIdsheetmusic");
        return orig;
        
    }
    
    public void modifySheet(Sheetmusic s){
        EntityManager em = emf.createEntityManager();
        Sheetmusic origin = getSheetById(s.getIdsheetmusic());
        if(origin != null){
            origin.setTitle(s.getTitle());
            origin.setArtist(s.getArtist());
            origin.setDifficulty(s.getDifficulty());
            origin.setGenre(s.getGenre());
            origin.setInstrument(s.getInstrument());
           em.persist(origin); 
           em.close();
        }  
    }
    
    
     // borrar find by id y remove
    public void deleteSheet(int sheetId){
        EntityManager em = emf.createEntityManager();
        Sheetmusic sheet = getSheetById(sheetId);
        sheet = em.merge(sheet);
        em.remove(sheet);  
    }
    
    
    public List<Sheetmusic> getSheetsByInstrument(String instrument){
         EntityManager em = emf.createEntityManager();
        Query q = em.createNamedQuery("Sheetmusic.findByInstrument");
        q.setParameter("instrument", instrument);
        return q.getResultList();
    }
    
    public List<User> getAllUsers(){
        EntityManager em = emf.createEntityManager();
        Query q = em.createNamedQuery("User.findAll");
        List<User> users = q.getResultList();
        return users;
    }

    public List<SheetRanking> getRanking() {
        EntityManager em = emf.createEntityManager();
        List<SheetRanking> ranking = new ArrayList<>();
        List<User> users = getAllUsers();
        for(User u: users){
            SheetRanking s = new SheetRanking();
            s.setOwner(u.getUsername());
            s.setNumber(u.getSheetmusicList().size());
            ranking.add(s);
        }
        Collections.sort(ranking);
        return ranking;
    }
    
   // SELECT e.dept.deptno as department_number , count(*) as total FROM Sheetmusic GROUP BY  by e.dept.deptno ORDER BY 1"
}
