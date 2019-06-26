package cn.edu.sanyautqc.ssc.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import cn.edu.sanyautqc.ssc.domain.Document;
import cn.edu.sanyautqc.ssc.mappers.FileMapper;
import cn.edu.sanyautqc.ssc.utils.MybatisUtil;

public class FileDao {
	public int addFile(Document file) {
		SqlSession session = MybatisUtil.getSqlSession();
		FileMapper mapper = session.getMapper(FileMapper.class);
		int row = mapper.addFile(file);
		session.commit();
		session.close();
		return row;
	}
	public List<Document> findAll() {
		SqlSession session = MybatisUtil.getSqlSession();
		FileMapper mapper = session.getMapper(FileMapper.class);
		List<Document> list = mapper.findAll();
		session.close();
		return list;
	}
	public int deleteFile(String id) {
		SqlSession session = MybatisUtil.getSqlSession();
		FileMapper mapper = session.getMapper(FileMapper.class);
		int row = mapper.deleteFile(id);
		session.commit();
		session.close();
		return row;
	}
	public Document selectFile(String id) {
		SqlSession session = MybatisUtil.getSqlSession();
		FileMapper mapper = session.getMapper(FileMapper.class);
		Document file = mapper.selectFile(id);
		file.setWay("政策文件");
		session.close();
		return file;
	}
	public int updateFile(Document file) {
		SqlSession session = MybatisUtil.getSqlSession();
		FileMapper mapper = session.getMapper(FileMapper.class);
		int row = mapper.updateFile(file);
		session.commit();
		session.close();
		return row;
	}
	public List<Document> getNew() {
		SqlSession session = MybatisUtil.getSqlSession();
		FileMapper mapper = session.getMapper(FileMapper.class);
		List<Document> list = mapper.getNew();
		session.close();
		return list;
	}
	public List<Document> keywordSearch(String name) {
		SqlSession session = MybatisUtil.getSqlSession();
		FileMapper mapper = session.getMapper(FileMapper.class);
		List<Document> list = mapper.keywordSearch(name);
		session.close();
		return list;
	}
}
