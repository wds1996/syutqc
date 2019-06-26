package cn.edu.sanyautqc.ssc.mappers;

import java.util.List;

import cn.edu.sanyautqc.ssc.domain.Authentication;

public interface AuthenticationMapper {
	int addAuthentication(Authentication authentication);
	List<Authentication> findAll();
	int deleteAuthentication(String id);
	Authentication selectAuthentication(String id);
	int updateAuthentication(Authentication authentication);
	List<Authentication> getNew();
	List<Authentication> keywordSearch(String name);
}
