package com.products.service.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.products.service.model.Product;

public class ProductValidator implements Validator {

	@Override
	public boolean supports(Class<?> paramClass) {
		return Product.class.equals(paramClass);
	}

	@Override
	public void validate(Object obj, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "name.required", null, "Product Name is required!");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "price", "price.required", null, "Product Price is required!");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "category", "category.required", null, "Product Category is required!");
		
		Product prod = (Product) obj;
		if(prod.getPrice() <= 0) {
			errors.rejectValue("price", "negativeValue", new Object[] {"'price'"}, "Price cannot be zero or negative value!");
		}
	}

}
