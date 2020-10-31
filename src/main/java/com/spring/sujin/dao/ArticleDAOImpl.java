package com.spring.sujin.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.sujin.dto.BoardDTO;
import com.spring.sujin.dto.Criteria;

@Repository
public class ArticleDAOImpl implements ArticleDAO{
	@Inject
	private SqlSession sqlSession;
	private final String namespace = "boardMapper";
	
	@Override
	public List<BoardDTO> listPaging(int page) throws Exception {

	    if (page <= 0) {
	        page = 1;
	    }

	    page = (page - 1) * 10;

	    return sqlSession.selectList(namespace + ".listPaging", page);
	}
	@Override
	public List<BoardDTO> listCriteria(Criteria criteria) throws Exception {
	    return sqlSession.selectList(namespace + ".listCriteria", criteria);
	}
	
	@Override
	public int countArticles(Criteria criteria) throws Exception {
	    return sqlSession.selectOne(namespace + ".countArticles", criteria);
	}
}
