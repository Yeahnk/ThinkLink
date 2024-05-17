package kr.or.ddit.groupware.vo;

import java.util.Date;

import lombok.Data;
/**
 * 문서양식VO
 * @author <strong>이영주</strong>
 * @see DocumentsVO
 */
@Data
public class DocumentsVO {
	private int docNo;
	private String docNm;
	private String docCn;
	private String docTypeCode;
	private String docTypeNm;
	private String useYn;
	private int docRegister;
	private Date docRgdde;
	private int docUpdusr;
	private Date docUpdde;
	private String docCodeNo;
	
	private String id;
	private String text;
	private String parent;
	private String emplNm;
}
