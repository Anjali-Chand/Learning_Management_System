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
@RequestMapping("/trainer")
public class TrainerController {

    @Autowired
    TrainerService ser;

    @Autowired
    StudentService studentService;
   
    @GetMapping("/register")
    public String showRegister() {
        return "trainer-register";
    }

  
    @GetMapping("/login")
    public String showLogin() {
        return "trainer-login";
    }

  
    @PostMapping("/register")
    public String save(Trainer tea) {
        ser.save(tea);
        return "trainer-login";
    }
   
   
    @PostMapping("/login")
    public String validate(@RequestParam String email,
                           @RequestParam String password,
                           Model model) {

        Optional<Trainer> op = ser.validate(email, password);

        if (op.isPresent()) {
            return "trainer-dashboard";
        } else {
            model.addAttribute("msg", "Invalid email or password");
            return "trainer-login";
        }
    }

    
    @GetMapping("/dashboard")
    public String dashboard() {
        return "trainer-dashboard";
    }

   
    @PostMapping("/fetchTrainer")
    public String fetch(@RequestParam(value = "id", required = false) Integer id, Model model) {

        if (id == null) {
            model.addAttribute("msg", "Please enter a valid trainer ID");
            return "trainer-dashboard";
        }

        Optional<Trainer> op = ser.fetch(id);

        if (op.isPresent()) {
            model.addAttribute("trainer", op.get());
            return "trainer-view";
        } else {
            model.addAttribute("msg", "Trainer ID not found");
            return "trainer-dashboard";
        }
    }
    
    @GetMapping("/assignedStudents")
    public String assignedStudents(@RequestParam Integer id, Model model) {

        Optional<Trainer> trainer = ser.fetch(id);
        List<Student> students = studentService.fetchByTrainerId(id);

        if (trainer.isPresent()) {
            model.addAttribute("trainer", trainer.get());
            model.addAttribute("students", students);
            return "assigned-students";
        } else {
            model.addAttribute("msg", "Trainer ID not found");
            return "trainer-dashboard";
        }
    }
  
    @PostMapping("/deleteTrainer")
    public String delete(@RequestParam(value = "id", required = false) Integer id, Model model) {

        if (id == null) {
            model.addAttribute("msg", "Please enter a valid trainer ID");
            return "trainer-dashboard";
        }

        ser.delete(id);
        return "redirect:/trainer/dashboard";
    }

  
    @GetMapping("/update")
    public String showUpdateForm(@RequestParam(value = "id", required = false) Integer id, Model model) {

        if (id == null) {
            model.addAttribute("msg", "Please enter a valid trainer ID");
            return "trainer-dashboard";
        }

        Optional<Trainer> op = ser.fetch(id);

        if (op.isPresent()) {
            model.addAttribute("trainer", op.get());
            return "trainer-update";
        } else {
            model.addAttribute("msg", "Trainer ID not found");
            return "trainer-dashboard";
        }
    }

   
    @PostMapping("/update")
    public String update(Trainer tea) {
        ser.update(tea);
        return "trainer-dashboard";
    }
    @GetMapping("/viewAll")
    public String viewAllTrainers(Model model) {
        List<Trainer> trainers = ser.fetchAll();
        model.addAttribute("trainers", trainers);
        return "trainer-list";
    }
}