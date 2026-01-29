package com.rush.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.rush.dao.EmployeeDAO;
import com.rush.entity.Employee;
import com.rush.service.EmployeeService;

@Controller
public class EmployeeController {
	
	private static final String SESSION_USER = "loggedEmployee";
	
	@Autowired
	private EmployeeService employeeService;

	
	@GetMapping("/")
	public String goToHome() {
		return "index";
	}
	
	
	@GetMapping("/login")
	public String goToLogin() {
		return "login";
	}
	
	
	@PostMapping("/login")
	public String userLogin(@RequestParam String loginId, @RequestParam String password, HttpSession session) throws IOException, ServletException {
	
		System.out.println(loginId + " :: " +password);
		
		Employee loggedEmployee = employeeService.login(loginId, password);

	    if (loginId == null || password == null || loginId.isBlank() || password.isBlank() || loggedEmployee == null) {
	        return "redirect:/login";
	    }

		session.setAttribute(SESSION_USER, loggedEmployee);
		return "redirect:/allEmployee";
		
	}
	
	
	@GetMapping("/allEmployee")
	public String showAllEmployees(Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession(false);
		
	    Object loggedUser = session.getAttribute(SESSION_USER);
		System.out.println(">> Session Attribute::" + loggedUser);

	    if (session == null || session.getAttribute(SESSION_USER) == null || loggedUser == null) {
	        return "redirect:/login";
	    }
		
	    List<Employee> employees = employeeService.getAllEmployees();
	    model.addAttribute("employees", employees);
	    return "allEmployee"; 
	}
	
	
	@GetMapping("/register")
	public String goToRegister(Model model) {
		model.addAttribute("employee", new Employee());
		return "register";
	}
	
	
	@PostMapping("/register")
	public String userRegister(@ModelAttribute Employee newEmployee, Model model) {
		
		try {
			
	        employeeService.register(newEmployee);
	        return "redirect:/login";
	        
	    } catch (Exception e) {
			
	        if ("DUPLICATE_LOGIN_ID".equals(e.getMessage()))
	            model.addAttribute("error", "Login ID already taken. Please choose another.");
	        else
	            model.addAttribute("error", "Registration failed. Try again.");
	    }
		
		return "register";
		
	}
	
	@GetMapping("/print/{id}")
	public String printEmployee(@PathVariable int id, HttpSession session) {
		
		// Only Logged-In user must hv print url access
		Object loggedUser = session.getAttribute(SESSION_USER);
		System.out.println(">> Session Attribute:: " + loggedUser);
		
	    if (session == null || session.getAttribute(SESSION_USER) == null || loggedUser == null) {
	        return "redirect:/login";
	    }
		
	    Employee emp = employeeService.getEmployeeById(id);
	    session.setAttribute("printEmployee", emp);

	    return "printEmployee";
	}

	
	
	@GetMapping("/edit/{id}")
	public String updateEmployee(@PathVariable int id, HttpSession session) {
		
		// Only Logged-In user must hv edit and update url access
		Object loggedUser = session.getAttribute(SESSION_USER);
		System.out.println(">> Session Attribute::" + loggedUser);

	    if (loggedUser == null) {
	        return "redirect:/login";
	    }
	    
		System.out.println(id);
		Employee findEmployeeById = employeeService.getEmployeeById(id);
		session.setAttribute("findEmployeeById", findEmployeeById);
		
		return "editEmployee";
		
	}
	
	
	@PostMapping("/edit/updateEmployee")
	public String updateEmployee(HttpServletRequest request) {
		
		System.out.println("ID received = " + request.getParameter("id"));

	    Employee e = new Employee();
	    e.setId(Integer.parseInt(request.getParameter("id"))); 
	    e.setName(request.getParameter("name"));
	    e.setDob(LocalDate.parse(request.getParameter("dob")));
	    e.setGender(request.getParameter("gender"));
	    e.setAddress(request.getParameter("address"));
	    e.setCity(request.getParameter("city"));
	    e.setState(request.getParameter("state"));
	    e.setLoginId(request.getParameter("loginId"));
	    e.setPassword(request.getParameter("password"));

	    employeeService.updateEmployee(e);

	    return "redirect:/allEmployee";
	    
	}
	
	
	@GetMapping("/delete/{id}")
	public String deleteEmployee(@PathVariable int id, HttpSession session) {
		
		// Only Logged-In user must hv edit and update url access
		Object loggedUser = session.getAttribute(SESSION_USER);
		System.out.println(">> Session Attribute:: " + loggedUser);

	    if (loggedUser == null) {
	        return "redirect:/login";
	    }
	    
	    employeeService.deleteEmployee(id);
		return "redirect:/allEmployee";
		
	}
	
	
	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {

	    HttpSession session = request.getSession(false);
	    if (session != null) {
	        session.invalidate(); 
	    }

	    return "redirect:/login";
	    
	}
	
	
}
