package cn.edu.sanyautqc.ssc.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import cn.edu.sanyautqc.ssc.domain.Suggest;
import cn.edu.sanyautqc.ssc.mappers.SuggestMapper;
import cn.edu.sanyautqc.ssc.utils.MybatisUtil;

public class SuggestDao {
	public int add(Suggest suggest) {
		SqlSession session = MybatisUtil.getSqlSession();
		SuggestMapper mapper = session.getMapper(SuggestMapper.class);
		int row = mapper.add(suggest);
		session.commit();
		session.close();
		return row;
	}
	public List<Suggest> findAll() {
		SqlSession session = MybatisUtil.getSqlSession();
		SuggestMapper mapper = session.getMapper(SuggestMapper.class);
		List<Suggest> list = mapper.findAll();
		session.close();
		return list;
	}
	public int delete(String id) {
		SqlSession session = MybatisUtil.getSqlSession();
		SuggestMapper mapper = session.getMapper(SuggestMapper.class);
		int row = mapper.delete(id);
		session.commit();
		session.close();
		return row;
	}
	public Suggest detail(String id) {
		SqlSession session = MybatisUtil.getSqlSession();
		SuggestMapper mapper = session.getMapper(SuggestMapper.class);
		Suggest suggest = mapper.detail(id);
		session.close();
		return suggest;
	}
	public List<Suggest> keywordSearch(String name) {
		SqlSession session = MybatisUtil.getSqlSession();
		SuggestMapper mapper = session.getMapper(SuggestMapper.class);
		List<Suggest> list = mapper.keywordSearch(name);
		session.close();
		return list;
	}
}
