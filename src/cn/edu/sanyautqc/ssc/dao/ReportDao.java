package cn.edu.sanyautqc.ssc.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import cn.edu.sanyautqc.ssc.domain.Report;
import cn.edu.sanyautqc.ssc.mappers.ReportMapper;
import cn.edu.sanyautqc.ssc.utils.MybatisUtil;

public class ReportDao {
	public int addReport(Report report) {
		SqlSession session = MybatisUtil.getSqlSession();
		ReportMapper mapper = session.getMapper(ReportMapper.class);
		int row = mapper.addReport(report);
		session.commit();
		session.close();
		return row;
	}
	public List<Report> findAll() {
		SqlSession session = MybatisUtil.getSqlSession();
		ReportMapper mapper = session.getMapper(ReportMapper.class);
		List<Report> list = mapper.findAll();
		session.close();
		return list;
	}
	public int deleteReport(String id) {
		SqlSession session = MybatisUtil.getSqlSession();
		ReportMapper mapper = session.getMapper(ReportMapper.class);
		int row = mapper.deleteReport(id);
		session.commit();
		session.close();
		return row;
	}
	public Report selectReport(String id) {
		SqlSession session = MybatisUtil.getSqlSession();
		ReportMapper mapper = session.getMapper(ReportMapper.class);
		Report report = mapper.selectReport(id);
		report.setWay("质量报告");
		session.close();
		return report;
	}
	public int updateReport(Report report) {
		SqlSession session = MybatisUtil.getSqlSession();
		ReportMapper mapper = session.getMapper(ReportMapper.class);
		int row = mapper.updateReport(report);
		session.commit();
		session.close();
		return row;
	}
	public List<Report> getNew() {
		SqlSession session = MybatisUtil.getSqlSession();
		ReportMapper mapper = session.getMapper(ReportMapper.class);
		List<Report> list = mapper.getNew();
		session.close();
		return list;
	}
	public List<Report> keywordSearch(String name) {
		SqlSession session = MybatisUtil.getSqlSession();
		ReportMapper mapper = session.getMapper(ReportMapper.class);
		List<Report> list = mapper.keywordSearch(name);
		session.close();
		return list;
	}
}
