package kr.or.ddit.groupware.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class RentalVO  {

	private int erntNo;
	private int emplNo;
	private String eqpnmCd;
	private int erntQy;
	private String erntResn;
	private String prmisnYn;
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm", timezone = "Asia/Seoul")
	private Date erntBeginDt;
	 @JsonFormat(pattern = "yyyy-MM-dd HH:mm", timezone = "Asia/Seoul")
	private Date erntEndDt;
	 @JsonFormat(pattern = "yyyy-MM-dd HH:mm", timezone = "Asia/Seoul")
	private Date erntRturnDt;
	 
	private Date rgsde;
	private String resourceType;
	

	
//	SEQ_ERNT
//	대여한 사원
//	차량(6~10), 비품(11, 15)
//	비품수량, 차량은 1
//	대여 사유
//	대여승인여부 (Y/N)
//	시작시간
//	종료시간
//	반납시간
//	신청시간
//	자원명: room/vehicle, supplies
//	
}
