package org.clickMe.recomment.model.dao;

import java.util.Map;

import org.clickMe.common.model.dto.RecommentDTO;

public interface RecommentMapper {

	int insertRecomment(RecommentDTO recomment);
	
	int blindRecomment(Map<String, Object> param);

	
}
