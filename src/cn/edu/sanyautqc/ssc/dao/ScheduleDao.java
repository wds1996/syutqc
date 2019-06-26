package cn.edu.sanyautqc.ssc.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import cn.edu.sanyautqc.ssc.domain.Schedule;
import cn.edu.sanyautqc.ssc.mappers.ScheduleMapper;
import cn.edu.sanyautqc.ssc.utils.MybatisUtil;

public class ScheduleDao {
	public int addSchedule(Schedule schedule) {
		SqlSession session = MybatisUtil.getSqlSession();
		ScheduleMapper mapper = session.getMapper(ScheduleMapper.class);
		int row = mapper.addSchedule(schedule);
		session.commit();
		session.close();
		return row;
	}
	public List<Schedule> findAll() {
		SqlSession session = MybatisUtil.getSqlSession();
		ScheduleMapper mapper = session.getMapper(ScheduleMapper.class);
		List<Schedule> list = mapper.findAll();
		session.close();
		return list;
	}
	public int deleteSchedule(String id) {
		SqlSession session = MybatisUtil.getSqlSession();
		ScheduleMapper mapper = session.getMapper(ScheduleMapper.class);
		int row = mapper.deleteSchedule(id);
		session.commit();
		session.close();
		return row;
	}
	public Schedule selectSchedule(String id) {
		SqlSession session = MybatisUtil.getSqlSession();
		ScheduleMapper mapper = session.getMapper(ScheduleMapper.class);
		Schedule schedule = mapper.selectSchedule(id);
		schedule.setWay("工作交流");
		session.close();
		return schedule;
	}
	public int updateSchedule(Schedule schedule) {
		SqlSession session = MybatisUtil.getSqlSession();
		ScheduleMapper mapper = session.getMapper(ScheduleMapper.class);
		int row = mapper.updateSchedule(schedule);
		session.commit();
		session.close();
		return row;
	}
	public List<Schedule> getNew() {
		SqlSession session = MybatisUtil.getSqlSession();
		ScheduleMapper mapper = session.getMapper(ScheduleMapper.class);
		List<Schedule> list = mapper.getNew();
		session.close();
		return list;
	}
	public List<Schedule> keywordSearch(String name) {
		SqlSession session = MybatisUtil.getSqlSession();
		ScheduleMapper mapper = session.getMapper(ScheduleMapper.class);
		List<Schedule> list = mapper.keywordSearch(name);
		session.close();
		return list;
	}
}
