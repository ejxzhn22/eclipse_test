package com.spring.sujin.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.sujin.dto.Criteria;
import com.spring.sujin.dto.PageMaker;
import com.spring.sujin.service.ArticleService;

@Controller
public class ArticleController {
	@Inject
	ArticleService articleService;
	PageMaker pageMaker;
	
	
	@RequestMapping(value = "/listPaging", method = RequestMethod.GET)
	public String listCriteria(Model model, Criteria criteria) throws Exception {
		System.out.println("criteria"+criteria);

	    PageMaker pageMaker = new PageMaker();
	    pageMaker.setCriteria(criteria);
	    
	    pageMaker.setTotalCount(articleService.countArticles(criteria));

	    model.addAttribute("articles", articleService.listCriteria(criteria));
	    model.addAttribute("pageMaker", pageMaker);
	    System.out.println("페이지: "+pageMaker.getCriteria().getPage());
	    
	    return "list_paging";
	}
	
	
	
}
