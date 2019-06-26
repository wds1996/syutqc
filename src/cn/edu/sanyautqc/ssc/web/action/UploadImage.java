package cn.edu.sanyautqc.ssc.web.action;

import java.io.File;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import cn.edu.sanyautqc.ssc.common.BaseAction;
import cn.edu.sanyautqc.ssc.utils.JsonUtil;

public class UploadImage extends BaseAction {
	private static final long serialVersionUID = 1L;
	private File upfile;
	private String upfileContentType;
	private String upfileFileName;
	public File getUpfile() {
		return upfile;
	}
	public void setUpfile(File upfile) {
		this.upfile = upfile;
	}
	public String getUpfileContentType() {
		return upfileContentType;
	}
	public void setUpfileContentType(String upfileContentType) {
		this.upfileContentType = upfileContentType;
	}
	public String getUpfileFileName() {
		return upfileFileName;
	}
	public void setUpfileFileName(String upfileFileName) {
		this.upfileFileName = upfileFileName;
	}
	@Override
	public String execute() throws Exception {
		response.setCharacterEncoding("UTF-8");
		String filePath = ServletActionContext.getServletContext().getRealPath("/sanya/file/image/");
		File file = new File(filePath);
		if (!file.exists())
			file.mkdirs();
		FileUtils.copyFile(upfile, new File(file, upfileFileName));
		PrintWriter out = response.getWriter();
		Map<String, Object> map = new HashMap<>();
		map.put("url", upfileFileName);
		map.put("name", upfileFileName);
		map.put("originalName", upfileFileName);
		map.put("state", "SUCCESS");
		map.put("type", upfileContentType);
		map.put("size", upfile.length());
		String result = JsonUtil.toJSONStringByFastjson(map);
		out.print(result);
        out.flush();
		out.close();
		return null;
	}
}
