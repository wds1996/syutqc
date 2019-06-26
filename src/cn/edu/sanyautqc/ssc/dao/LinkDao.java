package cn.edu.sanyautqc.ssc.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import cn.edu.sanyautqc.ssc.domain.Link;
import cn.edu.sanyautqc.ssc.mappers.LinkMapper;
import cn.edu.sanyautqc.ssc.utils.MybatisUtil;

public class LinkDao {
	public int addLink(Link link) {
		SqlSession session = MybatisUtil.getSqlSession();
		LinkMapper mapper = session.getMapper(LinkMapper.class);
		int row = mapper.addLink(link);
		session.commit();
		session.close();
		return row;
	}
	public List<Link> findAll() {
		SqlSession session = MybatisUtil.getSqlSession();
		LinkMapper mapper = session.getMapper(LinkMapper.class);
		List<Link> list = mapper.findAll();
		session.close();
		return list;
	}
	public int deleteLink(String id) {
		SqlSession session = MybatisUtil.getSqlSession();
		LinkMapper mapper = session.getMapper(LinkMapper.class);
		int row = mapper.deleteLink(id);
		session.commit();
		session.close();
		return row;
	}
	public Link selectLink(String id) {
		SqlSession session = MybatisUtil.getSqlSession();
		LinkMapper mapper = session.getMapper(LinkMapper.class);
		Link link = mapper.selectLink(id);
		session.close();
		return link;
	}
	public int updateLink(Link link) {
		SqlSession session = MybatisUtil.getSqlSession();
		LinkMapper mapper = session.getMapper(LinkMapper.class);
		int row = mapper.updateLink(link);
		session.commit();
		session.close();
		return row;
	}
}
