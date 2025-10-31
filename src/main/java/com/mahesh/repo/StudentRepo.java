package com.mahesh.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.mahesh.entity.Student;

@Repository
public interface StudentRepo extends JpaRepository<Student , Integer>{

}
