package com.lms.Service;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lms.Entity.Trainer;
import com.lms.Repository.TrainerRepository;

@Service
public class TrainerServicee implements TrainerService {
@Autowired
TrainerRepository repo;
	

	@Override
	public Trainer save(Trainer tea) {
		return repo.save(tea);
	}

	@Override
	public Trainer update(Trainer tea) {
		return repo.save(tea);
	}

	@Override
	public void delete(Integer id) {
		repo.deleteById(id);
	}

	@Override
	public Optional fetch(Integer id) {
	    return repo.findById(id);
	}

	@Override
	public Optional<Trainer> validate(String email, String pass) {
		return repo.findByEmailAndPassword(email, pass);
	}

	@Override
	public List<Trainer> fetchAll() {
		
		return repo.findAll();
	}

}
