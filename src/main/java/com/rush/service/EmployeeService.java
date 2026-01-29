package com.rush.service;

import java.util.List;
import com.rush.entity.Employee;

public interface EmployeeService {
	
    Employee login(String loginId, String password);

    void register(Employee emp) throws Exception;

    List<Employee> getAllEmployees();

    Employee getEmployeeById(int id);

    void updateEmployee(Employee emp);

    void deleteEmployee(int id);

}
