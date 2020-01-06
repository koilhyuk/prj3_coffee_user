package kr.co.sist.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.sist.domain.MainNoticeListDomain;
import kr.co.sist.service.MemberService;
import kr.co.sist.service.NoticeService;
import kr.co.sist.service.QnaService;
import kr.co.sist.vo.IdPassVO;
import kr.co.sist.vo.IpDateVO;
import kr.co.sist.vo.QnaVO;
@SessionAttributes("id")
@Controller
public class MainController {
	
	@RequestMapping(value="index.do", method= {GET,POST})
	public String mainPage(HttpSession session, Model model) {
		String url="mainpage/main_page";
		if(session.getAttribute("id")!=null) {
			url="mainpage/main_page_login";
		}
		List<MainNoticeListDomain> list=null;
		NoticeService ns=new NoticeService();
		list=ns.mainNotice();
		
		model.addAttribute("comGoodsList",ns.mainComGoodsSearch());
		model.addAttribute("noticeList",list);
		
		return url;
	}//mainPage
	
	
	@RequestMapping(value="member/login.do", method= GET)
	public String loginPage() {
		return "member/login";
	}//loginPage
	
	

	/**
	 * 로그인 체크 에이작스
	 * @param ipVO
	 * @param idVO
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "member/loginChk.do",method = POST )
	@ResponseBody
	public String loginProcess(IdPassVO ipVO,IpDateVO idVO ,HttpServletRequest request) {

		MemberService ms=new MemberService();
		JSONObject json=ms.loginOk(ipVO);
		HttpSession session= request.getSession();
		session.setAttribute("id", ipVO.getM_id());
		idVO.setM_recent_ip(request.getRemoteAddr());
		if(json!=null) {
			ms.modifyIpDate(idVO);
		}
		return json.toJSONString();
	}//loginProcess
	
	/**
	 * 로그인 완료
	 * @param ipVO
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "member/loginOk.do",method = POST )
	public String loginProcess() {
			
		return "redirect:/mainpage.html";
	}//loginProcess
	
	/**
	 * 로그아웃
	 * @param ss
	 * @param request
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value="member/logout.do")
	public String logOutProcess( SessionStatus ss, HttpServletRequest request, RedirectAttributes redirectAttributes) {
		request.getSession().removeAttribute("id");
		ss.setComplete();
		redirectAttributes.addFlashAttribute("id");
		return "redirect:/index.do";
	}//logOutProcess
	
	/**
	 * 위치 소개
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "info/location.do", method = GET)
	public String location(HttpServletRequest request) {
		HttpSession session=request.getSession();
		String temps=(String)session.getAttribute("id");
		
		return "info/location";
	}//location
	
	
	///////////////현아's///////////////

	/**
	 * 1:1문의 고객센터 폼
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value="qna/qnA.do", method= GET)
	public String qnA(Model model,HttpServletRequest request) {
		HttpSession session=request.getSession();
		String temps=(String)session.getAttribute("id");
		String url="";
		if(temps==null) {
			model.addAttribute("msg", "1:1문의는 로그인 후 이용하실 수 있습니다."); 
			model.addAttribute("url", "/final_prj/member/login.do"); 
			url="query/query_n";
		}else {
			url="query/query";
		}
		
		return url;
	}//qnA
	
	
	/**
	 * QnA 프로세스
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "qna/qnA_process.do", method = POST)
	public String memberProcess(QnaVO qVO,HttpServletRequest request, Model model) {
		HttpSession session=request.getSession();
		String temps=(String)session.getAttribute("id");
		String url="";
		String id="";
		QnaService is= new QnaService();
		/* model.addAttribute("id", id); */
		qVO.setM_id(temps);
		is.addQna(qVO);
		return "redirect:/mypage_qna.do";//완료후 마이페이지의 문의 리스트 보기
		
	}//memberProcess
	

	
	
	
		
}// class
