package com.mahesh.binding;
import java.util.List;

import lombok.Data;

@Data
public class Student {
	private Integer id;
	
	private String name;
	
	private String email;
	
	private String gender;
	
	private String address;
	
	private String course;
	
	private List<String> timing;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCourse() {
		return course;
	}

	public void setCourse(String course) {
		this.course = course;
	}

	public List<String> getTiming() {
		return timing;
	}

	public void setTiming(List<String> timing) {
		this.timing = timing;
	}
	
	public Integer getId() {
	    return id;
	}

	public void setId(Integer id) {
	    this.id = id;
	}


	@Override
	public String toString() {
		return "Student [name=" + name + ", email=" + email + ", gender=" + gender + ", address=" + address + ", course="
				+ course + ", timing=" + timing + "]";
	}

}
