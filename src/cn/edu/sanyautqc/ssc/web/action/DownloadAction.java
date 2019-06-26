package cn.edu.sanyautqc.ssc.web.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.opensymphony.xwork2.ModelDriven;
import cn.edu.sanyautqc.ssc.common.BaseAction;
import cn.edu.sanyautqc.ssc.dao.AuthenticationDao;
import cn.edu.sanyautqc.ssc.dao.DownloadDao;
import cn.edu.sanyautqc.ssc.domain.Download;
import cn.edu.sanyautqc.ssc.utils.JsonUtil;
import cn.edu.sanyautqc.ssc.utils.Uuid;
import freemarker.template.TemplateException;
import net.sf.json.JSONArray;

public class DownloadAction extends BaseAction implements ModelDriven<Download> {
	private static final long serialVersionUID = 1L;
	private Download download = new Download();
	private File file;
	private String fileContentType;
	private String fileFileName;
	public Download getDownload() {
		return download;
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
	public Download getModel() {
		return download;
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
		download.setId(id);
		DownloadDao dao = new DownloadDao();
		dao.addDownload(download);
		return "toList";
	}
	public String list() throws IOException {
		response.setCharacterEncoding("UTF-8");
		DownloadDao dao = new DownloadDao();
		List<Download> list = dao.findAll();
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
		DownloadDao dao = new DownloadDao();
		PageHelper.startPage(Integer.valueOf(page), Integer.valueOf(limit));
		List<Download> list = dao.findAll();
		PageInfo<Download> pageInfo = new PageInfo<>(list);
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
		DownloadDao dao = new DownloadDao();
		download = dao.selectDownload(download.getId());
		return "new";
	}
	public String delete() {
		String id = request.getParameter("id");
		DownloadDao dao = new DownloadDao();
		dao.deleteDownload(id);
		return "toList";
	}
	public String toUpdate() {
		String id = request.getParameter("id");
		DownloadDao dao = new DownloadDao();
		download = dao.selectDownload(id);
		return "toUpdatePage";
	}
	public String update() throws IOException, TemplateException {
		DownloadDao dao = new DownloadDao();
		dao.updateDownload(download);
		return "toList";
	}
	public String getNew() throws IOException {
		response.setCharacterEncoding("UTF-8");
		DownloadDao dao = new DownloadDao();
		List<Download> list = dao.getNew();
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
		DownloadDao dao = new DownloadDao();
		List<Download> list = dao.keywordSearch(keyword);
		String result = JSONArray.fromObject(list).toString();
		PrintWriter out = response.getWriter();
		out.print(result);
		out.flush();
		out.close();
		return null;
	}
}
