package com.lms.Repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.lms.Entity.Student;

public interface StudentRepository extends JpaRepository<Student, Integer> {
	public Optional<Student> findByEmailAndPassword(String email,String password);
	public List<Student> findByTrainerId(Integer id);

}
