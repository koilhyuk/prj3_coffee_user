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
		int pagenumber; // ȭ�鿡 ������ ������ �ε��� ��
		int startpage; // ȭ�鿡 ������ ���������� ��ȣ
		int endpage; // ȭ�鿡 ������ ������������ ��ȣ
		int curpage; // �̵��ϰ��� �ϴ� ������ ��ȣ

		String strList=""; // ���ϵ� ������ �ε��� ����Ʈ

		pagenumber = 10; // �� ȭ���� ������ �ε��� �� 

		// ���� ��������ȣ ���ϱ�
		startpage = ((ilVO.getCurrentPage() - 1) / pagenumber) * pagenumber + 1;

		// ������ ��������ȣ ���ϱ�
		endpage = (((startpage - 1) + pagenumber) / pagenumber) * pagenumber;

		// �� ������ ���� ���� ������������ ��ȣ���� ������� 

		// �� ������ ���� ������������ ��ȣ�� ��


		if (ilVO.getTotalPage() <= endpage){
			endpage =ilVO.getTotalPage();
		}//end if

		// ù��° ������ �ε��� ȭ���� �ƴѰ��
		if ( ilVO.getCurrentPage() > pagenumber) {
			curpage = startpage - 1; // ���������� ��ȣ���� 1 ���� �������� �̵�
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

		// ���������� ��ȣ���� ������������ ��ȣ���� ȭ�鿡 ǥ��
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

		// �ڿ� �������� �� �ִ°��
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
	 * 1:1���� ���� �Է�
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
