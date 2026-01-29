package com.rush.dao;

import java.util.List;

import org.springframework.stereotype.Component;

import com.rush.entity.Employee;

@Component
public interface EmployeeDAO {

    Employee isUserExists(String loginId, String password);

    Employee findEmployeeById(int id);
    
    Employee findEmployeeByLoginId(String loginId);

    void saveEmployee(Employee newEmployee);

    List<Employee> getAllEmployees();

    void updateEmployee(Employee emp);

    void deleteEmployee(int id);
	
}
