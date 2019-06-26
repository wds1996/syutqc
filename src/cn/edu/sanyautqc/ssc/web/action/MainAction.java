package cn.edu.sanyautqc.ssc.web.action;

import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.ActionSupport;

import cn.edu.sanyautqc.ssc.dao.AssessDao;
import cn.edu.sanyautqc.ssc.dao.FileDao;
import cn.edu.sanyautqc.ssc.dao.NoticeDao;
import cn.edu.sanyautqc.ssc.dao.ProcessDao;
import cn.edu.sanyautqc.ssc.dao.ReportDao;
import cn.edu.sanyautqc.ssc.dao.ScheduleDao;
import cn.edu.sanyautqc.ssc.dao.WorkDao;
import cn.edu.sanyautqc.ssc.domain.Assess;
import cn.edu.sanyautqc.ssc.domain.Notice;
import cn.edu.sanyautqc.ssc.domain.Work;
import cn.edu.sanyautqc.ssc.domain.Report;
import cn.edu.sanyautqc.ssc.domain.Schedule;
import cn.edu.sanyautqc.ssc.domain.Process;
import cn.edu.sanyautqc.ssc.domain.Document;

public class MainAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private List<Notice> noticeList = new ArrayList<>();
	private List<Assess> assessList = new ArrayList<>();
	private List<Work> workList = new ArrayList<>();
	private List<Report> reportList = new ArrayList<>();
	private List<Schedule> scheduleList = new ArrayList<>();
	private List<Process> processList = new ArrayList<>();
	private List<Document> documentList = new ArrayList<>();
	public List<Notice> getNoticeList() {
		return noticeList;
	}
	public List<Assess> getAssessList() {
		return assessList;
	}
	public List<Work> getWorkList() {
		return workList;
	}
	public List<Report> getReportList() {
		return reportList;
	}
	public List<Schedule> getScheduleList() {
		return scheduleList;
	}
	public List<Process> getProcessList() {
		return processList;
	}
	public List<Document> getDocumentList() {
		return documentList;
	}
	@Override
	public String execute() throws Exception {
		NoticeDao noticeDao = new NoticeDao();
		noticeList = noticeDao.findAll();
		AssessDao assessDao = new AssessDao();
		assessList = assessDao.findAll();
		WorkDao workDao = new WorkDao();
		workList = workDao.findAll();
		ReportDao reportDao = new ReportDao();
		reportList = reportDao.findAll();
		ScheduleDao scheduleDao = new ScheduleDao();
		scheduleList = scheduleDao.findAll();
		ProcessDao processDao = new ProcessDao();
		processList = processDao.findAll();
		FileDao fileDao = new FileDao();
		documentList = fileDao.findAll();
		return "success";
	}
}
