package com.example.demo.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


import com.example.demo.bean.Students;
import com.example.demo.dao.StudentsRepository;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class StudentsController {
	
	@RequestMapping("/register")
	public String register(){
		return "register";
	}
	
	
	@Autowired
	StudentsRepository sr;
	
	
	@PostMapping("/create")
	public String create(@ModelAttribute Students std,HttpSession session) {
		
		try {
		Students s=sr.save(std);
		
		if(s!=null) {
			
			System.out.println("insert");
			session.setAttribute("reg-success","Registration Successfully");
			return "redirect:home";
		}
		}catch(DataIntegrityViolationException e){
			System.out.println("wrong!");
			session.setAttribute("failed-msg","Email Id already exists!!");
			return "register";
		}
		
		
		return "redirect:home"; 
		
		
		
	}
	
	
	@GetMapping("/update")
	public String update(@ModelAttribute Students s,HttpServletRequest req,HttpServletResponse res) {
		
		
		HttpSession session=req.getSession();
		session.setAttribute("students",s);
		
		return "update";
	}
	
	
	
	@PostMapping("/update")
	public String updateData(@ModelAttribute Students s,HttpServletRequest req,HttpServletResponse res) {
		
		
		Optional<Students> op=sr.findById(s.getId());
		Students s1=op.get();
		System.out.println(s.getFirstname());
		s1.setId(s.getId());
		s1.setFirstname(s.getFirstname());
		s1.setLastname(s.getLastname());
		s1.setPhoneno(s.getPhoneno());
		s1.setEmail(s.getEmail());
		s1.setPassword(s.getPassword());
		s1.setGender(s.getGender());
		
		
		sr.save(s1);
		 
		
		
		
		return "redirect:home";
		
	}
	
	@RequestMapping("/home")
	public List<Students> show(HttpServletRequest req,HttpServletResponse res){
		
		List<Students> list=new ArrayList<>();
		for(Students std:sr.findAll()) {
			list.add(std); 
		}
		HttpSession session=req.getSession();
		session.setAttribute("students",list);
		
		
		return list;
		
	}
	
	
	@RequestMapping("/delete")
	public String delete(Students s,HttpServletRequest req,HttpServletResponse res) {
		
		sr.deleteById(s.getId());
		List<Students> list=new ArrayList<>();
		
		for(Students std:sr.findAll()) {
			list.add(std);
		}
		
		HttpSession session=req.getSession();
		session.setAttribute("students",list);
		
		return "redirect:/home";
	}

}
