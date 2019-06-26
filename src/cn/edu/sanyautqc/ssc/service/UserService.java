package cn.edu.sanyautqc.ssc.service;

import java.sql.SQLException;

import cn.edu.sanyautqc.ssc.dao.UserDao;
import cn.edu.sanyautqc.ssc.domain.User;

public class UserService {

	public User login(String username,String password) throws SQLException {
		
	return new UserDao().findUserByNameAndPassword(username,password);
	}

	public void modify(User user) throws SQLException{
		
		new UserDao().modify(user);
	}
}
