package cn.edu.sanyautqc.ssc.mappers;

import java.util.List;

import cn.edu.sanyautqc.ssc.domain.Link;

public interface LinkMapper {
	int addLink(Link link);
	List<Link> findAll();
	int deleteLink(String id);
	Link selectLink(String id);
	int updateLink(Link link);
}
