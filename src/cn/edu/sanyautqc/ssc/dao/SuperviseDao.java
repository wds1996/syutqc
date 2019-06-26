package cn.edu.sanyautqc.ssc.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import cn.edu.sanyautqc.ssc.domain.Supervise;
import cn.edu.sanyautqc.ssc.mappers.SuperviseMapper;
import cn.edu.sanyautqc.ssc.utils.MybatisUtil;

public class SuperviseDao {
	public int addSupervise(Supervise supervise) {
		SqlSession session = MybatisUtil.getSqlSession();
		SuperviseMapper mapper = session.getMapper(SuperviseMapper.class);
		int row = mapper.addSupervise(supervise);
		session.commit();
		session.close();
		return row;
	}
	public List<Supervise> findAll() {
		SqlSession session = MybatisUtil.getSqlSession();
		SuperviseMapper mapper = session.getMapper(SuperviseMapper.class);
		List<Supervise> list = mapper.findAll();
		session.close();
		return list;
	}
	public int deleteSupervise(String id) {
		SqlSession session = MybatisUtil.getSqlSession();
		SuperviseMapper mapper = session.getMapper(SuperviseMapper.class);
		int row = mapper.deleteSupervise(id);
		session.commit();
		session.close();
		return row;
	}
	public Supervise selectSupervise(String id) {
		SqlSession session = MybatisUtil.getSqlSession();
		SuperviseMapper mapper = session.getMapper(SuperviseMapper.class);
		Supervise supervise = mapper.selectSupervise(id);
		supervise.setWay("教学督导");
		session.close();
		return supervise;
	}
	public int updateSupervise(Supervise supervise) {
		SqlSession session = MybatisUtil.getSqlSession();
		SuperviseMapper mapper = session.getMapper(SuperviseMapper.class);
		int row = mapper.updateSupervise(supervise);
		session.commit();
		session.close();
		return row;
	}
	public List<Supervise> getNew() {
		SqlSession session = MybatisUtil.getSqlSession();
		SuperviseMapper mapper = session.getMapper(SuperviseMapper.class);
		List<Supervise> list = mapper.getNew();
		session.close();
		return list;
	}
	public List<Supervise> keywordSearch(String name) {
		SqlSession session = MybatisUtil.getSqlSession();
		SuperviseMapper mapper = session.getMapper(SuperviseMapper.class);
		List<Supervise> list = mapper.keywordSearch(name);
		session.close();
		return list;
	}
}
