package cn.edu.sanyautqc.ssc.domain;

public class Suggest {
	private String id;
	private String name;
	private String dept;
	private String tel;
	private String time;
	private String work;
	private String content;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getWork() {
		return work;
	}
	public void setWork(String work) {
		this.work = work;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "Suggest [id=" + id + ", name=" + name + ", dept=" + dept + ", tel=" + tel + ", time=" + time + ", work="
				+ work + ", content=" + content + "]";
	}
}
