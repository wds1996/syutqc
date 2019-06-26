package cn.edu.sanyautqc.ssc.utils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.Map;

import freemarker.template.Configuration;
import freemarker.template.DefaultObjectWrapper;
import freemarker.template.Template;
import freemarker.template.TemplateException;

public class FreemarkerUtil {
	public static void GenerateHtml (String templateFilePath, String templateName, String target, Map<String, Object> map)
			throws IOException, TemplateException {
		Configuration configuration = new Configuration();
		configuration.setDirectoryForTemplateLoading(new File(templateFilePath));
		configuration.setObjectWrapper(new DefaultObjectWrapper());
		configuration.setDefaultEncoding("UTF-8");
		Template template = configuration.getTemplate(templateName);
		Writer writer = new OutputStreamWriter(new FileOutputStream(target), "UTF-8");
		template.process(map, writer);
		writer.close();
	}
}
