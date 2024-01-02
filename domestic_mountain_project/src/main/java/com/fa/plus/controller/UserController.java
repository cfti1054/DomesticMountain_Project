package com.fa.plus.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fa.plus.domain.SessionInfo;
import com.fa.plus.domain.User;
import com.fa.plus.service.UserService;

@Controller
@RequestMapping(value = "/user/*")
public class UserController {
	
	@Autowired
	private UserService service;
	
	@RequestMapping("login")
	public String loginForm() {
		return ".user.login";
	}
	// 회원가입 폼
	@GetMapping("user")
	public String userForm(Model model) {
		model.addAttribute("mode", "user");
		return ".user.user"; 
	}
	
	@PostMapping("login")
	public String loginSubmit(
			@RequestParam String user_id,
			@RequestParam String user_pwd,
			HttpSession session,
			Model model
			) {
		
			
		User dto = service.loginUser(user_id);
		if (dto == null || !user_pwd.equals(dto.getUser_pwd())) {
			model.addAttribute("message", "아이디 또는 패스워드가 일치하지 않습니다.");
			return ".user.login"; 
		}

		// 세션에 로그인 정보 저장
		SessionInfo info = new SessionInfo();
		info.setUseridx(dto.getUseridx());
		info.setUserid(dto.getUser_id());
		info.setUsername(dto.getUser_name());
		info.setUsership(dto.getUsership());

		session.setMaxInactiveInterval(30 * 60); // 세션유지시간 30분, 기본:30분

		session.setAttribute("loginUser", info);

		// 로그인 이전 URI로 이동
		String uri = (String) session.getAttribute("preLoginURI");
		if (uri == null) {
			uri = "redirect:/";
		} else {
			uri = "redirect:" + uri;
		}
		return uri;
	}
	
	@GetMapping(value = "logout")
	public String logout(HttpSession session) {
		// 세션에 저장된 정보 지우기
		session.removeAttribute("loginUser");

		// 세션에 저장된 모든 정보 지우고, 세션초기화
		session.invalidate();

		return "redirect:/";
	}
	
	@GetMapping("noAuthorized")
	public String noAuthorized() {
		// 권한이 없는 유저가 접근 한 경우
		return ".user.noAuthorized";
	}
	
	// 회원가입 폼
//		@GetMapping("user")
//		public String userForm(Model model) {
//			model.addAttribute("mode", "user");
//			return ".user.user";
//		}
		
	// 회원 가입 완료 
	@PostMapping("user")
	public String userSubmit(User dto,
			final RedirectAttributes rAttr,
			Model model) {
		try {
			service.insertUser(dto);
		} catch (DuplicateKeyException e) {
			model.addAttribute("mode", "user");
			model.addAttribute("message", "등록된 아이디 입니다.");
			return ".user.user";
		} catch (DataIntegrityViolationException e) {
			model.addAttribute("mode", "member");
			model.addAttribute("message", "제약조건 위반 입니다.");
			return ".user.user";
		} catch (Exception e) {
			model.addAttribute("mode", "member");
			model.addAttribute("message", "회원 가입이 실패 했습다.");
			return ".user.user";
		}
		
		StringBuilder sb = new StringBuilder();
		sb.append(dto.getUser_name() + "님의 회원가입이 정상적으로 처리 되었습니다.<br>");
		sb.append("메인화면으로 이동하여 로그인하시기 바랍니다.<br>");
		
		rAttr.addFlashAttribute("message", sb.toString());
		rAttr.addFlashAttribute("title", "회원 가입");
		
		return "redirect:/user/complete";
	}
	
// 회원 가입 완료후 메시지 출력
	@GetMapping("complete")
    public String complete(@ModelAttribute("message") String message) throws Exception {

        // 컴플릿 페이지(complete.jsp)의 출력되는 message와 title는 RedirectAttributes 값이다.
        // F5를 눌러 새로 고침을 하면 null이 된다.

        if (message == null || message.length() == 0) // F5를 누른 경우
            return "redirect:/";

        return ".user.complete";
    }
	
	// ID 중복 검사
	@PostMapping("user_idCheck")
	@ResponseBody
	public Map<String, Object> idCheck(@RequestParam String user_id) {
	
		String p = "true";
		User dto = service.findById(user_id);
	
		if (dto != null) {
			p = "false";
		}
		Map<String, Object> model = new HashMap<>();
		model.put("passed", p);
		
		return model;
	}
	
