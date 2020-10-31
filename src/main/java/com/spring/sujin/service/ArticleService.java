package com.spring.sujin.service;

import java.util.List;

import com.spring.sujin.dto.BoardDTO;
import com.spring.sujin.dto.Criteria;

public interface ArticleService {
	List<BoardDTO> listCriteria(Criteria criteria) throws Exception;
	int countArticles(Criteria criteria) throws Exception;
}
