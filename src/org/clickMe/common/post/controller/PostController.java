package org.clickMe.common.post.controller;

import java.util.List;

import javax.naming.directory.SearchControls;

import org.clickMe.common.model.dto.PostDTO;
import org.clickMe.common.post.PostUnitTestResultView;
import org.clickMe.common.post.model.dto.SearchOption;
import org.clickMe.common.post.model.service.PostService;

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

}
