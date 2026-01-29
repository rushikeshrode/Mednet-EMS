package com.rush.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rush.dao.EmployeeDAO;
import com.rush.entity.Employee;

@Service
@Transactional
public class EmployeeServiceImpl implements EmployeeService {
	
	 	@Autowired
	    private EmployeeDAO employeeDAO;


	    // LOGIN
	    @Override
	    public Employee login(String loginId, String password) {
	        return employeeDAO.isUserExists(loginId, password);
	    }


	    // REGISTER
	    @Override
	    public void register(Employee emp) throws Exception {
	    	
	    	Employee existing = employeeDAO.findEmployeeByLoginId(emp.getLoginId());

	    	if (existing != null)  
	    		throw new Exception("DUPLICATE_LOGIN_ID");

	        employeeDAO.saveEmployee(emp);
	        
	    }


	    // GET ALL
	    @Override
	    public List<Employee> getAllEmployees() {
	        return employeeDAO.getAllEmployees();
	    }


	    // FIND BY ID
	    @Override
	    public Employee getEmployeeById(int id) {
	        return employeeDAO.findEmployeeById(id);
	    }


	    // UPDATE
	    @Override
	    public void updateEmployee(Employee emp) {
	        employeeDAO.updateEmployee(emp);
	    }


	    // DELETE
	    @Override
	    public void deleteEmployee(int id) {
	        employeeDAO.deleteEmployee(id);
	    }

}
