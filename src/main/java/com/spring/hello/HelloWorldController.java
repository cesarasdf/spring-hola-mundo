package com.spring.hello;

import org.springframework.web.bind.annotation.*;

@RestController
public class HelloWorldController {
	
	@GetMapping("/")
	public String hello() {
		return "Hola.";
	}
}