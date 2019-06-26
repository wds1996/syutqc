package cn.edu.sanyautqc.ssc.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import cn.edu.sanyautqc.ssc.domain.Evaluate;
import cn.edu.sanyautqc.ssc.mappers.EvaluateMapper;
import cn.edu.sanyautqc.ssc.utils.MybatisUtil;

public class EvaluateDao {
	public int addEvaluate(Evaluate evaluate) {
		SqlSession session = MybatisUtil.getSqlSession();
		EvaluateMapper mapper = session.getMapper(EvaluateMapper.class);
		int row = mapper.addEvaluate(evaluate);
		session.commit();
		session.close();
		return row;
	}
	public List<Evaluate> findAll() {
		SqlSession session = MybatisUtil.getSqlSession();
		EvaluateMapper mapper = session.getMapper(EvaluateMapper.class);
		List<Evaluate> list = mapper.findAll();
		session.close();
		return list;
	}
	public int deleteEvaluate(String id) {
		SqlSession session = MybatisUtil.getSqlSession();
		EvaluateMapper mapper = session.getMapper(EvaluateMapper.class);
		int row = mapper.deleteEvaluate(id);
		session.commit();
		session.close();
		return row;
	}
	public Evaluate selectEvaluate(String id) {
		SqlSession session = MybatisUtil.getSqlSession();
		EvaluateMapper mapper = session.getMapper(EvaluateMapper.class);
		Evaluate evaluate = mapper.selectEvaluate(id);
		evaluate.setWay("教学评价");
		session.close();
		return evaluate;
	}
	public int updateEvaluate(Evaluate evaluate) {
		SqlSession session = MybatisUtil.getSqlSession();
		EvaluateMapper mapper = session.getMapper(EvaluateMapper.class);
		int row = mapper.updateEvaluate(evaluate);
		session.commit();
		session.close();
		return row;
	}
	public List<Evaluate> getNew() {
		SqlSession session = MybatisUtil.getSqlSession();
		EvaluateMapper mapper = session.getMapper(EvaluateMapper.class);
		List<Evaluate> list = mapper.getNew();
		session.close();
		return list;
	}
	public List<Evaluate> keywordSearch(String name) {
		SqlSession session = MybatisUtil.getSqlSession();
		EvaluateMapper mapper = session.getMapper(EvaluateMapper.class);
		List<Evaluate> list = mapper.keywordSearch(name);
		session.close();
		return list;
	}
}
