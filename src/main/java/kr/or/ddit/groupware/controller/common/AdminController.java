package kr.or.ddit.groupware.controller.common;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@PreAuthorize("hasRole('ROLE_ADMIN')")
@Controller
@RequestMapping("/admin")
public class AdminController extends CommonAbstractImpl {
	
	/**
	 * @method : adminMain
	 * @auther : <strong>이명문</strong>
	 * @param  : model - 사원 정보
	 * @return : admin/main_admin
	 * @date : 2024. 4. 26
	 */
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/main")
	public String adminMain(Model model) {
		model.addAttribute("employeeVO", getEmployee());
		return "admin/common/main_admin";
	}
}
