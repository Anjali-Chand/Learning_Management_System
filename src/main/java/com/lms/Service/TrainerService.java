package com.lms.Service;
import java.util.List;
import java.util.Optional;

import com.lms.Entity.Trainer;

public interface TrainerService {
	public Trainer save(Trainer tea);
	public void delete(Integer id);
	public Optional<Trainer> fetch(Integer id);
	public Trainer update(Trainer tea);
	public Optional<Trainer> validate(String email,String pass);
	public List<Trainer> fetchAll();
}
