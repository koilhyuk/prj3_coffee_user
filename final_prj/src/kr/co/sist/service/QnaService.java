package kr.co.sist.service;

import java.sql.SQLException;
import java.util.List;

import kr.co.sist.dao.MypageDAO;
import kr.co.sist.dao.QnaDAO;
import kr.co.sist.domain.QnaDetailDomain;
import kr.co.sist.domain.QnaListDomain;
import kr.co.sist.vo.IndexListVO;
import kr.co.sist.vo.QnaListVO;
import kr.co.sist.vo.QnaUpdateVO;
import kr.co.sist.vo.QnaVO;

public class QnaService {
	public int totalCount(String id) {
		int totalCnt=0;
		MypageDAO mDAO=MypageDAO.getInstance();
	
			totalCnt=mDAO.qnaCnt(id);
	

		return totalCnt;
	}//totalCount
	
	public int pageScale() {
		int pageScale=10;
		return pageScale;
	}//pageScale
	
	public int totalPage(int pageScale, int totalCount) {
		int totalPage=totalCount/pageScale;
		if(totalCount % pageScale !=0) {
			totalPage++;
		}//end if
		return totalPage;
	}//totalPage
	
	public int startNum(int pageScale,int currentPage) {
		int startNum=currentPage*pageScale-pageScale+1;
		
		return startNum;
	}//startNum
	
	public int endNum(int pageScale, int startNum) {
		int endNum=startNum+pageScale-1;
		
		return endNum;
	}//endNum
	
	public String indexList(IndexListVO ilVO) {
		int pagenumber; // 화면에 보여질 페이지 인덱스 수
		int startpage; // 화면에 보여질 시작페이지 번호
		int endpage; // 화면에 보여질 마지막페이지 번호
		int curpage; // 이동하고자 하는 페이지 번호

		String strList=""; // 리턴될 페이지 인덱스 리스트

		pagenumber = 10; // 한 화면의 페이지 인덱스 수 

		// 시작 페이지번호 구하기
		startpage = ((ilVO.getCurrentPage() - 1) / pagenumber) * pagenumber + 1;

		// 마지막 페이지번호 구하기
		endpage = (((startpage - 1) + pagenumber) / pagenumber) * pagenumber;

		// 총 페이지 수가 계산된 마지막페이지 번호보다 작을경우 

		// 총 페이지 수가 마지막페이지 번호가 됨


		if (ilVO.getTotalPage() <= endpage){
			endpage =ilVO.getTotalPage();
		}//end if

		// 첫번째 페이지 인덱스 화면이 아닌경우
		if ( ilVO.getCurrentPage() > pagenumber) {
			curpage = startpage - 1; // 시작페이지 번호보다 1 적은 페이지로 이동
			strList = strList + "<li class=\"page-item\"><<a class=\"page-link\" href="+ilVO.getUrl()+"?current_page="+curpage+" aria-label=\"Previous\">\r\n" + 
					"  		<span aria-hidden=\"true\">&laquo;</span></a></li>";
		}else{
			strList = strList + " <li class=\"page-item\">\r\n" + 
					"  	<a class=\"page-link\" href=\"#\" aria-label=\"Previous\">\r\n" + 
					"  		<span aria-hidden=\"true\">&laquo;</span>\r\n" + 
					"  	</a>\r\n" + 
					"  </li>";
		}

		//strList = strList + " ... ";

		// 시작페이지 번호부터 마지막페이지 번호까지 화면에 표시
		curpage = startpage;

		while (curpage <= endpage){
			if (curpage == ilVO.getCurrentPage()) {
				strList = strList + "<li class=\"page-item\"><a class='page-link'>"+ilVO.getCurrentPage()+"</a></li>";
			} else {
				strList = strList +"<li class=\"page-item\"><a class=\"page-link\" href="+ilVO.getUrl()+"?current_page="+curpage+">"+curpage+"</a></li>";
			}//end else

			curpage++;
		}//end while

		//strList = strList + " ... ";

		// 뒤에 페이지가 더 있는경우
		if ( ilVO.getTotalPage() > endpage) {
			curpage = endpage + 1; 
			strList = strList + "<a href="+ilVO.getUrl()+"?current_page="+curpage+" aria-label=\"Next\">\r\n" + 
					"  		<span aria-hidden=\"true\">&raquo;</span></a>";
		}else{
			strList = strList + "<li class=\"page-item\">\r\n" + 
					"  	<a class=\"page-link\" href=\"#\" aria-label=\"Next\">\r\n" + 
					"  		<span aria-hidden=\"true\">&raquo;</span>\r\n" + 
					"  	</a>\r\n" + 
					"  </li>";
		}//end else

		return strList;
		}//indexList
	
	public List<QnaListDomain> qnaList(QnaListVO qlVO){
		List<QnaListDomain> list=null;
		MypageDAO mDAO=MypageDAO.getInstance();
		list=mDAO.selectQnaList(qlVO);
		
		return list;
	}
	
	public QnaDetailDomain qnaDetail(String code) {
		MypageDAO mDAO=MypageDAO.getInstance();
		QnaDetailDomain qdd=null;
		qdd=mDAO.selectQnaDetail(code);
		return qdd;
	}
	
	public String qnaUpdate(QnaUpdateVO quVO) {
		String status="";
		MypageDAO mDAO=MypageDAO.getInstance();
		status=mDAO.updateQna(quVO);
		return status;
	}
	
	/**
	 * 1:1문의 사항 입력
	 * @param qVO
	 */
	public void addQna(QnaVO qVO) {
		QnaDAO qDAO=QnaDAO.getInstance();
		try {
			qDAO.insertQna(qVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
}
