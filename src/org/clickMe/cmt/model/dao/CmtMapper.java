package org.clickMe.cmt.model.dao;

import java.util.List;
import java.util.Map;

import org.clickMe.common.model.dto.CmtDTO;

public interface CmtMapper {

	List<CmtDTO> selectAllCode();

	int insertCmt(CmtDTO cmt);

	int blindCmt(Map<String, Object> param);

}
