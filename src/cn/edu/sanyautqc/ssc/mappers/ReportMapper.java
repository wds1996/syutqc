package cn.edu.sanyautqc.ssc.mappers;

import java.util.List;

import cn.edu.sanyautqc.ssc.domain.Report;

public interface ReportMapper {
	int addReport(Report report);
	List<Report> findAll();
	int deleteReport(String id);
	Report selectReport(String id);
	int updateReport(Report report);
	List<Report> getNew();
	List<Report> keywordSearch(String name);
}
