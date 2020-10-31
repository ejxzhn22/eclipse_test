package com.spring.sujin.service;

import java.util.List;
import java.util.Map;

import com.spring.sujin.dto.BoardDTO;
import com.spring.sujin.dto.ReplyDTO;

public interface LoginService {
	//로그인
	public Map login(Map<String, String> map);
	
	//조회수
	public int boardcnt(int bno);

	//추가
	public int insert(BoardDTO boardDTO);
	
	//전체 조회
	public List<BoardDTO> list();
	
	// 선택 글 조회
	public BoardDTO detail(int bno);
	
	//게시글 수정
	public int update(BoardDTO boardDTO);
	
	//댓글 전체 조회
	public List<ReplyDTO> reply(int bno);
	
	//댓글 작성
	public int replyregister(ReplyDTO replyDTO);
	
	//댓글 수정
	public int replyupdate(ReplyDTO replyDTO);
	
	//댓글 삭제
	public int replydelete(int reno);
}
