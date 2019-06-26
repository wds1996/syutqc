package cn.edu.sanyautqc.ssc.mappers;

import java.util.List;

import cn.edu.sanyautqc.ssc.domain.Work;

public interface WorkMapper {
	int addWork(Work work);
	List<Work> findAll();
	int deleteWork(String id);
	Work selectWork(String id);
	int updateWork(Work work);
	List<Work> getNew1();
	List<Work> getNew2();
	List<Work> keywordSearch(String name);
}
