package kh.finalpj.zlack.main.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.finalpj.zlack.main.model.service.ZlackMainService;

@Controller
@RequestMapping("/main")
public class ZlackMainController {
		
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	ZlackMainService zlackMainService;
	
	@RequestMapping("/ZlackMain.do")
	public void boardFrom(HttpServletRequest request) {
			
		
	}
	
	
}
