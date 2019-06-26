package cn.edu.sanyautqc.ssc.mappers;

import java.util.List;

import cn.edu.sanyautqc.ssc.domain.Notice;

public interface NoticeMapper {
	int addNotice(Notice notice);
	List<Notice> findAll();
	int deleteNotice(String id);
	Notice selectNotice(String id);
	int updateNotice(Notice notice);
	List<Notice> getNew();
	List<Notice> keywordSearch(String name);
}
