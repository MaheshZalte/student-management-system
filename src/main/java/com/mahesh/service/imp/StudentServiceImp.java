package com.mahesh.service.imp;

import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mahesh.binding.Student;
import com.mahesh.repo.StudentRepo;
import com.mahesh.service.StudentService;

@Service
public class StudentServiceImp implements StudentService{

	@Autowired
	StudentRepo repo;
	
	@Override
	public String saveform(Student student) {
		
		com.mahesh.entity.Student entity = new com.mahesh.entity.Student();
		
		BeanUtils.copyProperties(student, entity);
		
		entity.setTiming(student.getTiming());
		
		repo.save(entity);
		
		return "Student Saved Success";
		
	}

	@Override
	public List<String> Allcourses() {
		return Arrays.asList("Java FullStack",".Net FullStack","Data Structure and Algo" , "MERN Stack","Python Full Stack","AI-ML", "Mobile Devlopment");
	}

	@Override
	public List<String> Alltiming() {
//		List<String> timing = ("Morning","Afternoon","Evening");
		return Arrays.asList("Morning","Afternoon","Evening");
	}

	@Override
	public List<com.mahesh.entity.Student> AllStudent() {
		return repo.findAll();
	}

	@Override
	public com.mahesh.entity.Student getStudeById(int id) {
		Optional<com.mahesh.entity.Student> byId = repo.findById(id);
		com.mahesh.entity.Student student = byId.get();
		return student;
	}

	@Override
	public void deleteStudent(int id) {
		
		repo.deleteById(id);
		
	}

}