	@GetMapping("pwd")
	public String pwdForm(String dropout, Model model) {
		
		if(dropout == null) {
			model.addAttribute("mode", "update");
		} else {
			model.addAttribute("mode", "droupout");
		}
		
		return ".user.pwd";
	}
	@PostMapping("pwd")
	public String pwdSubmit(@RequestParam String user_pwd,
			@RequestParam String mode,
			final RedirectAttributes rAttr,
			HttpSession session,
			Model model) {
		
		SessionInfo info = (SessionInfo)session.getAttribute("user");
		User dto = service.findById(info.getUserid());
		
		if(dto == null) {
			session.invalidate();
			return "redirect:/";
		}
		
		if(! dto.getUser_pwd().equals(user_pwd)) {
			model.addAttribute("mode", mode);
			model.addAttribute("message", "패스워드가 일치하지 않습니다.");
			
			return ".user.pwd";
		}
		
		if(mode.equals("dropout")) {
			// 회원 탈퇴
			// 게시판 테이블등 데이터 삭제
			
			session.removeAttribute("loginUser");
			session.invalidate();
		
			StringBuilder sb = new StringBuilder();
			sb.append(dto.getUser_name() + "님의 회원 탈퇴 처리가 정상적으로 처리되었습니다.<br>");
			sb.append("메인화면으로 이동 하시기 바랍니다.<br>");

			rAttr.addFlashAttribute("title", "회원 탈퇴");
			rAttr.addFlashAttribute("message", sb.toString());
			
		return "redirect:/";
		}
		// 회원 수정 폼
		model.addAttribute("dto", dto);
		model.addAttribute("mode", "update");
		
		return ".user.user";
		
	}
	
	@PostMapping()
	public String updateSubmit(User dto,
			final RedirectAttributes reAttr,
			Model model) {
		
		try {
			service.updateUser(dto);
		} catch (Exception e) {
			
		}

		StringBuilder sb = new StringBuilder();
		sb.append(dto.getUser_name() + "님의 회원정보가 정상적으로 변경되었습니다.<br>");
		sb.append("메인화면으로 이동 하시기 바랍니다.<br>");

		reAttr.addFlashAttribute("title", "회원 정보 수정");
		reAttr.addFlashAttribute("message", sb.toString());

		return "redirect:/user/complete";
	}
	
	// 패스워드 찾기 
	@GetMapping("pwdFind")
	public String pwdFindForm(HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("loginUser");
		
		if(info != null) {
			return "redirect:/";
		}
		return ".user.pwdFind";
	}
	
	@PostMapping("pwdFind")
	public String pwdFindSubmit(@RequestParam String user_id,
			RedirectAttributes rAttr,
			Model model) throws Exception {
		
		User dto = service.findById(user_id);
		
		if(dto == null || dto.getEmail() == null || dto.getEnabled() == 0) {
			model.addAttribute("message", "등록된 아이디가 아닙니다.");
			return ".user.pwdFind";
		}
		try {
			service.generatePwd(dto);
		} catch (Exception e) {
			model.addAttribute("message", "이메일 전송이 실패했습니다.");
			return ".user.pwdFind";
		}
		StringBuilder sb = new StringBuilder();
		sb.append("회원님의 이메일로 임시패스워드를 전송했습니다.<br>");
		sb.append("로그인 후 패스워드를 변경하시기 바랍니다.<br>");
		
		rAttr.addFlashAttribute("title", "패스워드 찾기");
		rAttr.addFlashAttribute("message", sb.toString());
		
		return "redirect:/user/complete";
	}
	
	@GetMapping("idFind")
	public String idFindForm() throws Exception {
		
		return ".user.idFind";
	}
	
	@PostMapping("idFind")
	public String idFindSubmit(@RequestParam String email,
			RedirectAttributes rAttr,
			Model model) throws Exception {
		
		boolean b = service.findByEmailId(email);
		
		if( ! b ) {
			model.addAttribute("message", "등록된 이메일이 아닙니다.");
			return ".user.idFind";
		}
		
		StringBuilder sb = new StringBuilder();
		sb.append("회원님의 이메일로 아이디로 이메일을 전송했습니다 .<br>");
		
		rAttr.addFlashAttribute("title", "아이디 찾기");
		rAttr.addFlashAttribute("message", sb.toString());
		
		return "redirect:/user/complete";
	}
}