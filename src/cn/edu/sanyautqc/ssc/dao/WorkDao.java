package cn.edu.sanyautqc.ssc.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import cn.edu.sanyautqc.ssc.domain.Work;
import cn.edu.sanyautqc.ssc.mappers.WorkMapper;
import cn.edu.sanyautqc.ssc.utils.MybatisUtil;

public class WorkDao {
	public int addWork(Work work) {
		SqlSession session = MybatisUtil.getSqlSession();
		WorkMapper mapper = session.getMapper(WorkMapper.class);
		int row = mapper.addWork(work);
		session.commit();
		session.close();
		return row;
	}
	public List<Work> findAll() {
		SqlSession session = MybatisUtil.getSqlSession();
		WorkMapper mapper = session.getMapper(WorkMapper.class);
		List<Work> list = mapper.findAll();
		session.close();
		return list;
	}
	public int deleteWork(String id) {
		SqlSession session = MybatisUtil.getSqlSession();
		WorkMapper mapper = session.getMapper(WorkMapper.class);
		int row = mapper.deleteWork(id);
		session.commit();
		session.close();
		return row;
	}
	public Work selectWork(String id) {
		SqlSession session = MybatisUtil.getSqlSession();
		WorkMapper mapper = session.getMapper(WorkMapper.class);
		Work work = mapper.selectWork(id);
		work.setWay("工作简报");
		session.close();
		return work;
	}
	public int updateWork(Work work) {
		SqlSession session = MybatisUtil.getSqlSession();
		WorkMapper mapper = session.getMapper(WorkMapper.class);
		int row = mapper.updateWork(work);
		session.commit();
		session.close();
		return row;
	}
	public List<Work> getNew1() {
		SqlSession session = MybatisUtil.getSqlSession();
		WorkMapper mapper = session.getMapper(WorkMapper.class);
		List<Work> list = mapper.getNew1();
		session.close();
		return list;
	}
	public List<Work> getNew2() {
		SqlSession session = MybatisUtil.getSqlSession();
		WorkMapper mapper = session.getMapper(WorkMapper.class);
		List<Work> list = mapper.getNew2();
		session.close();
		return list;
	}
	public List<Work> keywordSearch(String name) {
		SqlSession session = MybatisUtil.getSqlSession();
		WorkMapper mapper = session.getMapper(WorkMapper.class);
		List<Work> list = mapper.keywordSearch(name);
		session.close();
		return list;
	}
}
