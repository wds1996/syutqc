package cn.edu.sanyautqc.ssc.mappers;

import java.util.List;

import cn.edu.sanyautqc.ssc.domain.Document;

public interface FileMapper {
	int addFile(Document file);
	List<Document> findAll();
	int deleteFile(String id);
	Document selectFile(String id);
	int updateFile(Document file);
	List<Document> getNew();
	List<Document> keywordSearch(String name);
}
