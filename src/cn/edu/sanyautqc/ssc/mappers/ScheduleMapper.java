package cn.edu.sanyautqc.ssc.mappers;

import java.util.List;

import cn.edu.sanyautqc.ssc.domain.Schedule;

public interface ScheduleMapper {
	int addSchedule(Schedule schedule);
	List<Schedule> findAll();
	int deleteSchedule(String id);
	Schedule selectSchedule(String id);
	int updateSchedule(Schedule schedule);
	List<Schedule> getNew();
	List<Schedule> keywordSearch(String name);
}
