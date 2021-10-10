package org.clickMe.post.controller;

import java.util.List;
import java.util.Map;

import org.clickMe.common.model.dto.PostDTO;
import org.clickMe.post.PostUnitTestResultView;
import org.clickMe.post.model.dto.SearchOption;
import org.clickMe.post.model.service.PostService;

public class PostController {
	private final PostService postService;
	private final PostUnitTestResultView resultView;

	public PostController() {
		this.postService = new PostService();
		this.resultView = new PostUnitTestResultView();
	}

	public void selectAllPost() {
		List<PostDTO> postList = postService.selectAllPost();
		
		if (!postList.isEmpty()) {
			resultView.printPostList(postList);
		} else {
			resultView.printErrorMessage("selectList");
		}
	}

	public void selectPostBySearchOption(SearchOption searchOption) {
		List<PostDTO> searchedPostList = postService.selectPostBySearchOption(searchOption);
		
		if (!searchedPostList.isEmpty()) {
			resultView.printPostList(searchedPostList);
		} else {
			resultView.printErrorMessage("selectListWithSearchOption");
		}
	}

	public void insertNewPost(Map<String, String> parameter) {
		PostDTO post = new PostDTO();
		
		post.setSellerCode(Integer.valueOf(parameter.get("sellerCode")));
		post.setTitle(parameter.get("title"));
		post.setContent(parameter.get("content"));
		post.setItemPrice(Integer.valueOf(parameter.get("itemPrice")));
		
		if (postService.insertNewPost(post)) {
			resultView.printSuccessMessage("insert");
		} else {
			resultView.printErrorMessage("insert");
		}
	}

}
