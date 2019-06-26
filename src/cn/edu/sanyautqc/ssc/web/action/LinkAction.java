package cn.edu.sanyautqc.ssc.web.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import com.opensymphony.xwork2.ModelDriven;

import cn.edu.sanyautqc.ssc.common.BaseAction;
import cn.edu.sanyautqc.ssc.dao.LinkDao;
import cn.edu.sanyautqc.ssc.domain.Link;
import cn.edu.sanyautqc.ssc.utils.JsonUtil;
import cn.edu.sanyautqc.ssc.utils.Uuid;

public class LinkAction extends BaseAction implements ModelDriven<Link> {
	private static final long serialVersionUID = 1L;
	private Link link = new Link();
	@Override
	public Link getModel() {
		return link;
	}
	public Link getLink() {
		return link;
	}
	public String add() {
		String id = Uuid.getUUID();
		link.setId(id);
		LinkDao dao = new LinkDao();
		dao.addLink(link);
		return "toList";
	}
	public String list() throws IOException {
		response.setCharacterEncoding("UTF-8");
		LinkDao dao = new LinkDao();
		List<Link> list = dao.findAll();
		String result = JsonUtil.toJSONString(list);
		PrintWriter out = response.getWriter();
		out.print(result);
		out.flush();
		out.close();
		return null;
	}
	public String delete() {
		String id = request.getParameter("id");
		LinkDao dao = new LinkDao();
		dao.deleteLink(id);
		return "toList";
	}
	public String toUpdate() {
		String id = request.getParameter("id");
		LinkDao dao = new LinkDao();
		link = dao.selectLink(id);
		return "toUpdatePage";
	}
	public String update() {
		LinkDao dao = new LinkDao();
		dao.updateLink(link);
		return "toList";
	}
}
