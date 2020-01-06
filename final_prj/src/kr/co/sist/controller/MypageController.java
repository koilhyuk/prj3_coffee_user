package kr.co.sist.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.sist.domain.CardDomain;
import kr.co.sist.domain.LemonDomain;
import kr.co.sist.domain.LemonHistDomain;
import kr.co.sist.domain.MemberUpdateDomain;
import kr.co.sist.domain.OrderHistoryDomain;
import kr.co.sist.domain.QnaDetailDomain;
import kr.co.sist.domain.QnaListDomain;
import kr.co.sist.service.MemberService;
import kr.co.sist.service.MypageService;
import kr.co.sist.service.QnaService;
import kr.co.sist.util.cipher.DataEncrypt;
import kr.co.sist.vo.IndexListVO;
import kr.co.sist.vo.MemberUpdateVO;
import kr.co.sist.vo.MyCardVO;
import kr.co.sist.vo.OrderCntVO;
import kr.co.sist.vo.QnaListVO;
import kr.co.sist.vo.QnaUpdateVO;
import kr.co.sist.vo.SearchOrderVO;
@Controller
public class MypageController {
	
	@RequestMapping(value="mypage.do",method=GET)
	public String orderList(HttpSession session, SearchOrderVO soVO, @RequestParam(required=false, defaultValue="1")String current_page, Model model) {
		
		String id=session.getAttribute("id").toString();
		///////////////////////
		MypageService ms=new MypageService();
		List<OrderHistoryDomain> list=null;
		OrderCntVO ocVO=ms.orderCnt(id);
		list=ms.orderHistory(id);
		
		//indexList에서 제공하는 url인 current_page가 조회에 사용되는 sVO의 이름과 다르므로 current_page를 파라메터로 받고 sVO에 설정
			soVO.setCurrentPage(Integer.parseInt(current_page));
				int totalCount = ocVO.getTotalOrder();
				int pageScale=ms.pageScale();
				int totalPage=ms.totalPage(pageScale, totalCount);
				int startNum=ms.startNum(pageScale, soVO.getCurrentPage());
				int endNum=ms.endNum(pageScale, startNum);
				
				//계산된 값으로 조회에 사용될 수 있게 VO에 설정
				soVO.setStartNum(startNum);
				soVO.setEndNum(endNum);
				
				IndexListVO ilVO=new IndexListVO(soVO.getCurrentPage(), totalPage, "mypage.do");
				String indexList=ms.indexList(ilVO);
		///////////////////////
		model.addAttribute("orderCount",ocVO);
		model.addAttribute("orderList",list);
		model.addAttribute("indexList",indexList);
		return "mypage/mypage_order_list";
	}
	
	@RequestMapping(value="mypage_lemon.do", method= GET)
	public String myPageLemonList(HttpSession session , Model model) {
		String id=session.getAttribute("id").toString();
		MypageService ms=new MypageService();
		LemonDomain ld=ms.countLemon(id);
		List<LemonHistDomain> list=ms.lemonList(id);
		model.addAttribute("lemonCount",ld);
		model.addAttribute("lemonList",list);
		return "mypage/mypage_lemon_list";
	}
	
	@RequestMapping(value="mypage_qna.do", method= GET)
	public String myPageQnaList(HttpSession session,QnaListVO qlVO,@RequestParam(required=false, defaultValue="1")String current_page, Model model) {
		String id=session.getAttribute("id").toString();
		
		///////////////////////
		QnaService qs=new QnaService();
		List<QnaListDomain> list=null;
		
		//indexList에서 제공하는 url인 current_page가 조회에 사용되는 sVO의 이름과 다르므로 current_page를 파라메터로 받고 sVO에 설정
				qlVO.setCurrentPage(Integer.parseInt(current_page));
				qlVO.setId(id);
				int totalCount = qs.totalCount(id);
				int pageScale=qs.pageScale();
				int totalPage=qs.totalPage(pageScale, totalCount);
				int startNum=qs.startNum(pageScale, qlVO.getCurrentPage());
				int endNum=qs.endNum(pageScale, startNum);
				
				//계산된 값으로 조회에 사용될 수 있게 VO에 설정
				qlVO.setStartNum(startNum);
				qlVO.setEndNum(endNum);
				
				IndexListVO ilVO=new IndexListVO(qlVO.getCurrentPage(), totalPage, "mypage_qna.do");
				String indexList=qs.indexList(ilVO);
				
				list=qs.qnaList(qlVO);
				model.addAttribute("indexList", indexList);
				model.addAttribute("qnaList", list);
				
		return "mypage/mypage_qna";
	}
	
