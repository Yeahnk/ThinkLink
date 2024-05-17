package kr.or.ddit.groupware.service.rental;

import java.util.List;

import kr.or.ddit.groupware.util.Result;
import kr.or.ddit.groupware.vo.PaginationInfoVO;
import kr.or.ddit.groupware.vo.RentalVO;

/**
 * 예약 및 대여 서비스 인터페이스
 * @author <strong>민경선</strong>
 * @version 1.0
 * @see IRentalService
 *
 */

public interface IRentalService {

	Result RentVehicle(RentalVO rentalVO);

	Result RentSupplies(RentalVO rentalVO);

	List<RentalVO> getReservationsByResourceType(RentalVO rentalVO);

	boolean isRentalPossible(RentalVO rentalVO);

	boolean deleteRentalVehicle(RentalVO rentalVO);

	boolean deleteRentalSupplies(RentalVO rentalVO);

////////////////////재고체크, 업데이트/////////////////
//	boolean checkStockAvailability(String eqpnmCd, int erntQy);
//
//	boolean updateStock(RentalVO rentalVO);
/////////////////////////대여신청목록 조회///////////////////////////////
	int selectRentalCount(PaginationInfoVO<RentalVO> pagingVO);

	List<RentalVO> selectRentalList(PaginationInfoVO<RentalVO> pagingVO);


}
