package com.first.springboot.web.springbootwebapplication.controller;

//import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MotivationController {
	
	 	@RequestMapping(value="/motivation", method = RequestMethod.GET)
	    public String showMotivationPage(ModelMap model){
	    	
	        return "motivation";
	    
	 	}
	 
}
