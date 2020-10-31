package com.spring.sujin.dao;

import java.util.List;

import com.spring.sujin.dto.BoardDTO;
import com.spring.sujin.dto.Criteria;

public interface ArticleDAO {
	List<BoardDTO> listPaging(int page) throws Exception;
	List<BoardDTO> listCriteria(Criteria criteria) throws Exception;
	int countArticles(Criteria criteria) throws Exception;
}

