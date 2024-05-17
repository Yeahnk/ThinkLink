package kr.or.ddit.groupware.controller.rental;


import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.groupware.service.rental.IRentalService;
import kr.or.ddit.groupware.util.Result;
import kr.or.ddit.groupware.vo.CustomUser;
import kr.or.ddit.groupware.vo.EmployeeVO;
import kr.or.ddit.groupware.vo.RentalVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin/rental")
public class RentalManageController {

	@Inject
	private IRentalService rentalService;
	
	@PreAuthorize("hasAnyRole('ROLE_ADMIN')")
	@GetMapping("/approval")
    public String rentApproval() {
		
		return "admin/rental/approval";
    }
	
	
	/**
	 * 차량대여하기
	 * 
	 * @method : rentVehicle
	 * @auther : <strong>민경선</strong>
	 * @param : rentalVO
	 * @return : response entity
	 */
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@PostMapping("/addVehicleReservation")
	public ResponseEntity<String> rentVehicle(@RequestBody RentalVO rentalVO) {
		CustomUser customUser = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		EmployeeVO employeeVO = customUser.getEmployeeVO();

		rentalVO.setEmplNo(employeeVO.getEmplNo());

		Result result = rentalService.RentVehicle(rentalVO);

		if (result.equals(Result.OK)) {
			return new ResponseEntity<String>("success", HttpStatus.OK);
		} else {
			return new ResponseEntity<String>("failed", HttpStatus.OK);
		}

	}
	
	/**
	 * 비품대여하기
	 * 
	 * @method : rentSupplies
	 * @auther : <strong>민경선</strong>
	 * @param : rentalVO
	 * @return : response entity
	 */
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@PostMapping("/addSuppliesReservation")
	public ResponseEntity<String> rentSupplies(@RequestBody RentalVO rentalVO) {
		CustomUser customUser = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		EmployeeVO employeeVO = customUser.getEmployeeVO();

		rentalVO.setEmplNo(employeeVO.getEmplNo());

//			if ( rentalService.updateStock(rentalVO)) {
//		        Result result = rentalService.RentSupplies(rentalVO);
//		        
//		        log.info("result", result);
//		        if (result.equals(Result.OK)) {
//		            return new ResponseEntity<String>("success", HttpStatus.OK);
//		        }
//		        return new ResponseEntity<String>("failed", HttpStatus.INTERNAL_SERVER_ERROR);
//		    } else {
//		        return new ResponseEntity<String>("Not enough stock available", HttpStatus.CONFLICT);
//		    }
//		}

		Result result = rentalService.RentSupplies(rentalVO);
		log.info("result", result);
		if (result.equals(Result.OK)) {
			return new ResponseEntity<String>("success", HttpStatus.OK);
		}
		return new ResponseEntity<String>("failed", HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
	
	@PreAuthorize("hasAnyRole('ROLE_ADMIN')")
	@GetMapping("/returnList")
    public String returnList() {
		
		
		
		return "admin/rental/returnList";
    }
	
	
	
	
}
