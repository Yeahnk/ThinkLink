package kr.or.ddit.groupware.vo;

import java.util.Date;
import lombok.Data;

@Data
public class ProjectVO {
	
	private int prjctNo;
	private String prjctNm;
	private int emplNo;
	private Date prjctBeginDate;
	private Date prjctEndDate;
	private String bgnDateString;
	private String endDateString;
	private String prjctCode;
	private String prjctCn;
	private String prjctColorCode;

}