	@RequestMapping(value="qna_detail.do", method= GET)
	public String myPageQnaDetail(String code,Model model) {
		QnaService qs=new QnaService();
		QnaDetailDomain qdd=qs.qnaDetail(code);
		model.addAttribute("qnaDetail",qdd);
		model.addAttribute("qnaCode",code);
		return "mypage/mypage_qna_content";
	}
	
	@RequestMapping(value="qna_update.do",method = POST)
	public String myPageQnaUpdate(String content, String subject, String code, Model model) {
		model.addAttribute("content", content);
		model.addAttribute("subject", subject);
		model.addAttribute("code", code);
		return "mypage/mypage_qna_update";
	}
	
	@RequestMapping(value="qna_update_process.do",method = POST)
	public String myPageQnaUpdateProcess(String subject, String content, String code, Model model) {
		code=code.substring(0,code.length()-1);
		QnaService qs=new QnaService();
		String result="";
		QnaUpdateVO quVO=new QnaUpdateVO();
		quVO.setCode(code);
		quVO.setSubject(subject);
		quVO.setContent(content);
		result=qs.qnaUpdate(quVO);
		
		return "redirect:mypage_qna.do";
	}
	
	@RequestMapping(value="mypage_member_edit.do", method= GET)
	public String myPageMemberEdit(HttpSession session, Model model) {
		String id=session.getAttribute("id").toString();
		MypageService ms=new MypageService();
		MemberUpdateDomain mud=ms.selectMemberUpdate(id);
		String email=mud.getEmail();
		String emailId=email.substring(0,email.indexOf("@"));
		String emailDomain=email.substring(email.indexOf("@")+1,email.length());
		
		model.addAttribute("memberDomain",mud);
		model.addAttribute("emailId",emailId);
		model.addAttribute("emailDomain",emailDomain);
		return "mypage/mypage_member_edit";
	}
	
	@RequestMapping(value="member_edit_process.do", method=POST)
	public String MemberEditProcess(MemberUpdateVO muVO,HttpServletRequest request,Model model) {
		muVO.setM_recent_ip(request.getRemoteAddr());
		String temp=muVO.getM_pass();
		try {
			temp=DataEncrypt.messageDigest("SHA-512", temp);
			muVO.setM_pass(temp);
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		MypageService ms=new MypageService();
		int flag=ms.updateMember(muVO);
		if(flag==1) {
		}
		return "mainpage/main_page_login";
	}
	@RequestMapping(value="mypage_card_manage.do", method= GET)
	public String myPageCard(HttpSession session,Model model) {
		String id=session.getAttribute("id").toString();
		MypageService ms=new MypageService();
		MemberService mems=new MemberService();
		List<String> cardList=mems.selectAllCard();
		List<CardDomain> list=ms.selectCard(id);
		model.addAttribute("cardList",list);
		model.addAttribute("cardCom",cardList);
		return "mypage/card_manage";
	}
	
	@RequestMapping(value="card_delete.do", method=POST)
	public String DeleteCard(HttpSession session,String code, Model model) {
		MypageService ms=new MypageService();
		int flag=0;
		flag=ms.deleteCard(code);
		if(flag==1) {
		}
		return "redirect:mypage_card_manage.do";
	}
	
	@RequestMapping(value="card_insert.do", method = POST)
	public String insertCard(HttpSession session,MyCardVO mcVO ,Model model) {
		MypageService ms=new MypageService();
		String id=session.getAttribute("id").toString();
		mcVO.setM_id(id);
		ms.insertCard(mcVO);
		
		return "redirect:mypage_card_manage.do";
	}
	
}
