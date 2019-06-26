package cn.edu.sanyautqc.ssc.web.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ModelDriven;
import cn.edu.sanyautqc.ssc.common.BaseAction;
import cn.edu.sanyautqc.ssc.dao.SurveyDao;
import cn.edu.sanyautqc.ssc.domain.Survey;
import cn.edu.sanyautqc.ssc.utils.JsonUtil;
import cn.edu.sanyautqc.ssc.utils.Uuid;
import freemarker.template.TemplateException;

public class SurveyAction extends BaseAction implements ModelDriven<Survey> {
	private static final long serialVersionUID = 1L;
	private Survey survey = new Survey();
	private File file;
	private String fileContentType;
	private String fileFileName;
	public Survey getSurvey() {
		return survey;
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
	public Survey getModel() {
		return survey;
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
	public String add() throws IOException, TemplateException {
		String id = Uuid.getUUID();
		survey.setId(id);
		SurveyDao dao = new SurveyDao();
		dao.addSurvey(survey);
		return "toList";
	}
	public String list() throws IOException {
		response.setCharacterEncoding("UTF-8");
		SurveyDao dao = new SurveyDao();
		List<Survey> list = dao.findAll();
		String result = JsonUtil.toJSONString(list);
		PrintWriter out = response.getWriter();
		out.print(result);
		out.flush();
		out.close();
		return null;
	}
	public String delete() {
		String id = request.getParameter("id");
		SurveyDao dao = new SurveyDao();
		dao.deleteSurvey(id);
		return "toList";
	}
	public String toUpdate() {
		String id = request.getParameter("id");
		SurveyDao dao = new SurveyDao();
		survey = dao.selectSurvey(id);
		return "toUpdatePage";
	}
	public String update() throws IOException, TemplateException {
		SurveyDao dao = new SurveyDao();
		dao.updateSurvey(survey);
		return "toList";
	}
}
