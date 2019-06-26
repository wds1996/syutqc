package cn.edu.sanyautqc.ssc.mappers;

import java.util.List;

import cn.edu.sanyautqc.ssc.domain.Survey;

public interface SurveyMapper {
	int addSurvey(Survey survey);
	List<Survey> findAll();
	int deleteSurvey(String id);
	Survey selectSurvey(String id);
	int updateSurvey(Survey survey);
}
