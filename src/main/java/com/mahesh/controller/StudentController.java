package com.mahesh.controller;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mahesh.binding.Student;
import com.mahesh.service.StudentService;

@Controller
public class StudentController {

    @Autowired
    private StudentService service;

    @GetMapping("/")
    public String showStudentForm(Model model) {
        Student student = new Student();
        model.addAttribute("student", student);
        model.addAttribute("courses", service.Allcourses());
        model.addAttribute("timings", service.Alltiming());
        return "student-form";
    }

    @PostMapping("/save")
    public String saveform(Student student, Model model) {
        String msg = service.saveform(student);

        model.addAttribute("msg", msg);
        model.addAttribute("student", new Student());
        model.addAttribute("courses", service.Allcourses());
        model.addAttribute("timings", service.Alltiming());
        return "student-form";
    }

    @GetMapping("/student")
    public String AllStudents(Model model) {
        model.addAttribute("students", service.AllStudent());
        return "students";
    }

    @GetMapping("/edit")
    public String editStudent(@RequestParam("id") int id, Model model) {
        com.mahesh.entity.Student student = service.getStudeById(id);
        Student dto = new Student();
        BeanUtils.copyProperties(student, dto);
        dto.setTiming(student.getTiming());
        model.addAttribute("student", dto);
        model.addAttribute("courses", service.Allcourses());
        model.addAttribute("timings", service.Alltiming());
        return "student-form";
    }

    @GetMapping("/delete")
    public String deleteStudent(@RequestParam("id") int id) {
        service.deleteStudent(id);
        return "redirect:/student"; // ✅ Corrected path
    }
}
