package cn.edu.sanyautqc.ssc.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import cn.edu.sanyautqc.ssc.domain.Download;
import cn.edu.sanyautqc.ssc.mappers.DownloadMapper;
import cn.edu.sanyautqc.ssc.utils.MybatisUtil;

public class DownloadDao {
	public int addDownload(Download download) {
		SqlSession session = MybatisUtil.getSqlSession();
		DownloadMapper mapper = session.getMapper(DownloadMapper.class);
		int row = mapper.addDownload(download);
		session.commit();
		session.close();
		return row;
	}
	public List<Download> findAll() {
		SqlSession session = MybatisUtil.getSqlSession();
		DownloadMapper mapper = session.getMapper(DownloadMapper.class);
		List<Download> list = mapper.findAll();
		session.close();
		return list;
	}
	public int deleteDownload(String id) {
		SqlSession session = MybatisUtil.getSqlSession();
		DownloadMapper mapper = session.getMapper(DownloadMapper.class);
		int row = mapper.deleteDownload(id);
		session.commit();
		session.close();
		return row;
	}
	public Download selectDownload(String id) {
		SqlSession session = MybatisUtil.getSqlSession();
		DownloadMapper mapper = session.getMapper(DownloadMapper.class);
		Download download = mapper.selectDownload(id);
		download.setWay("下载中心");
		session.close();
		return download;
	}
	public int updateDownload(Download download) {
		SqlSession session = MybatisUtil.getSqlSession();
		DownloadMapper mapper = session.getMapper(DownloadMapper.class);
		int row = mapper.updateDownload(download);
		session.commit();
		session.close();
		return row;
	}
	public List<Download> getNew() {
		SqlSession session = MybatisUtil.getSqlSession();
		DownloadMapper mapper = session.getMapper(DownloadMapper.class);
		List<Download> list = mapper.getNew();
		session.close();
		return list;
	}
	public List<Download> keywordSearch(String name) {
		SqlSession session = MybatisUtil.getSqlSession();
		DownloadMapper mapper = session.getMapper(DownloadMapper.class);
		List<Download> list = mapper.keywordSearch(name);
		session.close();
		return list;
	}
}
