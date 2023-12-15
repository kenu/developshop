package com.first.shop.controller;

import java.util.List;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.first.shop.dto.Product;
import com.first.shop.dto.Review;
import com.first.shop.service.ReviewService;

@Controller
@RequestMapping("/review")
public class ReviewController {
	private final ReviewService reviewService;
	
	public ReviewController(ReviewService reviewService) {
		this.reviewService = reviewService;
	}
	
	// 리뷰 등록 페이지 불러오기
	@GetMapping("/getWrite/{user_id}")
	public String getWrite(@PathVariable("user_id")String user_id, int product_id, Model model) {
		// 리뷰 작성하는데 필요한 상품정보를 DB로부터 받아온다.
		Product productInfo = reviewService.review_ProductInfo(product_id);
		// 모델에 담아 반환
		model.addAttribute("productInfo", productInfo);
		model.addAttribute("user_id", user_id);
		return "/reviewForm";
	}
	
	
	// 리뷰 등록 요청
	@PostMapping("/writeReview")
	@ResponseBody
	public void postWrite(Review review) {
		// ajax 요청으로 받아온 리뷰 정보를 넘겨준다.
		reviewService.writeReview(review);		
	}
	
	
	// 리뷰 작성한 적 있는지 확인
	@PostMapping("/checkHistory")
	@ResponseBody
	public int checkHistory(@RequestBody Review review) {
		System.out.println(review +" 전달받음");
		// DB에 등록된 리뷰 정보가 있는지 확인
		int count = reviewService.check_ReviewHistory(review);
		// 뷰로 다시 반환
		return count;
	}
	
	// 상품에 작성된 리뷰 목록 가져오기
	@GetMapping(value = "/reviewList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public List<Review> reviewList(int product_id){
		// 상품정보 페이지에서 받아온 상품번호로 DB에 있는 리뷰목록을 조회한 후 받아온다.
		List<Review> reviewList =  reviewService.getReviewList(product_id);
		System.out.println("리뷰 목록 출력");
		for(int i=0; i < reviewList.size(); i++) {
			System.out.println(reviewList.get(i));
		}
		return reviewList;
	}
}
