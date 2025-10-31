package com.mahesh.service;

import java.util.List;
import java.util.Optional;

import com.mahesh.binding.Student;

public interface StudentService {
	String saveform(Student student);
	
	List<String> Allcourses();
	
	List<String> Alltiming(); 
	
	List<com.mahesh.entity.Student> AllStudent();
	
	com.mahesh.entity.Student getStudeById(int id);
	
	void deleteStudent(int id);
}
