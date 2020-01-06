package kr.co.sist.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.util.List;

import javax.servlet.http.HttpSession;

import kr.co.sist.domain.NoticeBoardDomain;
import kr.co.sist.domain.NoticeDetailDomain;
import kr.co.sist.service.NoticeService;
import kr.co.sist.vo.IndexListVO;
import kr.co.sist.vo.SearchVO;

@Controller
public class NoticeController {
	
	@RequestMapping(value="notice.do", method=GET)
	public String searchList(SearchVO sVO, @RequestParam(required=false, defaultValue="1")String current_page,@RequestParam(required=false, defaultValue="")String keyword ,Model model) {
		
		NoticeService qs=new NoticeService();
		//indexList���� �����ϴ� url�� current_page�� ��ȸ�� ���Ǵ� sVO�� �̸��� �ٸ��Ƿ� current_page�� �Ķ���ͷ� �ް� sVO�� ����
		sVO.setCurrentPage(Integer.parseInt(current_page));
		int totalCount = qs.totalCount(sVO);
		int pageScale=qs.pageScale();
		int totalPage=qs.totalPage(pageScale, totalCount);
		int startNum=qs.startNum(pageScale, sVO.getCurrentPage());
		int endNum=qs.endNum(pageScale, startNum);
		
		//���� ������ ��ȸ�� ���� �� �ְ� VO�� ����
		sVO.setStartNum(startNum);
		sVO.setEndNum(endNum);
		
		IndexListVO ilVO=new IndexListVO(sVO.getCurrentPage(), totalPage, "notice.do");
		String indexList=qs.indexList(ilVO);
		List<NoticeBoardDomain> list=qs.searchList(sVO);
		model.addAttribute("boardList", list);
		model.addAttribute("indexList", indexList);
		return "notice/notice";
	}
	
	@RequestMapping(value="notice_content.do", method=GET)
	public String noticeDetail(String code, Model model) {
		NoticeService ns=new NoticeService();
		NoticeDetailDomain ndd=ns.selectNoticeDetail(code);
		model.addAttribute("noticeDetail",ndd);
		
		return "notice/notice_content";
	}
}
