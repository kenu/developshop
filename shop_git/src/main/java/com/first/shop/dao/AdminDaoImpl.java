package com.first.shop.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.first.shop.dto.Category;
import com.first.shop.dto.Product;
import com.first.shop.dto.ProductImage;

@Repository
public class AdminDaoImpl implements AdminDao {
	
	// 사용하기 위한 매퍼 설정
	String namespace= "com.first.shop.dao.AdminMapper.";
	
	// DB 접근 위한 객체
	@Autowired
	SqlSession session;
	
	// 상품 등록
	@Override
	public int register(Product product) {
		return session.insert(namespace+"register_product", product);
	}

	@Override
	public List<Category> list() {
		return session.selectList(namespace+"get_categorylist");
	}

	@Override
	public int registerImg(ProductImage image) {
		return session.insert(namespace+"register_image", image);
	}

}
