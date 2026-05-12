package com.lms.Service;

import java.util.List;
import java.util.Optional;

import com.lms.Entity.Student;

public interface StudentService {
public Student save(Student std);
public void delete(Integer id);
public Optional<Student> fetch(Integer id);
public Student update(Student std);
public Optional<Student> validate(String email,String pass);
public List<Student> fetchAll();
public List<Student> fetchByTrainerId(Integer id);
}
 