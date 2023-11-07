package com.products.service.model;

public class Product {

	private int Id;
	private String Name;
	private double Price;
	private String Category;
	
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public double getPrice() {
		return Price;
	}
	public void setPrice(double price) {
		Price = price;
	}
	public String getCategory() {
		return Category;
	}
	public void setCategory(String category) {
		Category = category;
	}
	
	@Override
	public String toString() {
		return "Product [Id=" + Id + ", Name=" + Name + ", Price=" + Price + "]";
	}
		
}
