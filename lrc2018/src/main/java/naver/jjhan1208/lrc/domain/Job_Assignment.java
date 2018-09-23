package naver.jjhan1208.lrc.domain;

import java.io.Serializable;

public class Job_Assignment implements Serializable{
	private int num;
	private String space;
	private String job_separ_1;
	private String job_separ_2;
	private String remark;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getSpace() {
		return space;
	}
	public void setSpace(String space) {
		this.space = space;
	}
	public String getJob_separ_1() {
		return job_separ_1;
	}
	public void setJob_separ_1(String job_separ_1) {
		this.job_separ_1 = job_separ_1;
	}
	public String getJob_separ_2() {
		return job_separ_2;
	}
	public void setJob_separ_2(String job_separ_2) {
		this.job_separ_2 = job_separ_2;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	@Override
	public String toString() {
		return "Job_Assignment [num=" + num + ", space=" + space + ", job_separ_1=" + job_separ_1 + ", job_separ_2="
				+ job_separ_2 + ", remark=" + remark + "]";
	}
	
	
}
