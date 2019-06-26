package cn.edu.sanyautqc.ssc.web.action;

import java.sql.SQLException;
import java.util.Enumeration;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ModelDriven;

import cn.edu.sanyautqc.ssc.common.BaseAction;
import cn.edu.sanyautqc.ssc.domain.User;
import cn.edu.sanyautqc.ssc.service.UserService;

public class UserAction extends BaseAction implements ModelDriven<User> {
	private static final long serialVersionUID = 1L;
	User user = new User();
	@Override
	public User getModel() {
		return user;
	}
	public String login() {
		response.setCharacterEncoding("UTF-8");
		try {
			UserService service = new UserService();
			user = service.login(user.getUSERNAME(),user.getPASSWORD());
			if (user==null) {
				addActionError("用户名或密码错误");
				return "login_input";
			}
			ServletActionContext.getRequest().getSession().setAttribute("user", user);
		} catch (SQLException e) {
			e.printStackTrace();
			addActionError("登陆失败");
			return "login_input";
		}
		return "login_success";	
	}
	public String exit() {
		Enumeration em = ServletActionContext.getRequest().getSession().getAttributeNames();
		  while(em.hasMoreElements()){
			  ServletActionContext.getRequest().getSession().removeAttribute(em.nextElement().toString());
		  }
		return "exit_success";
	}	
	public String modify() {
		response.setCharacterEncoding("UTF-8");
		try {
			String password=ServletActionContext.getRequest().getParameter("password2");
			UserService service = new UserService();
			user = service.login(user.getUSERNAME(),user.getPASSWORD());
			if (user==null) {
				addActionError("密码错误");
				return "modify";
			}			
			user.setPASSWORD(password);
			service.modify(user);
		} catch (SQLException e) {
			e.printStackTrace();
			addActionError("修改失败");
			return "modify";
		}
		addActionMessage("修改成功");
		return "modify_success";	
	}
}
