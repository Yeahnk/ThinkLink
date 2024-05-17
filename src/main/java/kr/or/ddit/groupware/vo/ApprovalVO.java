package kr.or.ddit.groupware.vo;

import java.sql.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ApprovalVO {
	private int aprovlNo;
	private int emplNo;
	private String emplNm;
	private String aprovlProflPhoto;
	private String aprovlClsfNm;
	private String aprovlDeptNm;
	private int docNo;
	private String docNm;
	private String aprovlNm;
	private String aprovlCn;
	private String aprovlMemo;
	private String aprovlTypeCode;
	private String aprovlTypeNm;
	private String aprovlSttusCode;
	private String aprovlSttusNm;
	private String aprovlIpcr;
	private String emrgncyYn;
	private Date submitDt;
	private String submitDtToString;
	private Date closDt;
	private String closDtToString;
	
	private Integer atchFileGroupNo;
	private int fileCount;
	
	private int sanctnerNo;
	private List<SanctionerVO> sanctionerList;
	private List<ApprovalRfrncVO> rfrncList;
	
	private List<MultipartFile> files;
	
	private String type;
	private String subType;
}
