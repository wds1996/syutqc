package cn.edu.sanyautqc.ssc.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import cn.edu.sanyautqc.ssc.domain.Assess;
import cn.edu.sanyautqc.ssc.mappers.AssessMapper;
import cn.edu.sanyautqc.ssc.utils.MybatisUtil;

public class AssessDao {
	public int addAssess(Assess assess) {
		SqlSession session = MybatisUtil.getSqlSession();
		AssessMapper mapper = session.getMapper(AssessMapper.class);
		int row = mapper.addAssess(assess);
		session.commit();
		session.close();
		return row;
	}
	public List<Assess> findAll() {
		SqlSession session = MybatisUtil.getSqlSession();
		AssessMapper mapper = session.getMapper(AssessMapper.class);
		List<Assess> list = mapper.findAll();
		session.close();
		return list;
	}
	public int deleteAssess(String id) {
		SqlSession session = MybatisUtil.getSqlSession();
		AssessMapper mapper = session.getMapper(AssessMapper.class);
		int row = mapper.deleteAssess(id);
		session.commit();
		session.close();
		return row;
	}
	public Assess selectAssess(String id) {
		SqlSession session = MybatisUtil.getSqlSession();
		AssessMapper mapper = session.getMapper(AssessMapper.class);
		Assess assess = mapper.selectAssess(id);
		assess.setWay("评估动态");
		session.close();
		return assess;
	}
	public int updateAssess(Assess assess) {
		SqlSession session = MybatisUtil.getSqlSession();
		AssessMapper mapper = session.getMapper(AssessMapper.class);
		int row = mapper.updateAssess(assess);
		session.commit();
		session.close();
		return row;
	}
	public List<Assess> getNew() {
		SqlSession session = MybatisUtil.getSqlSession();
		AssessMapper mapper = session.getMapper(AssessMapper.class);
		List<Assess> list = mapper.getNew();
		session.close();
		return list;
	}
	public List<Assess> keywordSearch(String name) {
		SqlSession session = MybatisUtil.getSqlSession();
		AssessMapper mapper = session.getMapper(AssessMapper.class);
		List<Assess> list = mapper.keywordSearch(name);
		session.close();
		return list;
	}
}
