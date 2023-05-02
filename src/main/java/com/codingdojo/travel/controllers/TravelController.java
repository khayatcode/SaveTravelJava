package com.codingdojo.travel.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.codingdojo.travel.models.Travel;
import com.codingdojo.travel.services.TravelServices;

import jakarta.validation.Valid;

@Controller
public class TravelController {
	@Autowired
	private TravelServices services;
	
	@GetMapping("/")
	public String index() {
		return "redirect:/home";
	}
	
	@GetMapping("/home")
	public String home(Model model) {
		List<Travel> items = services.allItems();
		model.addAttribute("items", items);
		return "home.jsp";
	}
	
	@GetMapping("/show/{id}")
	public String show(@PathVariable("id") Long id, Model model){
		Travel item = services.findItem(id);
		model.addAttribute("item", item);
		return "view.jsp";		
	}
	
	@GetMapping("/create")
	public String newItem(@ModelAttribute("item") Travel item) {
		return "create.jsp";
	}
	
	@PostMapping("/createItem")
	public String create(@Valid @ModelAttribute("item") Travel item, BindingResult result) {
		if(result.hasErrors()) {
			return "create.jsp";
		} else {
			services.createOrUpdate(item);
			return "redirect:/home";			
		}
	}
	
	@GetMapping("/edit/{id}")
	public String editPage(@PathVariable("id") Long id, Model model) {
		Travel item = services.findItem(id);
		model.addAttribute("item", item);
		return "update.jsp";
	}
	
	@PutMapping("/updateItem/{id}")
	public String updateItem(@Valid @ModelAttribute("item") Travel item, BindingResult result) {
		if(result.hasErrors()) {
			return "update.jsp";
		} else {
			services.createOrUpdate(item);
			return "redirect:/home";
		}
	}
	
	@DeleteMapping("/delete/{id}")
	public String delete(@PathVariable("id") Long id) {
		services.deleteItem(id);
		return "redirect:/home";
	}
	
}
