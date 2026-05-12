package com.lms.Repository;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.lms.Entity.Trainer;

public interface TrainerRepository extends JpaRepository<Trainer, Integer>{
	public Optional<Trainer>  findByEmailAndPassword(String email,String password);
}
