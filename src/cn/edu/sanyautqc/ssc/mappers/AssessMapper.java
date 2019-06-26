package cn.edu.sanyautqc.ssc.mappers;

import java.util.List;

import cn.edu.sanyautqc.ssc.domain.Assess;

public interface AssessMapper {
	int addAssess(Assess assess);
	List<Assess> findAll();
	int deleteAssess(String id);
	Assess selectAssess(String id);
	int updateAssess(Assess assess);
	List<Assess> getNew();
	List<Assess> keywordSearch(String name);
}
