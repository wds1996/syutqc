package cn.edu.sanyautqc.ssc.mappers;

import java.util.List;

import cn.edu.sanyautqc.ssc.domain.Suggest;

public interface SuggestMapper {
	int add(Suggest suggest);
	List<Suggest> findAll();
	int delete(String id);
	Suggest detail(String id);
	List<Suggest> keywordSearch(String name);
}
