package kr.or.ddit.groupware.service.rental;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.or.ddit.groupware.mapper.rental.IRentalMapper;
import kr.or.ddit.groupware.util.Result;
import kr.or.ddit.groupware.vo.PaginationInfoVO;
import kr.or.ddit.groupware.vo.RentalVO;
import kr.or.ddit.groupware.vo.StockVO;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
public class RentalServiceImpl implements IRentalService {

	@Autowired
	private IRentalMapper rentalMapper;
	@Override
	public Result RentVehicle(RentalVO rentalVO) {
		Result res = null;

		int cnt = rentalMapper.rentVehicle(rentalVO);

		if (cnt > 0) {
			res = Result.OK;
		}
		else {
			{
				res = Result.FAILED;
			}
		}
		return res;
	}

	@Override
	public Result RentSupplies(RentalVO rentalVO) {
		Result res = null;

		int cnt = rentalMapper.rentSupplies(rentalVO);

		if (cnt > 0) {
			res = Result.OK;
		}
		else {
			{
				res = Result.FAILED;
			}
		}
		return res;
	}

	@Override
	public List<RentalVO> getReservationsByResourceType(RentalVO rentalVO) {
		return rentalMapper.findRentalByResourceType(rentalVO);
	}

	@Override
	public boolean isRentalPossible(RentalVO rentalVO) {
		
		 List<RentalVO> conflicts = rentalMapper.findOverlappingRentals(
		            rentalVO.getEqpnmCd(),
		            rentalVO.getErntBeginDt(),
		            rentalVO.getErntEndDt()
		        );
		        return conflicts.size() == 0;
		    }

	@Override
	public boolean deleteRentalVehicle(RentalVO rentalVO) {
		return rentalMapper.cancleRentalVehicle(rentalVO);
	}

	@Override
	public boolean deleteRentalSupplies(RentalVO rentalVO) {
		return rentalMapper.cancleRentalSupplies(rentalVO);
		
	}
	
//	public boolean checkStockAvailability(String eqpnmCd, int erntQy) {
//		StockVO stock = rentalMapper.findByEqpnmCd(eqpnmCd);
//		if (stock != null && stock.getAvailableQy() < erntQy) {
//			throw new IllegalArgumentException("재고가 부족합니다.");
//		}
//		return stock != null && stock.getAvailableQy() >= erntQy;
//	}
//
//	public boolean updateStock(RentalVO rentalVO) {
//		StockVO stock = rentalMapper.findByEqpnmCd(rentalVO.getEqpnmCd());
//		if (stock != null && stock.getAvailableQy() >= rentalVO.getErntQy()) {
//			int newAvailableQy = stock.getAvailableQy() - rentalVO.getErntQy();
//			stock.setAvailableQy(newAvailableQy);
//			rentalMapper.updateStock(stock); // 가정: stockRepository에 적절한 update 메서드가 구현되어 있음
//			return true;
//		}
//		return false;
//	}

	@Override
	public int selectRentalCount(PaginationInfoVO<RentalVO> pagingVO) {
		return rentalMapper.selectRentalCount(pagingVO);
	}

	@Override
	public List<RentalVO> selectRentalList(PaginationInfoVO<RentalVO> pagingVO) {
		return rentalMapper.selectRentalList(pagingVO);
		}
}
