package com.cjc.main.serviceI;

import com.cjc.main.model.User;

public interface UserServiceI {

	public void saveData(User u);

	public User loginCheck(String uname, String password);

	public Iterable<User> displayAllData();


	
	
	

	
	

	
}
