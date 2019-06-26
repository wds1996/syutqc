package cn.edu.sanyautqc.ssc.dao;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import cn.edu.sanyautqc.ssc.domain.User;
import cn.edu.sanyautqc.ssc.utils.DataSourceUtils;


public class UserDao {
	//µÇÂ½ÑéÖ¤
		public User findUserByNameAndPassword(String name, String password) throws SQLException {
			String sql = "select * from user where USERNAME=? and PASSWORD=?";
			QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
			return runner.query(sql, new BeanHandler<User>(User.class), name,
					password);
		}

		public void modify(User user) throws SQLException {
			String sql = "update user set password =? where USERNAME=?";
			QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
			runner.update(sql,user.getPASSWORD(), user.getUSERNAME());
		}
}
