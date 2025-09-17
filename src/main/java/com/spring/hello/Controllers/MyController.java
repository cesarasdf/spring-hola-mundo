package com.spring.hello.Controllers;

import org.springframework.web.bind.annotation.*;

@RestController
public class MyController {
	
	@GetMapping("/salute")
	public String salute() {
		return "Hello from my endpoint!";
	}
}
