package com.rush.dao;

import org.springframework.stereotype.Service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.*;


import com.rush.entity.Employee;
import com.rush.repo.HibernateConn;

@Service
public class EmployeeDAO {
	
	public Employee isUserExixts(String loginId, String pw) {
		
		Session session = HibernateConn.getSessionFactory().openSession();
		
		String query = "SELECT * FROM employees WHERE loginId = :loginId AND password = :password";
		List<Employee> employeesList = session.createNativeQuery(query, Employee.class)
										.setParameter("loginId", loginId)
										.setParameter("password", pw)
										.getResultList();
		
		session.close();
		
		return employeesList.isEmpty() ? null : employeesList.get(0);
		
	}
	
	public Employee findEmployeeById(int id) {
		
		Session session = HibernateConn.getSessionFactory().openSession();
		
		String query = "SELECT * FROM employees WHERE id = :id";
		List<Employee> employeesList = session.createNativeQuery(query, Employee.class)
										.setParameter("id", id)
										.getResultList();
		
		session.close();
		
		return employeesList.isEmpty() ? null : employeesList.get(0);
		
	}
	
	public void saveEmployee(Employee newEmployee) {
		
		Session session = HibernateConn.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();
		
		session.save(newEmployee);
		tx.commit();
		session.close();
		
	}
	
	public List<Employee> getAllEmployees() {
				
		Session session = HibernateConn.getSessionFactory().openSession();
		
		String query = "SELECT * FROM employees";
		List<Employee> employeesList = session.createNativeQuery(query, Employee.class).getResultList();
		
		session.close();
		return employeesList;
		
	}
	
	public void updateEmployee(Employee emp) {
		
		Session session = HibernateConn.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();
		
		Employee dbEmp = session.get(Employee.class, emp.getId());
        if (dbEmp == null) {
            throw new RuntimeException("Employee not found with id " + emp.getId());
        }

        dbEmp.setName(emp.getName());
        dbEmp.setDob(emp.getDob());
        dbEmp.setGender(emp.getGender());
        dbEmp.setAddress(emp.getAddress());
        dbEmp.setCity(emp.getCity());
        dbEmp.setState(emp.getState());
        dbEmp.setLoginId(emp.getLoginId());
        dbEmp.setPassword(emp.getPassword());
		
		tx.commit();	
		session.close();
		
	}
	
	public void deleteEmployee(int id) {
		
		Session session = null;
	    Transaction tx = null;

	    try {
	        session = HibernateConn.getSessionFactory().openSession();
	        tx = session.beginTransaction();

	        Employee emp = session.get(Employee.class, id);
	        if (emp != null) {
	            session.delete(emp);
	        }

	        tx.commit();

	    } 
	    catch (Exception e) {
	        if (tx != null) tx.rollback();
	        e.getMessage();
	    } 
	    finally {
	        if (session != null) session.close();
	    }
	    
	}
	

}
