package cn.edu.sanyautqc.ssc.web.interceptor;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

import cn.edu.sanyautqc.ssc.domain.User;

public class LoginInterceptor extends MethodFilterInterceptor{

	@Override
	protected String doIntercept(ActionInvocation actionInvocation) throws Exception {
		
		User user = (User) ServletActionContext.getRequest().getSession().getAttribute("user");
		if (user==null) {
			ActionSupport action = (ActionSupport) actionInvocation.getAction();
			action.addActionError("请先登录");
			return "login";
		}else {
			return actionInvocation.invoke();
		}
	}

}
