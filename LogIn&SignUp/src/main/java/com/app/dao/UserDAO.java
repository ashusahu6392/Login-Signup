package com.app.dao;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.app.entity.User;
import com.app.util.HibernateUtil;

public class UserDAO {
	
	public boolean saveUser(User user) {
		
		Transaction tx = null;
		
		try(Session session = HibernateUtil.getSessionFactory().openSession()){
			tx = session.beginTransaction();
			
			session.persist(user);
			tx.commit();
			return true;
			
		}catch (Exception e) {
			// TODO: handle exception
			if(tx != null) tx.rollback();
			e.printStackTrace();
			return false;
		}
	}
	
	
	 public User loginUser(String email, String password) {

	        User user = null;

	        try (Session session = HibernateUtil.getSessionFactory().openSession()) {

	            String hql = "FROM User WHERE email = :email AND password = :password";
	            Query<User> query = session.createQuery(hql, User.class);
	            query.setParameter("email", email);
	            query.setParameter("password", password);

	            user = query.uniqueResult(); // null if not found
	        }

	        return user;
	    }
	 
	 public User findById(int id) {
		    Session session = HibernateUtil.getSessionFactory().openSession();
		    User user = session.find(User.class, id);
		    session.close();
		    return user;
		}
	 
	 public boolean updateUser(User user) {
		 Transaction tx = null;
		 
		 try(Session session = HibernateUtil.getSessionFactory().openSession()){
				tx = session.beginTransaction();
				
				session.merge(user);
				tx.commit();
				return true;
				
			}catch (Exception e) {
				// TODO: handle exception
				if(tx != null) tx.rollback();
				e.printStackTrace();
				return false;
			}
	 }
	 
	 public boolean updateProfileImage(int id, String imageName) {
		    boolean status = false;

		    Transaction tx = null;

		    try (Session session = HibernateUtil.getSessionFactory().openSession()) {

		        tx = session.beginTransaction();

		        User user = session.find(User.class, id);

		        if (user != null) {
		            user.setProfileImage(imageName);
		            session.merge(user);
		            status = true;
		        }

		        tx.commit();

		    } catch (Exception e) {
		        if (tx != null) tx.rollback();
		        e.printStackTrace();
		    }

		    return status;
		}

	 
	 

}












