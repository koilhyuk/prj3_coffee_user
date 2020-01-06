package kr.co.sist.controller;

import java.io.UnsupportedEncodingException;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import kr.co.sist.service.MemberService;
import kr.co.sist.vo.CardVO;
import kr.co.sist.vo.FindIdVO;
import kr.co.sist.vo.FindPassVO;
import kr.co.sist.vo.IdPassVO;
import kr.co.sist.vo.MemberJoinVO;

@Controller
public class MemberController {
	@Autowired
	private JavaMailSender mailSender;
	/**
	 * 회원가입 동의
	 * @return
	 */
	@RequestMapping(value="member/agreement.do", method= GET)
	public String agreement() {
		
		return "member/agreement";
	}
	/**
	 * 회원가입폼
	 * @param model
	 * @return
	 */
	@RequestMapping(value="member/sign_up_frm.do", method= GET)
	public String memberForm(Model model) {
		MemberService ms=new MemberService();
		model.addAttribute("cardData",ms.selectAllCard());
		return "member/signup";
	}
	/**
	 * 회원가입 프로세스
	 * @param mjVO
	 * @param cVO
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "member/signup_process.do", method = POST)
	public String memberProcess(MemberJoinVO mjVO, CardVO cVO,HttpServletRequest request) {
		MemberService ms= new MemberService();
		 mjVO.setM_recent_ip(request.getRemoteAddr());

		if (ms.addMember(mjVO)) {
			ms.addCard(cVO);
		}
		return "redirect:/member/login.do";
	}
	/**
	 * 중복아이디 체크
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "member/idChk.do", method = GET)
	@ResponseBody
	public String idChkProcess(String id) {
		MemberService ms=new MemberService();
		JSONObject json=ms.selectId(id);
		return json.toJSONString();
	}
	
	
	
	/**
	 * 아이디 비밀번호 찾기  폼
	 * @param model
	 * @return
	 */
	@RequestMapping(value="member/find_id_pass_frm.do", method= GET)
	public String findIdPassForm(Model model) {
		
		
		return "member/find_id_pass";
	}
	
	/**
	 * 아이디 찾기 프로세스
	 * @param fVO
	 * @return
	 */
	@RequestMapping(value = "member/find_id.do", method = POST)
	@ResponseBody
	public String findIdProcess(FindIdVO fVO) {
		MemberService ms=new MemberService();
		JSONObject json=ms.searchId(fVO);
		
		return json.toJSONString();
	}
	/**
	 * 비밀번호 찾기 프로세스
	 * @param fpVO
	 * @param ipVO
	 * @return
	 */
	@RequestMapping(value = "member/find_pass.do", method = POST)
	@ResponseBody
	public String findPassProcess(FindPassVO fpVO,IdPassVO ipVO, HttpServletRequest request) {
		MemberService ms=new MemberService();
		JSONObject json=ms.searchPass(fpVO);
		//이메일 보내기
		String email= fpVO.getM_email();
		
		if((boolean)json.get("resultFlag")) {
		
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		String setfrom = "yulcoffee3@gmail.com";
		String tomail = email; // 받는 사람 이메일
		String title = "회원님의 Yul's Coffe 임시 비밀번호 입니다."; // 제목
		String content = ms.modifyRandomPass(ipVO); // 내용

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message,
					true, "UTF-8");

			messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content); // 메일 내용

			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}
		//이메일
		
		}
		return json.toJSONString();
	}
		
	
}
