package kr.co.sist.service;

import java.sql.SQLException;
import java.util.List;

import kr.co.sist.dao.NoticeDAO;
import kr.co.sist.domain.MainComGoodsDomain;
import kr.co.sist.domain.MainNoticeListDomain;
import kr.co.sist.domain.NoticeBoardDomain;
import kr.co.sist.domain.NoticeDetailDomain;
import kr.co.sist.vo.IndexListVO;
import kr.co.sist.vo.SearchVO;

public class NoticeService {

	public int totalCount(SearchVO sv) {
		int totalCnt = 0;
		NoticeDAO qDao = NoticeDAO.getInstance();
		try {
			totalCnt = qDao.selectTotalCount(sv);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return totalCnt;
	}// totalCount

	public int pageScale() {
		int pageScale = 10;
		return pageScale;
	}// pageScale

	public int totalPage(int pageScale, int totalCount) {
		int totalPage = totalCount / pageScale;
		if (totalCount % pageScale != 0) {
			totalPage++;
		} // end if
		return totalPage;
	}// totalPage

	public int startNum(int pageScale, int currentPage) {
		int startNum = currentPage * pageScale - pageScale + 1;

		return startNum;
	}// startNum

	public int endNum(int pageScale, int startNum) {
		int endNum = startNum + pageScale - 1;

		return endNum;
	}// endNum

	public String indexList(IndexListVO ilVO) {
		int pagenumber; // 화면에 보여질 페이지 인덱스 수
		int startpage; // 화면에 보여질 시작페이지 번호
		int endpage; // 화면에 보여질 마지막페이지 번호
		int curpage; // 이동하고자 하는 페이지 번호

		String strList = ""; // 리턴될 페이지 인덱스 리스트

		pagenumber = 10; // 한 화면의 페이지 인덱스 수

		// 시작 페이지번호 구하기
		startpage = ((ilVO.getCurrentPage() - 1) / pagenumber) * pagenumber + 1;

		// 마지막 페이지번호 구하기
		endpage = (((startpage - 1) + pagenumber) / pagenumber) * pagenumber;

		// 총 페이지 수가 계산된 마지막페이지 번호보다 작을경우

		// 총 페이지 수가 마지막페이지 번호가 됨

		if (ilVO.getTotalPage() <= endpage) {
			endpage = ilVO.getTotalPage();
		} // end if

		// 첫번째 페이지 인덱스 화면이 아닌경우
		if (ilVO.getCurrentPage() > pagenumber) {
			curpage = startpage - 1; // 시작페이지 번호보다 1 적은 페이지로 이동
			strList = strList + "<li class=\"page-item\"><a class=\"page-link\" href=" + ilVO.getUrl()
					+ "?current_page=" + curpage + " aria-label=\"Previous\">\r\n"
					+ "  		<span aria-hidden=\"true\">&laquo;</span></a></li>";
		} else {
			strList = strList + " <li class=\"page-item\">\r\n"
					+ "  	<a class=\"page-link\" href=\"#\" aria-label=\"Previous\">\r\n"
					+ "  		<span aria-hidden=\"true\">&laquo;</span>\r\n" + "  	</a>\r\n" + "  </li>";
		}

		// strList = strList + " ... ";

		// 시작페이지 번호부터 마지막페이지 번호까지 화면에 표시
		curpage = startpage;

		while (curpage <= endpage) {
			if (curpage == ilVO.getCurrentPage()) {
				strList = strList + "<li class=\"page-item\"><a class='page-link'>" + ilVO.getCurrentPage()
						+ "</a></li>";
			} else {
				strList = strList + "<li class=\"page-item\"><a class=\"page-link\" href=" + ilVO.getUrl()
						+ "?current_page=" + curpage + ">" + curpage + "</a></li>";
			} // end else

			curpage++;
		} // end while

		// strList = strList + " ... ";

		// 뒤에 페이지가 더 있는경우
		if (ilVO.getTotalPage() > endpage) {
			curpage = endpage + 1;
			strList = strList + "<li class=\"page-item\"> <a href=" + ilVO.getUrl() + "?current_page=" + curpage
					+ " aria-label=\"Next\">\r\n" + "  		<span aria-hidden=\"true\">&raquo;</span>\r\n" + "</a>\r\n"
					+ "</li>";
		} else {
			strList = strList + "<li class=\"page-item\">\r\n"
					+ "  	<a class=\"page-link\" href=\"#\" aria-label=\"Next\">\r\n"
					+ "  		<span aria-hidden=\"true\">&raquo;</span>\r\n" + "  	</a>\r\n" + "  </li>";
		} // end else

		return strList;
	}// indexList

	public List<NoticeBoardDomain> searchList(SearchVO sVO) {
		List<NoticeBoardDomain> list = null;

		NoticeDAO qDAO = NoticeDAO.getInstance();
		try {
			list = qDAO.selectBoardList(sVO);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} // end catch

		return list;
	}// searchList

	public List<MainNoticeListDomain> mainNotice() {
		List<MainNoticeListDomain> list = null;
		NoticeDAO nDAO = NoticeDAO.getInstance();
		try {
			list = nDAO.selectMNoticeList();
		} catch (SQLException e) {
			e.printStackTrace();
		} // end catch
		return list;
	}// searchList

	public List<MainComGoodsDomain> mainComGoodsSearch() {
		List<MainComGoodsDomain> comGoods = null;
		NoticeDAO nDAO = NoticeDAO.getInstance();

		try {
			MainComGoodsDomain tempData = null;
			comGoods = nDAO.mainComGoodsSelect();
			for (int i = 0; i < comGoods.size(); i++) {
				tempData= comGoods.get(i);
				if("커피".equals(tempData.getGcName())) {
					tempData.setGcName("coffee");
				}else if("율리치노".equals(tempData.getGcName())) {
					tempData.setGcName("yuliccino");
				}else if("티".equals(tempData.getGcName())) {
					tempData.setGcName("tea");
				}else if("디저트".equals(tempData.getGcName())) {
					tempData.setGcName("dessert");
				}// end else if
					
			}// end for

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return comGoods;
	}// mainComGoodsSearch

	public NoticeDetailDomain selectNoticeDetail(String code) {
		NoticeDetailDomain ndd = null;
		NoticeDAO nDAO = NoticeDAO.getInstance();
		ndd = nDAO.selectNoticeDetail(code);

		return ndd;
	}

}
