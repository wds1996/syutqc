package cn.edu.sanyautqc.ssc.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import cn.edu.sanyautqc.ssc.domain.Notice;
import cn.edu.sanyautqc.ssc.mappers.NoticeMapper;
import cn.edu.sanyautqc.ssc.utils.MybatisUtil;

public class NoticeDao {
	public int addNotice(Notice notice) {
		SqlSession session = MybatisUtil.getSqlSession();
		NoticeMapper mapper = session.getMapper(NoticeMapper.class);
		int row = mapper.addNotice(notice);
		session.commit();
		session.close();
		return row;
	}
	public List<Notice> findAll() {
		SqlSession session = MybatisUtil.getSqlSession();
		NoticeMapper mapper = session.getMapper(NoticeMapper.class);
		List<Notice> list = mapper.findAll();
		session.close();
		return list;
	}
	public int deleteNotice(String id) {
		SqlSession session = MybatisUtil.getSqlSession();
		NoticeMapper mapper = session.getMapper(NoticeMapper.class);
		int row = mapper.deleteNotice(id);
		session.commit();
		session.close();
		return row;
	}
	public Notice selectNotice(String id) {
		SqlSession session = MybatisUtil.getSqlSession();
		NoticeMapper mapper = session.getMapper(NoticeMapper.class);
		Notice notice = mapper.selectNotice(id);
		notice.setWay("通知公告");
		session.close();
		return notice;
	}
	public int updateNotice(Notice notice) {
		SqlSession session = MybatisUtil.getSqlSession();
		NoticeMapper mapper = session.getMapper(NoticeMapper.class);
		int row = mapper.updateNotice(notice);
		session.commit();
		session.close();
		return row;
	}
	public List<Notice> getNew() {
		SqlSession session = MybatisUtil.getSqlSession();
		NoticeMapper mapper = session.getMapper(NoticeMapper.class);
		List<Notice> list = mapper.getNew();
		session.close();
		return list;
	}
	public List<Notice> keywordSearch(String name) {
		SqlSession session = MybatisUtil.getSqlSession();
		NoticeMapper mapper = session.getMapper(NoticeMapper.class);
		List<Notice> list = mapper.keywordSearch(name);
		session.close();
		return list;
	}
}
