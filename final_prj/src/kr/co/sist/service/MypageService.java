package kr.co.sist.service;

import java.sql.SQLException;
import java.util.List;

import kr.co.sist.dao.MypageDAO;
import kr.co.sist.domain.CardDomain;
import kr.co.sist.domain.LemonDomain;
import kr.co.sist.domain.LemonHistDomain;
import kr.co.sist.domain.MemberUpdateDomain;
import kr.co.sist.domain.OrderHistoryDomain;
import kr.co.sist.vo.IndexListVO;
import kr.co.sist.vo.MemberUpdateVO;
import kr.co.sist.vo.MyCardVO;
import kr.co.sist.vo.OrderCntVO;

public class MypageService {
	
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
	
	
	
	public OrderCntVO orderCnt(String id) {
		OrderCntVO ocVO=null;
		MypageDAO mDAO=MypageDAO.getInstance();
		try {
			ocVO=mDAO.orderCnt(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
				
		return ocVO;
	}//orderCnt
	
	public List<OrderHistoryDomain> orderHistory(String id){
		MypageDAO mDAO=MypageDAO.getInstance();
		List<OrderHistoryDomain> list=null;
		list=mDAO.orderHistList(id);
		
		
		return list;
	}
	
	public LemonDomain countLemon(String id) {
		LemonDomain ld=new LemonDomain();
		MypageDAO mDAO=MypageDAO.getInstance();
		ld=mDAO.countLemon(id);
		
		return ld;
	}
	
	public List<LemonHistDomain> lemonList(String id){
		List<LemonHistDomain> list=null;
		MypageDAO mDAO=MypageDAO.getInstance();
		list=mDAO.lemonList(id);
		return list;
	}
	
	public MemberUpdateDomain selectMemberUpdate(String id) {
		MemberUpdateDomain mud=null;
		MypageDAO mDAO=MypageDAO.getInstance();
		mud=mDAO.selectMember(id);
		
		return mud;
		
	}
	
	public int updateMember(MemberUpdateVO muVO) {
		int flag=0;
		MypageDAO mDAO=MypageDAO.getInstance();
		flag=mDAO.updateMember(muVO);
		return flag;
	}
	
	public List<CardDomain> selectCard(String id){
		List<CardDomain> list=null;
		MypageDAO mDAO=MypageDAO.getInstance();
		list=mDAO.selectCard(id);
		return list;
	}
	
	public int deleteCard(String code) {
		int flag=0;
		MypageDAO mDAO=MypageDAO.getInstance();
		flag=mDAO.deleteCard(code);
		return flag;
	}
	
	public void insertCard(MyCardVO mcVO) {
		MypageDAO mDAO=MypageDAO.getInstance();
		mDAO.insertCard(mcVO);
	}
}
