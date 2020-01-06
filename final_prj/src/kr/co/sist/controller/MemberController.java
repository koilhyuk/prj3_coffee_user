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
	 * ȸ������ ����
	 * @return
	 */
	@RequestMapping(value="member/agreement.do", method= GET)
	public String agreement() {
		
		return "member/agreement";
	}
	/**
	 * ȸ��������
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
	 * ȸ������ ���μ���
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
	 * �ߺ����̵� üũ
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
	 * ���̵� ��й�ȣ ã��  ��
	 * @param model
	 * @return
	 */
	@RequestMapping(value="member/find_id_pass_frm.do", method= GET)
	public String findIdPassForm(Model model) {
		
		
		return "member/find_id_pass";
	}
	
	/**
	 * ���̵� ã�� ���μ���
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
	 * ��й�ȣ ã�� ���μ���
	 * @param fpVO
	 * @param ipVO
	 * @return
	 */
	@RequestMapping(value = "member/find_pass.do", method = POST)
	@ResponseBody
	public String findPassProcess(FindPassVO fpVO,IdPassVO ipVO, HttpServletRequest request) {
		MemberService ms=new MemberService();
		JSONObject json=ms.searchPass(fpVO);
		//�̸��� ������
		String email= fpVO.getM_email();
		
		if((boolean)json.get("resultFlag")) {
		
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		String setfrom = "yulcoffee3@gmail.com";
		String tomail = email; // �޴� ��� �̸���
		String title = "ȸ������ Yul's Coffe �ӽ� ��й�ȣ �Դϴ�."; // ����
		String content = ms.modifyRandomPass(ipVO); // ����

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message,
					true, "UTF-8");

			messageHelper.setFrom(setfrom); // �����»�� �����ϸ� �����۵��� ����
			messageHelper.setTo(tomail); // �޴»�� �̸���
			messageHelper.setSubject(title); // ���������� ������ �����ϴ�
			messageHelper.setText(content); // ���� ����

			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}
		//�̸���
		
		}
		return json.toJSONString();
	}
		
	
}
