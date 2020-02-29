package com.BeautyCare.Dao;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.TransactionException;

import com.BeautyCare.Bean.*;

@Repository
public class UserDao {

	@Autowired(required = true)
	private SessionFactory sessionFactory;
	
	/*User user=new User();
	
	Address address=new Address();
	Login login=new Login();*/
	
	
	 

	public void saveUser(User user) {
		sessionFactory.getCurrentSession().saveOrUpdate(user);
		/*List<Object> list = list1;
		Iterator<Object> iterator = list.iterator();

		if (!list.isEmpty()) {
			
			while (iterator.hasNext()) {
				
				Object object = iterator.next();
				
				
				 System.out.println(object); 

				if (object.getClass().isInstance(user)) {

					user = (User) object;
					sessionFactory.getCurrentSession().saveOrUpdate(user);
				}else if (object.getClass().isInstance(address)) {

					address = (Address) object;
					sessionFactory.getCurrentSession().saveOrUpdate(address);
				}else if (object.getClass().isInstance(login)) {
					login = (Login) object;
					sessionFactory.getCurrentSession().saveOrUpdate(login);
				}
				
			}

		} else {
			System.out.println("am here");
		}
*/
			 
	}

	public List<User> getUser() {
		@SuppressWarnings("unchecked")
		List<User> userlist = sessionFactory.getCurrentSession().createCriteria(User.class).list();
		return userlist;
	}

}
