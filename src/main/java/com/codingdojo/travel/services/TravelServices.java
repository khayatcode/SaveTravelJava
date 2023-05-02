package com.codingdojo.travel.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.travel.models.Travel;
import com.codingdojo.travel.repositories.TravelRepository;

@Service
public class TravelServices {
	
	@Autowired
	private TravelRepository travelRepo;
	
	// All Items
	public List<Travel> allItems(){
		return travelRepo.findAll();
	}
	
	//Create/Update Item
	public Travel createOrUpdate(Travel t) {
		return travelRepo.save(t);
	}
	
	// retrieve a Item
	public Travel findItem(Long id) {
		Optional<Travel> optionalTravel = travelRepo.findById(id);
		if(optionalTravel.isPresent()) {
			return optionalTravel.get();
		} else {
			return null;
		}
	}
	
	// Delete Item
	public void deleteItem(Long id) {
		travelRepo.deleteById(id);
	}
	
	

}
