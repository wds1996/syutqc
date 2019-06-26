package cn.edu.sanyautqc.ssc.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import cn.edu.sanyautqc.ssc.domain.Survey;
import cn.edu.sanyautqc.ssc.mappers.SurveyMapper;
import cn.edu.sanyautqc.ssc.utils.MybatisUtil;

public class SurveyDao {
	public int addSurvey(Survey survey) {
		SqlSession session = MybatisUtil.getSqlSession();
		SurveyMapper mapper = session.getMapper(SurveyMapper.class);
		int row = mapper.addSurvey(survey);
		session.commit();
		session.close();
		return row;
	}
	public List<Survey> findAll() {
		SqlSession session = MybatisUtil.getSqlSession();
		SurveyMapper mapper = session.getMapper(SurveyMapper.class);
		List<Survey> list = mapper.findAll();
		session.close();
		return list;
	}
	public int deleteSurvey(String id) {
		SqlSession session = MybatisUtil.getSqlSession();
		SurveyMapper mapper = session.getMapper(SurveyMapper.class);
		int row = mapper.deleteSurvey(id);
		session.commit();
		session.close();
		return row;
	}
	public Survey selectSurvey(String id) {
		SqlSession session = MybatisUtil.getSqlSession();
		SurveyMapper mapper = session.getMapper(SurveyMapper.class);
		Survey survey = mapper.selectSurvey(id);
		session.close();
		return survey;
	}
	public int updateSurvey(Survey survey) {
		SqlSession session = MybatisUtil.getSqlSession();
		SurveyMapper mapper = session.getMapper(SurveyMapper.class);
		int row = mapper.updateSurvey(survey);
		session.commit();
		session.close();
		return row;
	}
}
