package com.lms.Controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lms.Entity.Student;
import com.lms.Entity.Trainer;
import com.lms.Service.StudentService;
import com.lms.Service.TrainerService;

@Controller
@RequestMapping("/student")
public class StudentController {

    @Autowired
    StudentService ser;
    
    @Autowired
    TrainerService trainerService;

    @GetMapping("/register")
    public String showRegister(Model model) {
        List<Trainer> trainers = trainerService.fetchAll();
        model.addAttribute("trainers", trainers);
        return "student-register";
    }

    @GetMapping("/login")
    public String showLogin() {
        return "student-login";
    }

    @PostMapping("/register")
    public String save(Student std, @RequestParam Integer trainerId) {

        Trainer trainer = trainerService.fetch(trainerId).get();

        std.setTrainer(trainer);

        ser.save(std);

        return "student-login";
    }
    @PostMapping("/login")
    public String validate(@RequestParam String email,
                           @RequestParam String password,
                           Model model) {
        Optional<Student> op = ser.validate(email, password);

        if (op.isPresent()) {
            return "student-dashboard";
        } else {
            model.addAttribute("msg", "Invalid email or password. Login again.");
            return "student-login";
        }
    }

    @PostMapping("/deleteStudent")
    public String delete(@RequestParam(value = "id", required = false) Integer id, Model model) {
        if (id == null) {
            model.addAttribute("msg", "Please enter a valid student ID");
            return "student-dashboard";
        }

        ser.delete(id);
        return "redirect:/student/viewAll";
    }

    @GetMapping("/dashboard")
    public String dashboard() {
        return "student-dashboard";
    }

    @PostMapping("/fetchStudent")
    public String fetch(@RequestParam(value = "id", required = false) Integer id, Model model) {
        if (id == null) {
            model.addAttribute("msg", "Please enter a valid student ID");
            return "student-dashboard";
        }

        Optional<Student> op = ser.fetch(id);

        if (op.isPresent()) {
            model.addAttribute("student", op.get());
            return "student-view";
        } else {
            model.addAttribute("msg", "Student ID not found");
            return "student-dashboard";
        }
    }

    @GetMapping("/update")
    public String showUpdateForm(@RequestParam(value = "id", required = false) Integer id, Model model) {

        if (id == null) {
            model.addAttribute("msg", "Please enter a valid student ID");
            return "student-dashboard";
        }

        Optional<Student> op = ser.fetch(id);

        if (op.isPresent()) {
            List<Trainer> trainers = trainerService.fetchAll();

            model.addAttribute("student", op.get());
            model.addAttribute("trainers", trainers);

            return "student-update";
        } else {
            model.addAttribute("msg", "Student ID not found");
            return "student-dashboard";
        }
    }

    @PostMapping("/update")
    public String update(Student std, @RequestParam Integer trainerId) {

        Trainer trainer = trainerService.fetch(trainerId).get();

        std.setTrainer(trainer);

        ser.update(std);

        return "student-dashboard";
    }

    @GetMapping("/viewAll")
    public String viewAllStudents(Model model) {
        List<Student> students = ser.fetchAll();
        model.addAttribute("students", students);
        return "student-list";
    }
}