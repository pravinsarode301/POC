package com.BeautyCare.Service;

import java.util.List;

import javax.transaction.TransactionalException;

import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.TransactionException;


import com.BeautyCare.Bean.User;
import com.BeautyCare.Dao.UserDao;

@Service
@Transactional(propagation = Propagation.SUPPORTS)
public class UserService {

	@Autowired
	UserDao dao;
	
	public void createNewUser(User list) {
		
		dao.saveUser(list);
		
	}
	
	
	
}
