package com.marondal.choongmotour.admin;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.marondal.choongmotour.admin.bo.AdminBO;
import com.marondal.choongmotour.admin.model.Admin;
import com.marondal.choongmotour.admin.model.CertificationNumber;

@Controller
@RequestMapping("/admin")
public class AdminRestController {

	
	@Autowired AdminBO adminBO;
	
	
	//관리자 회원가입 api
	@PostMapping("/signup")
	public Map<String, String> signup(
			@RequestParam String loginId
			,@RequestParam String password
			,@RequestParam String name
			,@RequestParam String email
			,@RequestParam String nickname
			, @RequestParam String certificationNumber
			){
		
		Map<String, String> resultMap = new HashMap<>();
		
		int count = adminBO.addAdmin(loginId, password, name, email, nickname, certificationNumber);
		
		
		//관리자 인증번호 확인 api
		//인증번호 일치 여부 새로운 api를 만들필요없다고 함 기존의 api에서 애초에 인증번호를 전달받아서 그것이 일치 하는 여부를 따지고 그담에
		//일치하면 리턴진행하고 이런식으로 할것.
				
		//인증번호 일치 여부

		
		if(count == 1) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		
		
		
		return resultMap;
	
	}
	// 관리자 아이디 중복확인
	@GetMapping("/duplicate_id")
	@ResponseBody
	public Map<String, Boolean> duplicateCheck(@RequestParam String loginId){
		
		Map<String, Boolean> resultMap = new HashMap<>();
		
		boolean is_duplicate = adminBO.isDuplicate(loginId);
		
		if(is_duplicate) {
			resultMap.put("is_duplicate", true);
		} else {
			resultMap.put("is_duplicate", false);
		}
		
		
		return resultMap;
		
	}
	
	
	//관리자 로그인 api
	@PostMapping("/signin")
	public Map<String, String> signin(
			@RequestParam("loginId") String loginId
			, @RequestParam("password") String password
			, HttpSession session
			){
		
		Map<String, String> resultMap = new HashMap<>();
		
			Admin admin = adminBO.getAdmin(loginId, password);
		
			if(admin != null) {
				resultMap.put("result", "success");
				
				session.setAttribute("adminId", admin.getId());
				session.setAttribute("passowrd", admin.getPassword());
				session.setAttribute("adminName", admin.getName());
				session.setAttribute("adminNickname", admin.getNickname());
				session.setAttribute("adminImagePath", admin.getImagePath());		
			} else {
				resultMap.put("result", "fail");
			}
			
			return resultMap;
		
	}
	
	
	
}
