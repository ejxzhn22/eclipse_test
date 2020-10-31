package com.spring.sujin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.sujin.dto.BoardDTO;
import com.spring.sujin.dto.ReplyDTO;
import com.spring.sujin.service.LoginService;

@Controller
public class LoginController {
	@Inject
	private LoginService loginService;
	
	//로그인
	@RequestMapping(value="login", method=RequestMethod.GET)
	public String login() {
		
		return "login";
	}
	
	@RequestMapping(value="login", method=RequestMethod.POST)
	public String loginForm(@RequestParam Map<String, String> map, HttpSession session) {
		map = loginService.login(map);
		
		if(map == null) {
			System.out.println("로그인실패");
			
		}else {
			System.out.println("로그인 성공");
			session.setAttribute("user", map);
		}
		return "home";
	}
	
	//로그아웃
	@RequestMapping(value="logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	//전체 게시글 조회
	@RequestMapping(value="list", method=RequestMethod.GET)
	public String list(Model model) {
		List<BoardDTO> list = loginService.list();
		model.addAttribute("list", list);
		
		return "list_paging";
	}

	//선택 게시글 조회
	@RequestMapping(value="detail", method=RequestMethod.GET)
	public String detail(@RequestParam("bno") int bno, Model model) {
		loginService.boardcnt(bno);
		BoardDTO boardDTO =loginService.detail(bno);
		System.out.println(bno);
		System.out.println(boardDTO);
		model.addAttribute("board", boardDTO);
		
		//댓글 전체 조회
		List<ReplyDTO> replylist = loginService.reply(bno);
		System.out.println(bno);
		System.out.println(replylist);
		model.addAttribute("replylist", replylist);
		
		return "detail";
	}
	
	//댓글 추가
	@RequestMapping(value="replyregister",method=RequestMethod.GET)
	public String replyregister(@RequestParam("bno") int bno, Model model) {
		BoardDTO boardDTO = loginService.detail(bno);
		model.addAttribute("board", boardDTO);
		
		return "replyregister";
	}
	
	@RequestMapping(value="replyregister",method=RequestMethod.POST)
	public String replyregister(ReplyDTO replyDTO, Model model) {
		int r = loginService.replyregister(replyDTO);
		model.addAttribute("replylist1", replyDTO);
		return "redirect:detail?bno="+replyDTO.getBno();
	}
	
	//댓글 수정
	@RequestMapping(value="replyupdate", method=RequestMethod.GET)
	public String replyupdate(@RequestParam("bno") int bno, Model model) {
		BoardDTO boardDTO = loginService.detail(bno);
		model.addAttribute("board", boardDTO);
		return "replyregister";
	}
	
	@RequestMapping(value="replyupdate", method=RequestMethod.POST)
	public String replyupdqte(ReplyDTO replyDTO) {
		loginService.replyupdate(replyDTO);
		
		return "redirect:detail?bno="+replyDTO.getBno();
	}
	
	//댓글 삭제
	@RequestMapping(value="replydelete", method=RequestMethod.GET)
	public String replydelete(@RequestParam("reno") int reno, ReplyDTO replyDTO) {
		int r = loginService.replydelete(reno);
		
		if( r>0) {
			System.out.println("삭제 성공");
		}
			System.out.println("삭제 실패 ");
		
		return "redirect:detail?bno="+replyDTO.getBno();
	}
	
	//AJAX 댓글---------------------------------------------------------------
	
	//댓글 추가
	@ResponseBody
	@RequestMapping(value="ajaxregister", method=RequestMethod.POST)
	public Map<String, Object> ajaxregister(ReplyDTO replyDTO){
		Map<String, Object> result = new HashMap<>();
		System.out.println("추가버튼누름");
		try {
			loginService.replyregister(replyDTO);
			result.put("status", "ok");
		}catch(Exception e) {
			e.printStackTrace();
			result.put("status", "fail");
		}
		
		return result;
	}
	
	// 댓글 조회
	@ResponseBody
	@RequestMapping(value="ajaxreply", method=RequestMethod.POST)
	public List<ReplyDTO> ajaxreply(@RequestParam("bno") int bno){
		
		return loginService.reply(bno);
	}
	
	// 댓글 수정
	@ResponseBody
	@RequestMapping(value="ajaxupdate", method=RequestMethod.POST)
	public int ajaxupdate(ReplyDTO replyDTO){
		
		return loginService.replyupdate(replyDTO);
	}
	
	//댓글 삭제
	@ResponseBody
	@RequestMapping(value="ajaxdelete", method=RequestMethod.POST)
	public int ajaxdelete(@RequestParam("reno")int reno) {
		
		return loginService.replydelete(reno);
	}
	
	//-----------------------------------------------------------------------
	
	//게시글 추가
	@RequestMapping(value="register", method=RequestMethod.GET)
	public String register() {
		
		return "register";
	}
	
	@RequestMapping(value="register", method=RequestMethod.POST)
	public String register(BoardDTO boardDTO) {
		loginService.insert(boardDTO);
		return "redirect:listPaging";
	}
	
	//게시글 수정
	@RequestMapping(value="update", method=RequestMethod.GET)
	public String update(@RequestParam("bno")int bno,BoardDTO boardDTO, Model model) {
		boardDTO = loginService.detail(bno);
		model.addAttribute("board", boardDTO);
		
		return "update";
	}
	
	@RequestMapping(value="update", method=RequestMethod.POST)
	public String update(BoardDTO boardDTO) {
		int r = loginService.update(boardDTO);
		if( r > 0) {
			return "redirect:listPaging";
		}
		
		return "redirect:update?bno="+boardDTO.getBno();
	}
	
	
	
	
	
}
