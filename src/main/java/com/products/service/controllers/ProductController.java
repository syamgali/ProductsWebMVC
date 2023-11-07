package com.products.service.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.client.RestTemplate;
import org.springframework.beans.factory.annotation.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;
import org.springframework.validation.annotation.Validated;

import com.products.service.model.Product;

@Controller
public class ProductController {

	private String uri="http://localhost:8081/";
	private RestTemplate restTemplate = new RestTemplate();
	
	@Autowired
	@Qualifier("productValidator")
	private Validator validator;
	
	@InitBinder
	private void initBinder(WebDataBinder binder) {
		binder.setValidator(validator);
	}
	
	@ModelAttribute("product")
	public Product createProductModel() {
		return new Product();
	}

	@GetMapping("/")
	private String getProducts(Model model) {
		Product[] prods = restTemplate.getForObject(uri, Product[].class);
		model.addAttribute("products",prods);
		return "home";
	}
	@GetMapping("/add")
	public String addProduct()
	{
		return "add";
	}
	
	@PostMapping("/add")
	public String addProduct(@ModelAttribute("product") @Validated Product prod, BindingResult bindingResult, Model model)
	{
		if(bindingResult.hasErrors()) {
			model.addAttribute("product",prod);
			return "add";
		} else {
			Product prd = restTemplate.postForObject(uri, prod, Product.class);
			return "redirect:/";
		}
	}
	
	@GetMapping("/delete/{id}")
	public String deleteProduct(@PathVariable int id)
	{
		restTemplate.delete(uri+id);
		return "redirect:/";
	}
	
	@GetMapping("/edit/{id}")
	public String edit(@PathVariable int id, Model model)
	{
		Product prod = restTemplate.getForObject(uri+id, Product.class);
		model.addAttribute("product",prod);
		return "edit";
	}
	
	@PostMapping("/edit/{id}")
	public String edit(@ModelAttribute("product") @Validated Product prod, BindingResult bindingResult, Model model)
	{
		if(bindingResult.hasErrors()) {
			model.addAttribute("product",prod);
			return "edit";
		} else {
			restTemplate.postForObject(uri+"update", prod, Product.class);		
			return "redirect:/";
		}
	}
	
	@GetMapping("/search")
	public String searchProduct()
	{
		return "search";
	}
	@PostMapping("/search")
	public String searchProduct(@RequestParam("query") String query, Model model)
	{
		Product[] prods = restTemplate.getForObject(uri+"search?query="+query, Product[].class);
		model.addAttribute("products",prods);
		return "search";
	}

}
