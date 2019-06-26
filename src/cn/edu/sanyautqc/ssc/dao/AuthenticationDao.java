package cn.edu.sanyautqc.ssc.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import cn.edu.sanyautqc.ssc.domain.Authentication;
import cn.edu.sanyautqc.ssc.mappers.AuthenticationMapper;
import cn.edu.sanyautqc.ssc.utils.MybatisUtil;

public class AuthenticationDao {
	public int addAuthentication(Authentication authentication) {
		SqlSession session = MybatisUtil.getSqlSession();
		AuthenticationMapper mapper = session.getMapper(AuthenticationMapper.class);
		int row = mapper.addAuthentication(authentication);
		session.commit();
		session.close();
		return row;
	}
	public List<Authentication> findAll() {
		SqlSession session = MybatisUtil.getSqlSession();
		AuthenticationMapper mapper = session.getMapper(AuthenticationMapper.class);
		List<Authentication> list = mapper.findAll();
		session.close();
		return list;
	}
	public int deleteAuthentication(String id) {
		SqlSession session = MybatisUtil.getSqlSession();
		AuthenticationMapper mapper = session.getMapper(AuthenticationMapper.class);
		int row = mapper.deleteAuthentication(id);
		session.commit();
		session.close();
		return row;
	}
	public Authentication selectAuthentication(String id) {
		SqlSession session = MybatisUtil.getSqlSession();
		AuthenticationMapper mapper = session.getMapper(AuthenticationMapper.class);
		Authentication authentication = mapper.selectAuthentication(id);
		authentication.setWay("专业认证");
		session.close();
		return authentication;
	}
	public int updateAuthentication(Authentication authentication) {
		SqlSession session = MybatisUtil.getSqlSession();
		AuthenticationMapper mapper = session.getMapper(AuthenticationMapper.class);
		int row = mapper.updateAuthentication(authentication);
		session.commit();
		session.close();
		return row;
	}
	public List<Authentication> getNew() {
		SqlSession session = MybatisUtil.getSqlSession();
		AuthenticationMapper mapper = session.getMapper(AuthenticationMapper.class);
		List<Authentication> list = mapper.getNew();
		session.close();
		return list;
	}
	public List<Authentication> keywordSearch(String name) {
		SqlSession session = MybatisUtil.getSqlSession();
		AuthenticationMapper mapper = session.getMapper(AuthenticationMapper.class);
		List<Authentication> list = mapper.keywordSearch(name);
		session.close();
		return list;
	}
}
