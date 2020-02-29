package com.BeautyCare.Controller;

import java.security.Principal;

import org.codehaus.jackson.map.util.JSONPObject;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;


@RestController
public class Controller{
	@RequestMapping(value="/index", method = RequestMethod.GET)
	public ModelAndView executeSecurity(ModelMap model) {
		
		
		model.addAttribute("author", "praivn");
		model.addAttribute("message", "Welcome To Login Form Based Spring Security Example!!!");
		return new ModelAndView("index");
	}
	
	@RequestMapping(value="/adminIndex", method = RequestMethod.GET)
	public ModelAndView executeAdminSecurity(ModelMap model, Principal principal ) {
		String name = principal.getName();
		System.out.println(name);
		model.addAttribute("author", name);
		model.addAttribute("message", "Welcome To Login Form Based Spring Security Example!!!");
		return new ModelAndView("Home1");
 
	}
	
	
	

 
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public ModelAndView login(ModelMap model) {
 
		return new ModelAndView("login");
 
	}
 
	@RequestMapping(value="/checkout", method = RequestMethod.GET)
	public ModelAndView checkout(ModelMap model) {
 
		return new ModelAndView("checkout");
 
	}
	

	@RequestMapping(value="/shop", method = RequestMethod.GET)
	public ModelAndView Shop(ModelMap model) {
 
		return new ModelAndView("shop");
 
	}
	
	@RequestMapping(value="/blogs", method = RequestMethod.GET)
	public ModelAndView Blogs(ModelMap model) {
 
		return new ModelAndView("blogs");
 
	}
	
	@RequestMapping(value="/blog", method = RequestMethod.GET)
	public ModelAndView Blog(ModelMap model) {
 
		return new ModelAndView("blog");
 
	}
	
	@RequestMapping(value="/404", method = RequestMethod.GET)
	public ModelAndView ErrPage(ModelMap model) {
 
		return new ModelAndView("404");
 
	}
	@RequestMapping(value="/cart", method = RequestMethod.GET)
	public ModelAndView Cart(ModelMap model) {
 
		return new ModelAndView("cart");
 
	}
	
	@RequestMapping(value="/fail2login", method = RequestMethod.GET)
	public ModelAndView loginerror(ModelMap model) {
 
		model.addAttribute("error", "true");
		 
		return new ModelAndView("login");
 
	}
 
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logout(ModelMap model) {
 
		return "login";
 
	}
	
	@RequestMapping(value="/contact-us", method = RequestMethod.GET)
	public ModelAndView contactUs(ModelMap model) {
 
		return new ModelAndView("contact-us");
 
	}
	
	
	@RequestMapping(value="/product-details", method = RequestMethod.GET)
	public ModelAndView productDetails(ModelMap model) {
 
		return new ModelAndView("product-details");
 
	}
	
}
