package cn.edu.sanyautqc.ssc.web.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.opensymphony.xwork2.ModelDriven;

import cn.edu.sanyautqc.ssc.common.BaseAction;
import cn.edu.sanyautqc.ssc.dao.SuggestDao;
import cn.edu.sanyautqc.ssc.domain.Suggest;
import cn.edu.sanyautqc.ssc.utils.JsonUtil;
import cn.edu.sanyautqc.ssc.utils.Uuid;

public class SuggestAction extends BaseAction implements ModelDriven<Suggest> {
	private static final long serialVersionUID = 1L;
	private Suggest suggest = new Suggest();
	@Override
	public Suggest getModel() {
		return suggest;
	}
	public Suggest getSuggest() {
		return suggest;
	}
	public String add() {
		String id = Uuid.getUUID();
		suggest.setId(id);
		SuggestDao suggestDao = new SuggestDao();
		suggestDao.add(suggest);
		return null;
	}
	public String getList() throws IOException {
		response.setCharacterEncoding("UTF-8");
		SuggestDao suggestDao = new SuggestDao();
		List<Suggest> list = suggestDao.findAll();
		String result = JsonUtil.toJSONStringByFastjson(list);
		PrintWriter out = response.getWriter();
		out.println(result);
		out.flush();
		out.close();
		return null;
	}
	public String detail() {
		String id = request.getParameter("id");
		SuggestDao suggestDao = new SuggestDao();
		suggest = suggestDao.detail(id);
		return "detail";
	}
	public String delete() {
		String id = request.getParameter("id");
		SuggestDao suggestDao = new SuggestDao();
		suggestDao.delete(id);
		return "toList";
	}
	public String keywordSearch() throws IOException {
		response.setCharacterEncoding("UTF-8");
		String keyword = request.getParameter("keyword");
		SuggestDao suggestDao = new SuggestDao();
		List<Suggest> list = suggestDao.keywordSearch(keyword);
		String result = JsonUtil.toJSONStringByFastjson(list);
		PrintWriter out = response.getWriter();
		out.println(result);
		out.flush();
		out.close();
		return null;
	}
}
