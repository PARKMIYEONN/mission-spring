package kr.co.mlec.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import kr.co.mlec.member.service.MemberService;
import kr.co.mlec.member.vo.MemberVO;

//이 이름을 가진 객체는 세션에 저장하라는 어노테이션
@SessionAttributes("userVO")
@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("/login")
	public String longinForm() {
		
		return "/login/login";
	}
	
	@PostMapping("/login")
	public String login(MemberVO member, Model model) {
		
		MemberVO userVO = memberService.login(member);
		if(userVO == null) {
			// 로그인 실패
			return "login/login";
		}
		// 로그인 성공
		model.addAttribute("userVO", userVO);
		
		return "redirect:/";
	}
	
	@GetMapping("/logout")
	public String logout(SessionStatus status) {
		
		//세션 다 사용했으니까 이제 지워줘 라는 메소드
		status.setComplete();
		
		return "redirect:/";
	}

}
