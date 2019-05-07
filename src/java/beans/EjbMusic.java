/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import entities.Sheetmusic;
import entities.User;
import exceptions.MusicException;
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
    
    public Sheetmusic getSheetById(int id){
        EntityManager em = emf.createEntityManager();
        Sheetmusic orig = em.find(Sheetmusic.class, id);
       // Query q = em.createNamedQuery("Sheetmusic.findByIdsheetmusic");
        return orig;
        
    }
    
    public void modifySheet(Sheetmusic s){
        Sheetmusic origin = getSheetById(s.getIdsheetmusic());
        if(origin != null){
            //s.merge(origin);
            
        }
        
    }
    
    
}
