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
		int pagenumber; // ȭ�鿡 ������ ������ �ε��� ��
		int startpage; // ȭ�鿡 ������ ���������� ��ȣ
		int endpage; // ȭ�鿡 ������ ������������ ��ȣ
		int curpage; // �̵��ϰ��� �ϴ� ������ ��ȣ

		String strList = ""; // ���ϵ� ������ �ε��� ����Ʈ

		pagenumber = 10; // �� ȭ���� ������ �ε��� ��

		// ���� ��������ȣ ���ϱ�
		startpage = ((ilVO.getCurrentPage() - 1) / pagenumber) * pagenumber + 1;

		// ������ ��������ȣ ���ϱ�
		endpage = (((startpage - 1) + pagenumber) / pagenumber) * pagenumber;

		// �� ������ ���� ���� ������������ ��ȣ���� �������

		// �� ������ ���� ������������ ��ȣ�� ��

		if (ilVO.getTotalPage() <= endpage) {
			endpage = ilVO.getTotalPage();
		} // end if

		// ù��° ������ �ε��� ȭ���� �ƴѰ��
		if (ilVO.getCurrentPage() > pagenumber) {
			curpage = startpage - 1; // ���������� ��ȣ���� 1 ���� �������� �̵�
			strList = strList + "<li class=\"page-item\"><a class=\"page-link\" href=" + ilVO.getUrl()
					+ "?current_page=" + curpage + " aria-label=\"Previous\">\r\n"
					+ "  		<span aria-hidden=\"true\">&laquo;</span></a></li>";
		} else {
			strList = strList + " <li class=\"page-item\">\r\n"
					+ "  	<a class=\"page-link\" href=\"#\" aria-label=\"Previous\">\r\n"
					+ "  		<span aria-hidden=\"true\">&laquo;</span>\r\n" + "  	</a>\r\n" + "  </li>";
		}

		// strList = strList + " ... ";

		// ���������� ��ȣ���� ������������ ��ȣ���� ȭ�鿡 ǥ��
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

		// �ڿ� �������� �� �ִ°��
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
				if("Ŀ��".equals(tempData.getGcName())) {
					tempData.setGcName("coffee");
				}else if("����ġ��".equals(tempData.getGcName())) {
					tempData.setGcName("yuliccino");
				}else if("Ƽ".equals(tempData.getGcName())) {
					tempData.setGcName("tea");
				}else if("����Ʈ".equals(tempData.getGcName())) {
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
