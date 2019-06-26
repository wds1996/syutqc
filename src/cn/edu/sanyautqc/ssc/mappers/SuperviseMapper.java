package cn.edu.sanyautqc.ssc.mappers;

import java.util.List;

import cn.edu.sanyautqc.ssc.domain.Supervise;

public interface SuperviseMapper {
	int addSupervise(Supervise supervise);
	List<Supervise> findAll();
	int deleteSupervise(String id);
	Supervise selectSupervise(String id);
	int updateSupervise(Supervise supervise);
	List<Supervise> getNew();
	List<Supervise> keywordSearch(String name);
}
