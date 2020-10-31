package com.spring.sujin.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.sujin.dto.BoardDTO;
import com.spring.sujin.dto.ReplyDTO;

@Repository
public class LoginDAOImpl implements LoginDAO{
	@Inject
	private SqlSession sqlSession;
	private final String namespace = "boardMapper";
	
	//로그인
	@Override
	public Map login(Map<String, String> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".login", map);
	}
	
	//조회수
	@Override
	public int boardcnt(int bno) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace+".boardcnt",bno);
	}
	
	//글추가
	@Override
	public int insert(BoardDTO boardDTO) {
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace+".register", boardDTO);
	}

	// 전체 글조회
	@Override
	public List<BoardDTO> list() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".list");
	}

	// 선택 글 조회
	@Override
	public BoardDTO detail(int bno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".detail", bno);
	}

	
	// 게시글 수정
	@Override
	public int update(BoardDTO boardDTO) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace+".update", boardDTO);
	}

	
	// 댓글 전체 조회
	@Override
	public List<ReplyDTO> reply(int bno) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".reply",bno);
	}

	// 댓글 추가
	@Override
	public int replyregister(ReplyDTO replyDTO) {
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace+".replyregister", replyDTO);
	}

	// 댓글 수정
	@Override
	public int replyupdate(ReplyDTO replyDTO) {
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace+".replyupdate", replyDTO);
	}

	//댓글 삭제
	@Override
	public int replydelete(int reno) {
		// TODO Auto-generated method stub
		return sqlSession.delete(namespace+".replydelete", reno);
	}

	
	
	
	
	

}
