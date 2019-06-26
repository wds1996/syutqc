package cn.edu.sanyautqc.ssc.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import cn.edu.sanyautqc.ssc.domain.Process;
import cn.edu.sanyautqc.ssc.mappers.ProcessMapper;
import cn.edu.sanyautqc.ssc.utils.MybatisUtil;

public class ProcessDao {
	public int addProcess(Process process) {
		SqlSession session = MybatisUtil.getSqlSession();
		ProcessMapper mapper = session.getMapper(ProcessMapper.class);
		int row = mapper.addProcess(process);
		session.commit();
		session.close();
		return row;
	}
	public List<Process> findAll() {
		SqlSession session = MybatisUtil.getSqlSession();
		ProcessMapper mapper = session.getMapper(ProcessMapper.class);
		List<Process> list = mapper.findAll();
		session.close();
		return list;
	}
	public int deleteProcess(String id) {
		SqlSession session = MybatisUtil.getSqlSession();
		ProcessMapper mapper = session.getMapper(ProcessMapper.class);
		int row = mapper.deleteProcess(id);
		session.commit();
		session.close();
		return row;
	}
	public Process selectProcess(String id) {
		SqlSession session = MybatisUtil.getSqlSession();
		ProcessMapper mapper = session.getMapper(ProcessMapper.class);
		Process process = mapper.selectProcess(id);
		process.setWay("制度流程");
		session.close();
		return process;
	}
	public int updateProcess(Process process) {
		SqlSession session = MybatisUtil.getSqlSession();
		ProcessMapper mapper = session.getMapper(ProcessMapper.class);
		int row = mapper.updateProcess(process);
		session.commit();
		session.close();
		return row;
	}
	public List<Process> getNew() {
		SqlSession session = MybatisUtil.getSqlSession();
		ProcessMapper mapper = session.getMapper(ProcessMapper.class);
		List<Process> list = mapper.getNew();
		session.close();
		return list;
	}
	public List<Process> keywordSearch(String name) {
		SqlSession session = MybatisUtil.getSqlSession();
		ProcessMapper mapper = session.getMapper(ProcessMapper.class);
		List<Process> list = mapper.keywordSearch(name);
		session.close();
		return list;
	}
}
