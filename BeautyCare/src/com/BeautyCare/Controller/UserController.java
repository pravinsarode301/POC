package com.BeautyCare.Controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.ContentType;
import org.apache.tomcat.util.http.mapper.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.client.ClientHttpRequestFactory;
import org.springframework.http.converter.json.Jackson2ObjectMapperBuilder;
import org.springframework.messaging.handler.annotation.Headers;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;
import org.springframework.web.util.UriComponentsBuilder;

import com.BeautyCare.Bean.Address;
import com.BeautyCare.Bean.Login;
import com.BeautyCare.Bean.Login.userType;
import com.BeautyCare.Bean.Person;
import com.BeautyCare.Bean.User;
import com.BeautyCare.Service.UserService;
import com.fasterxml.jackson.annotation.JsonView;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationConfig;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatVisitorWrapper;
import com.fasterxml.jackson.*;
import com.sun.security.sasl.ClientFactoryImpl;

import jdk.nashorn.internal.ir.RuntimeNode.Request;


@RestController
public class UserController {
	
	@Autowired
	UserService service;
	
	@RequestMapping(value="/registerMe",method=RequestMethod.POST)
	public  ResponseEntity<String> doRegistration(@RequestBody User user,BindingResult result) throws JsonParseException, JsonMappingException, IOException {
		String response="";
		String value =null;
		
		try{
		if (result.hasErrors()) {
			response="BindingResult occure";
		}else{
			
			if(!user.getLogin().getPassword().contentEquals(user.getLogin().getRePassword())){
				response="please enter the password and repassword filed same";
			}else{
				try{
					service.createNewUser(user);
						response="successfully";
					}catch(Exception e){
						response="failed";
					}
			}
			
			
		}
		
		}catch(Exception e){
			
		}
       
		
		ObjectMapper mapper = new ObjectMapper();
		try {
			 value = mapper.writeValueAsString(response);
			// return "["+value+"]";
			
		} catch (JsonProcessingException e) {
			e.printStackTrace();
			
		}
		
	    return new ResponseEntity<String>(value,HttpStatus.OK);
	}


	@RequestMapping(value="/registerMe",method=RequestMethod.GET)
	public ModelAndView doRegistration() throws UnsupportedEncodingException {
		User user=new User();
		Address address=new Address();
		Login login=new Login();

		login.setUsername("xyz");
		login.setRole(userType.ROLE_USER);
		login.setPassword("12345");
		
		address.setCity("mzr");
		address.setContactNumber(Long.valueOf("8087082578"));
		address.setCountry("india");
		address.setDist("akola");
		address.setLandmark("grmsk");
		address.setPinCode("44401");
		
		
		user.setFirstName("dipak");
		user.setLastName("sarode");
		user.setGender("female");
		user.setMiddleName("xxx");
		user.setLogin(login);
		user.setAddress(address);
		
		service.createNewUser(user);
	    return new ModelAndView("login");
	}

	
}
