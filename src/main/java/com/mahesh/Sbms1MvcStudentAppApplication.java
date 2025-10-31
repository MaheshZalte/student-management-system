package com.mahesh;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.mahesh.repo.StudentRepo;

@SpringBootApplication
public class Sbms1MvcStudentAppApplication{

	@Autowired
	StudentRepo repo;
	public static void main(String[] args) {
		SpringApplication.run(Sbms1MvcStudentAppApplication.class, args);
	}
	
	

}
