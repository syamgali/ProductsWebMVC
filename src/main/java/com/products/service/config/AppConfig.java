package com.products.service.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import com.products.service.validator.ProductValidator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;

@Configuration
@ComponentScan({"com.products.service.validator"})
public class AppConfig {
    @Bean
    @Autowired
    public ProductValidator productValidator() {
		return new ProductValidator();
	}
    
}