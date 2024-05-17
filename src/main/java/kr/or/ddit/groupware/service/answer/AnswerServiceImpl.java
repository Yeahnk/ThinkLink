package kr.or.ddit.groupware.service.answer;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.groupware.mapper.answer.IAnswerMapper;
import kr.or.ddit.groupware.util.NotificationUtil;
import kr.or.ddit.groupware.util.Result;
import kr.or.ddit.groupware.vo.AnswerVO;
import kr.or.ddit.groupware.vo.BoardVO;
import kr.or.ddit.groupware.vo.EmployeeVO;
import kr.or.ddit.groupware.vo.NotificationVO;

@Service
public class AnswerServiceImpl implements IAnswerService {

	@Inject
	private IAnswerMapper answerMapper;
	
	@Inject
	private NotificationUtil noti;

	@Override
	public void insertAnswer(AnswerVO answerVO) {
		 answerMapper.insertAnswer(answerVO);
		 
//		 NotificationVO notificationVO = new NotificationVO();
////		 BoardVO boardVO = new BoardVO();
//		 // target => 게시물 작성자 
//		 // 게시물 작성자는 = board 안에 작성자?
//		 
//		 EmployeeVO employeeVO = new EmployeeVO();
//		 
//			notificationVO.setNtcnRecp(employeeVO.getEmplNo());
//			notificationVO.setNtcnTypeCode("N107"); // 받은메일
//			notificationVO.setNtcnContent(content);
//			notificationVO.setNtcnUrl("/mail/detail?emailNo=" + emailVO.getEmailNo() + "&where=inbox");
	}
	
	

	@Override
	public List<AnswerVO> selectAnswer(int bbscttNo) {
		return answerMapper.selectAnswer(bbscttNo);
	}



	@Override
	public String updateAnswer(AnswerVO answerVO) {
		int status = answerMapper.updateAnswer(answerVO);
		return status > 0 ? Result.OK.toString() : Result.FAILED.toString();
	}



	@Override
	public String deleteAnswer(AnswerVO answerVO) {
		int status = answerMapper.deleteAnswer(answerVO);
		return status > 0 ? Result.OK.toString() : Result.FAILED.toString();
	}


	
	
	
	

	@Override
	public void insertAnswer2(AnswerVO answerVO) {
		answerMapper.insertAnswer2(answerVO);
		
	}



	@Override
	public List<AnswerVO> selectReply(int upperAnswerNo) {
		return answerMapper.selectReply(upperAnswerNo);
	}



	@Override
	public String updateReply(AnswerVO answerVO) {
		int status = answerMapper.updateReply(answerVO);
		return status > 0 ? Result.OK.toString() : Result.FAILED.toString();
	}



	@Override
	public String deleteReply(AnswerVO answerVO) {
		int status = answerMapper.deleteReply(answerVO);
		return status > 0 ? Result.OK.toString() : Result.FAILED.toString();
	}
}
