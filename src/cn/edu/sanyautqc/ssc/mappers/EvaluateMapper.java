package cn.edu.sanyautqc.ssc.mappers;

import java.util.List;

import cn.edu.sanyautqc.ssc.domain.Evaluate;

public interface EvaluateMapper {
	int addEvaluate(Evaluate assess);
	List<Evaluate> findAll();
	int deleteEvaluate(String id);
	Evaluate selectEvaluate(String id);
	int updateEvaluate(Evaluate evaluate);
	List<Evaluate> getNew();
	List<Evaluate> keywordSearch(String name);
}
