package com.first.shop.dao;

import com.first.shop.dto.Orders;
import com.first.shop.dto.Product;
import com.first.shop.dto.User;

public interface OrderDao {
	int register(Orders orders);
	
	int update(User user);
	
	int update(Product product);
	
	User user(String id);
	
	Product product(int product_id);
}