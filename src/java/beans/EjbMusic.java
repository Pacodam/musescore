/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import entities.User;
import exceptions.MusicException;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;

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
}
