package com.spring.sujin.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.sujin.dao.ArticleDAO;
import com.spring.sujin.dao.LoginDAO;
import com.spring.sujin.dto.BoardDTO;
import com.spring.sujin.dto.Criteria;

@Service
public class ArticleServiceImpl implements ArticleService {
	@Inject
	ArticleDAO articleDAO;
	
	@Override
	public List<BoardDTO> listCriteria(Criteria criteria) throws Exception {
	    return articleDAO.listCriteria(criteria);
	}

	@Override
	public int countArticles(Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return articleDAO.countArticles(criteria);
	}
}
