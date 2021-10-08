package org.clickMe.common.post.controller;

import org.clickMe.common.post.model.service.PostService;

public class PostSelectUnitTestApplication {
	public static void main(String[] args) {
		PostService postService = new PostService();
		
		postService.selectAllPost();
		
	}
}
