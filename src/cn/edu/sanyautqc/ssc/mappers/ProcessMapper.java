package cn.edu.sanyautqc.ssc.mappers;

import java.util.List;

import cn.edu.sanyautqc.ssc.domain.Process;

public interface ProcessMapper {
	int addProcess(Process process);
	List<Process> findAll();
	int deleteProcess(String id);
	Process selectProcess(String id);
	int updateProcess(Process process);
	List<Process> getNew();
	List<Process> keywordSearch(String name);
}
