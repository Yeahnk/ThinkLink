package kr.or.ddit.groupware.mapper.rental;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.or.ddit.groupware.vo.PaginationInfoVO;
import kr.or.ddit.groupware.vo.RentalVO;
import kr.or.ddit.groupware.vo.StockVO;
/**
 * 예약 및 대여 SQL Mapper
 * @author 민경선
 * @version 1.0
 * @see IRentalMapper
 */
public interface IRentalMapper {

	int rentVehicle(RentalVO rentalVO);

	int rentSupplies(RentalVO rentalVO);

	List<RentalVO> findRentalByResourceType(RentalVO rentalVO);

	List<RentalVO> findOverlappingRentals(
			@Param("eqpnmCd")
			String eqpnmCd,
			@Param("erntBeginDt")
			Date erntBeginDt, 
			@Param("erntEndDt")
			Date erntEndDt);

	boolean cancleRentalVehicle(RentalVO rentalVO);

	boolean cancleRentalSupplies(RentalVO rentalVO);

	StockVO findByEqpnmCd(String eqpnmCd);

	void updateStock(StockVO stock);

	int selectRentalCount(PaginationInfoVO<RentalVO> pagingVO);

	List<RentalVO> selectRentalList(PaginationInfoVO<RentalVO> pagingVO);


}
