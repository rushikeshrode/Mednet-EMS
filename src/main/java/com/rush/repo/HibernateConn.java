package com.rush.repo;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.stereotype.Repository;

@Repository
public class HibernateConn {
	
	private static SessionFactory factory;
	
	static {
		
		try {		
			factory = new Configuration().configure().buildSessionFactory();	
		} 
		catch (Exception e) {
			System.out.println(">> Hibernate Connection Failed .. !!");
			System.out.println(e.getMessage());
		}
		
	}
	
	public static SessionFactory getSessionFactory() {
		return factory;		
	}
	

}
