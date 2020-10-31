package com.spring.sujin.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.sujin.dao.LoginDAO;
import com.spring.sujin.dto.BoardDTO;
import com.spring.sujin.dto.ReplyDTO;

@Service
public class LoginServiceImpl implements LoginService{
	@Inject
	private LoginDAO loginDAO;
	
	//로그인
	@Override
	public Map login(Map<String, String> map) {
		
		return loginDAO.login(map);
	}
	
	//조회수
	@Override
	public int boardcnt(int bno) {
		// TODO Auto-generated method stub
		return loginDAO.boardcnt(bno);
	}


	//추가
	@Override
	public int insert(BoardDTO boardDTO) {
		// TODO Auto-generated method stub
		return loginDAO.insert(boardDTO);
	}

	//전체 조회
	@Override
	public List<BoardDTO> list() {
		// TODO Auto-generated method stub
		return loginDAO.list();
	}
	// 선택글 조회
	@Override
	public BoardDTO detail(int bno) {
		// TODO Auto-generated method stub
		return loginDAO.detail(bno);
	}

	//게시글 수정
	@Override
	public int update(BoardDTO boardDTO) {
		// TODO Auto-generated method stub
		return loginDAO.update(boardDTO);
	}

	
	//댓글 전체 조회
	@Override
	public List<ReplyDTO> reply(int bno) {
		// TODO Auto-generated method stub
		return loginDAO.reply(bno);
	}

	//댓글 추가
	@Override
	public int replyregister(ReplyDTO replyDTO) {
		// TODO Auto-generated method stub
		return loginDAO.replyregister(replyDTO);
	}

	//댓글 수정
	@Override
	public int replyupdate(ReplyDTO replyDTO) {
		// TODO Auto-generated method stub
		return loginDAO.replyupdate(replyDTO);
	}

	
	//댓글 삭제
	@Override
	public int replydelete(int reno) {
		// TODO Auto-generated method stub
		return loginDAO.replydelete(reno);
	}

}
