package kr.or.ddit.groupware.service.widget;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.groupware.mapper.widget.IWidgetMapper;
import kr.or.ddit.groupware.util.Result;
import kr.or.ddit.groupware.vo.WidgetVO;

@Service
public class WidgetServiceImpl implements IWidgetService {

	@Inject
	private IWidgetMapper widgetMapper;

	@Transactional(rollbackFor = {SQLException.class, RuntimeException.class})
	@Override
	public List<WidgetVO> selectWidgetList(int emplNo) {

		int cnt = widgetMapper.isExistWidgetData(emplNo);

		if (cnt == 0) {
			List<WidgetVO> createdWidgetList = createDefaultWidget();
			for (WidgetVO widgetVO : createdWidgetList) {
				widgetVO.setEmplNo(emplNo);
				int result = widgetMapper.insertDefaultWidget(widgetVO);
				
				if(result <= 0) {
					throw new RuntimeException();
				}
			}
		}

		return widgetMapper.selectWidgetList(emplNo);
	}

	public List<WidgetVO> createDefaultWidget() {
		List<WidgetVO> widgetsTitleList = widgetMapper.getWidgetsTitle();
		List<WidgetVO> widgetList = new ArrayList<WidgetVO>();

		for (WidgetVO widgetVO : widgetsTitleList) {
			String widgetName = widgetVO.getWidgName();
			String widgetCode = widgetVO.getWidgCode();
			
			WidgetVO widgVO = new WidgetVO();
			widgVO.setWidgCode(widgetCode);

			switch (widgetName) {
			case "내 정보":
				widgVO.setWidgX(0);
				widgVO.setWidgY(0);
				widgVO.setWidgW(2);
				widgVO.setWidgH(3);
				break;
			case "근태관리":
				widgVO.setWidgX(0);
				widgVO.setWidgY(3);
				widgVO.setWidgW(2);
				widgVO.setWidgH(2);
				break;
			case "사내공지":
				widgVO.setWidgX(2);
				widgVO.setWidgY(0);
				widgVO.setWidgW(4);
				widgVO.setWidgH(2);
				break;
			case "일정관리":
				widgVO.setWidgX(2);
				widgVO.setWidgY(2);
				widgVO.setWidgW(4);
				widgVO.setWidgH(4);
				break;
			case "업무현황":
				widgVO.setWidgX(6);
				widgVO.setWidgY(0);
				widgVO.setWidgW(4);
				widgVO.setWidgH(2);
				break;
			case "오늘의뉴스":
				widgVO.setWidgX(6);
				widgVO.setWidgY(2);
				widgVO.setWidgW(4);
				widgVO.setWidgH(2);
				break;
			case "메일":
				widgVO.setWidgX(6);
				widgVO.setWidgY(4);
				widgVO.setWidgW(4);
				widgVO.setWidgH(2);
				break;
			case "현재날씨":
				widgVO.setWidgX(10);
				widgVO.setWidgY(0);
				widgVO.setWidgW(2);
				widgVO.setWidgH(2);
				break;
			case "시설및비품예약":
				widgVO.setWidgX(10);
				widgVO.setWidgY(2);
				widgVO.setWidgW(2);
				widgVO.setWidgH(2);
				break;
			case "메모":
				widgVO.setWidgX(10);
				widgVO.setWidgY(4);
				widgVO.setWidgW(2);
				widgVO.setWidgH(2);
				break;
			default:
				break;
			}
			
			widgetList.add(widgVO);
		}
		
		return widgetList;
	}

	@Transactional(rollbackFor = SQLException.class)
	@Override
	public void saveWidgetLayout(ArrayList<WidgetVO> widgetList) {
		for (WidgetVO widgetVO : widgetList) {
			int result = widgetMapper.saveWidgetLayout(widgetVO);
			
			if(result <= 0) {
				throw new RuntimeException();
			}
		}
	}

	@Override
	public Result updateWidgetUseYn(WidgetVO widgetVO) {
		int result = widgetMapper.updateWidgetUseYn(widgetVO);
		if(result > 0 ) {
			return Result.OK;
		}
		return Result.FAILED;
	}
}
