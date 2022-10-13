package com.iitr.customerRelationManagement.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/home")
public class HelloController {

	@RequestMapping("/hello")
	public String showMainPage() {
		System.out.println("Hellocontroller");
		return "home";
	}
}
