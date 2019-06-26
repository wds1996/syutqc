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
import cn.edu.sanyautqc.ssc.dao.NoticeDao;
import cn.edu.sanyautqc.ssc.dao.ProcessDao;
import cn.edu.sanyautqc.ssc.domain.Process;
import cn.edu.sanyautqc.ssc.utils.FreemarkerUtil;
import cn.edu.sanyautqc.ssc.utils.JsonUtil;
import cn.edu.sanyautqc.ssc.utils.Uuid;
import freemarker.template.TemplateException;
import net.sf.json.JSONArray;

public class ProcessAction extends BaseAction implements ModelDriven<Process> {
	private static final long serialVersionUID = 1L;
	private Process process = new Process();
	private File file;
	private String fileContentType;
	private String fileFileName;
	public Process getProcess() {
		return process;
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
	public Process getModel() {
		return process;
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
		process.setId(id);
		ProcessDao dao = new ProcessDao();
		dao.addProcess(process);
		return "toList";
	}
	public String list() throws IOException {
		response.setCharacterEncoding("UTF-8");
		ProcessDao dao = new ProcessDao();
		List<Process> list = dao.findAll();
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
		ProcessDao dao = new ProcessDao();
		PageHelper.startPage(Integer.valueOf(page), Integer.valueOf(limit));
		List<Process> list = dao.findAll();
		PageInfo<Process> pageInfo = new PageInfo<>(list);
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
	public String delete() {
		String id = request.getParameter("id");
		ProcessDao dao = new ProcessDao();
		dao.deleteProcess(id);
		return "toList";
	}
	public String findById() throws IOException {
		response.setCharacterEncoding("UTF-8");
		ProcessDao dao = new ProcessDao();
		process = dao.selectProcess(process.getId());
		return "new";
	}
	public String toUpdate() {
		String id = request.getParameter("id");
		ProcessDao dao = new ProcessDao();
		process = dao.selectProcess(id);
		return "toUpdatePage";
	}
	public String update() throws IOException, TemplateException {
		ProcessDao dao = new ProcessDao();
		dao.updateProcess(process);
		return "toList";
	}
	public String getNew() throws IOException {
		response.setCharacterEncoding("UTF-8");
		ProcessDao dao = new ProcessDao();
		List<Process> list = dao.getNew();
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
		ProcessDao dao = new ProcessDao();
		List<Process> list = dao.keywordSearch(keyword);
		String result = JSONArray.fromObject(list).toString();
		PrintWriter out = response.getWriter();
		out.print(result);
		out.flush();
		out.close();
		return null;
	}
}
