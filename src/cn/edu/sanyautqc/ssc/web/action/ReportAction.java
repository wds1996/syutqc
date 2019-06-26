package cn.edu.sanyautqc.ssc.web.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.opensymphony.xwork2.ModelDriven;
import cn.edu.sanyautqc.ssc.common.BaseAction;
import cn.edu.sanyautqc.ssc.dao.ReportDao;
import cn.edu.sanyautqc.ssc.dao.WorkDao;
import cn.edu.sanyautqc.ssc.domain.Report;
import cn.edu.sanyautqc.ssc.utils.FreemarkerUtil;
import cn.edu.sanyautqc.ssc.utils.JsonUtil;
import cn.edu.sanyautqc.ssc.utils.Uuid;
import freemarker.template.TemplateException;
import net.sf.json.JSONArray;

public class ReportAction extends BaseAction implements ModelDriven<Report> {
	private static final long serialVersionUID = 1L;
	private Report report = new Report();
	private File file;
	private String fileContentType;
	private String fileFileName;
	public Report getReport() {
		return report;
	}
	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public String getFileContentType() {
		return fileContentType;
	}

	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}

	public String getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}
	@Override
	public Report getModel() {
		return report;
	}
	public String uploadImage() throws IOException {
		response.setCharacterEncoding("UTF-8");
		String filePath = ServletActionContext.getServletContext().getRealPath("/sanya/file/image/");
		File file1 = new File(filePath);
		if (!file1.exists())
			file1.mkdirs();
		FileUtils.copyFile(file, new File(file1, fileFileName));
		PrintWriter out = response.getWriter();
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
		StringBuilder result = new StringBuilder();
		result.append("{");
		result.append("\"code\": 0");
		result.append(",\"msg\": \"上传失败\"");
		result.append(",\"data\": {\"src\": \""+basePath+"sanya/file/image/"+fileFileName+"\",\"title\": \"" + fileFileName + "\"}");
		result.append("}");
		String json = result.toString();
		out.print(json);
		out.flush();
		out.close();
		return null;
	}
	public String deleteImage() {
		String imgPath = request.getParameter("imgpath");
		String[] path = imgPath.split("/");
		String finalPath = "/sanya/file/image/" + path[path.length - 1];
		String realPath = ServletActionContext.getServletContext().getRealPath(finalPath);
		File file = new File(realPath);
		if (file.exists())
			file.delete();
		return null;
	}
	public String uploadFile() throws IOException {
		response.setCharacterEncoding("UTF-8");
		String filePath = ServletActionContext.getServletContext().getRealPath("/sanya/file/file/");
		File file1 = new File(filePath);
		if (!file1.exists())
			file1.mkdirs();
		FileUtils.copyFile(file, new File(file1, fileFileName));
		String realPath = filePath+fileFileName;
		realPath = realPath.replaceAll("\\\\", "/");
		PrintWriter out = response.getWriter();
		StringBuilder result = new StringBuilder();
		result.append("{");
		result.append("\"code\": 0");
		result.append(",\"msg\": \"上传失败\"");
		result.append(",\"data\": {\"src\": \""+realPath+"\",\"title\": \"" + fileFileName + "\"}");
		result.append("}");
		String json = result.toString();
		out.print(json);
		out.flush();
		out.close();
		return null;
	}
	public String delFile() {
		String name = request.getParameter("name");
		String filePath = ServletActionContext.getServletContext().getRealPath("/sanya/file/file/");
		File file = new File(filePath + name);
		if (file.exists())
			file.delete();
		return null;
	}
	public String add() throws IOException, TemplateException {
		String id = Uuid.getUUID();
		report.setId(id);
		ReportDao dao = new ReportDao();
		dao.addReport(report);
		return "toList";
	}
	public String list() throws IOException {
		response.setCharacterEncoding("UTF-8");
		ReportDao dao = new ReportDao();
		List<Report> list = dao.findAll();
		String result = JsonUtil.toJSONString(list);
		PrintWriter out = response.getWriter();
		out.print(result);
		out.flush();
		out.close();
		return null;
	}
	public String findAll() throws IOException {
		response.setCharacterEncoding("UTF-8");
		String page = request.getParameter("page");
		String limit = request.getParameter("limit");
		ReportDao dao = new ReportDao();
		PageHelper.startPage(Integer.valueOf(page), Integer.valueOf(limit));
		List<Report> list = dao.findAll();
		PageInfo<Report> pageInfo = new PageInfo<>(list);
		String json = JsonUtil.toJSONString(pageInfo.getList());
		PrintWriter out = response.getWriter();
		StringBuilder result = new StringBuilder();
		result.append("{");
		result.append("\"code\": 0");
		result.append(",\"msg\": \"上传失败\"");
		result.append(",\"count\": \"" + pageInfo.getTotal() + "\"");
		result.append(",\"data\": " + json);
		result.append("}");
		out.print(result.toString());
		out.flush();
		out.close();
		return null;
	}
	public String findById() throws IOException {
		response.setCharacterEncoding("UTF-8");
		ReportDao dao = new ReportDao();
		report = dao.selectReport(report.getId());
		return "new";
	}
	public String delete() {
		String id = request.getParameter("id");
		ReportDao dao = new ReportDao();
		dao.deleteReport(id);
		return "toList";
	}
	public String toUpdate() {
		String id = request.getParameter("id");
		ReportDao dao = new ReportDao();
		report = dao.selectReport(id);
		return "toUpdatePage";
	}
	public String update() throws IOException, TemplateException {
		ReportDao dao = new ReportDao();
		dao.updateReport(report);
		return "toList";
	}
	public String getNew() throws IOException {
		response.setCharacterEncoding("UTF-8");
		ReportDao dao = new ReportDao();
		List<Report> list = dao.getNew();
		String result = JSONArray.fromObject(list).toString();
		PrintWriter out = response.getWriter();
		out.print(result);
		out.flush();
		out.close();
		return null;
	}
	public String keywordSearch() throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String keyword = request.getParameter("keyword");
		ReportDao dao = new ReportDao();
		List<Report> list = dao.keywordSearch(keyword);
		String result = JSONArray.fromObject(list).toString();
		PrintWriter out = response.getWriter();
		out.print(result);
		out.flush();
		out.close();
		return null;
	}
}
