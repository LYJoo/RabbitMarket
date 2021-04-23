package com.market.rabbit.help.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class HelpController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	@RequestMapping(value = "/help", method = RequestMethod.GET)
	public String home(Model model) {

		
		return "help";
	}
	
}
