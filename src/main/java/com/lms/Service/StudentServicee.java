package com.lms.Service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.lms.Entity.Student;
import com.lms.Repository.StudentRepository;

@Service
public class StudentServicee implements StudentService{
@Autowired
StudentRepository repo;
	@Override
	public Student save(Student std) {
		return repo.save(std);
	} 
	
	@Override
	public void delete(Integer id) {
		Optional<Student> op=repo.findById(id);
		if(op.isPresent())
	repo.deleteById(id);
	}
	@Override
	public Optional<Student> fetch(Integer id) {
		return repo.findById( id);
	}
	@Override
	public Student update(Student std) {
			return repo.save(std);
	}
	@Override
	public Optional<Student> validate(String email, String pass) {
		return repo.findByEmailAndPassword(email, pass);
	}

	@Override
	public List<Student> fetchAll() {
		List<Student> list=repo.findAll();
		return list;
	}

	@Override
	public List<Student> fetchByTrainerId(Integer id) {
		 return repo.findByTrainerId(id);
	}
	
}
