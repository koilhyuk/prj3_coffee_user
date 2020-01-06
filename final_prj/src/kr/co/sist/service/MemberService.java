package kr.co.sist.service;

import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.List;
import java.util.UUID;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;

import kr.co.sist.dao.MemberDAO;
import kr.co.sist.util.cipher.DataEncrypt;
import kr.co.sist.vo.CardVO;
import kr.co.sist.vo.FindIdVO;
import kr.co.sist.vo.FindPassVO;
import kr.co.sist.vo.IdPassVO;
import kr.co.sist.vo.IpDateVO;
import kr.co.sist.vo.MemberJoinVO;

public class MemberService {
	@Autowired
	private JavaMailSender mailSender;

	/**
	 * ȸ������ ī�帮��Ʈ
	 * 
	 * @return
	 */
	public List<String> selectAllCard() {
		List<String> list = null;
		MemberDAO mDao = MemberDAO.getInstance();
		list = mDao.selectAllCard();

		return list;
	}// selectAllCard

	/**
	 * �α��� �Ϸ� �����۽�
	 * 
	 * @param ipVO
	 * @return
	 */
	public JSONObject loginOk(IdPassVO ipVO) {
		JSONObject jo = new JSONObject();
		MemberDAO mDao = MemberDAO.getInstance();
		boolean login_flag = false;
		String mPass = ipVO.getM_pass();
		String shaPass = "";

		try {
			shaPass = DataEncrypt.messageDigest("SHA-512", mPass);
			ipVO.setM_pass(shaPass);
		} catch (NoSuchAlgorithmException e1) {
			e1.printStackTrace();
		}

		try {
			login_flag = mDao.selectLogin(ipVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		jo.put("login_flag", login_flag);
		return jo;
	}

	/**
	 * �α��� �� ip,�������� ������Ʈ
	 * 
	 * @param idVO
	 * @return
	 */
	public boolean modifyIpDate(IpDateVO idVO) {
		boolean ip_flag = false;

		MemberDAO mDao = MemberDAO.getInstance();
		try {
			ip_flag = mDao.updateIpDate(idVO) == 1;
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return ip_flag;
	}

	/**
	 * ȸ������ ���̵� �ߺ�Ȯ��
	 * 
	 * @param id
	 * @return
	 */
	public JSONObject selectId(String id) {
		JSONObject jo = new JSONObject();
		MemberDAO mDao = MemberDAO.getInstance();
		boolean idChk_flag = false;

		try {
			idChk_flag = mDao.selectId(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		jo.put("idChk_flag", idChk_flag);

		return jo;

	}

	/**
	 * ȸ������ ��� �߰�
	 * 
	 * @param mjVO
	 * @param cVO
	 */
	public boolean addMember(MemberJoinVO mjVO) {
		MemberDAO mDAO = MemberDAO.getInstance();
		boolean insert_MFlag = false;
		String mPass = mjVO.getM_pass();
		String shaPass = "";

		try {
			shaPass = DataEncrypt.messageDigest("SHA-512", mPass);
			mjVO.setM_pass(shaPass);
		} catch (NoSuchAlgorithmException e1) {
			e1.printStackTrace();
		}

		try {
			insert_MFlag = mDAO.insertMember(mjVO);

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return insert_MFlag;
	}

	/**
	 * ī�� ���� �Է�
	 * 
	 * @param cVO
	 */
	public void addCard(CardVO cVO) {
		MemberDAO mDao = MemberDAO.getInstance();

		try {
			mDao.insertMemberCard(cVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * ���̵� ã��
	 * 
	 * @param fVO
	 * @return
	 */
	public JSONObject searchId(FindIdVO fVO) {
		String id = null;
		boolean resultFlag = false;
		MemberDAO mDao = MemberDAO.getInstance();
		JSONObject jo = new JSONObject();
		try {
			id = mDao.selectLostId(fVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (id != null) {
			resultFlag = true;
		}
		jo.put("resultFlag", resultFlag);
		jo.put("data", id);

		return jo;
	}

	/**
	 * ��й�ȣ ã��
	 * 
	 * @param fVO
	 * @return
	 */
	public JSONObject searchPass(FindPassVO fpVO) {
		String passFindInfo = null;
		boolean result_PFlag = false;
		MemberDAO mDao = MemberDAO.getInstance();
		JSONObject jo = new JSONObject();
		try {
			passFindInfo = mDao.selectLostPass(fpVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (passFindInfo != null) {
			result_PFlag = true;
		}
		jo.put("resultFlag", result_PFlag);
		jo.put("data", passFindInfo);

		return jo;
	}

	/**
	 * �������� ��й�ȣ�� ������ ��й�ȣ ������Ʈ
	 * 
	 * @param ipVO
	 * @return
	 */
	public String modifyRandomPass(IdPassVO ipVO) {

		MemberDAO mDao = MemberDAO.getInstance();

		String uuid = UUID.randomUUID().toString().replaceAll("-", ""); // -�� ������ �־���.
		String mPass = uuid.substring(0, 12); // uuid�� �տ������� 10�ڸ� �߶���.
		String shaPass = "";

		try {
			shaPass = DataEncrypt.messageDigest("SHA-512", mPass);
		} catch (NoSuchAlgorithmException e1) {
			e1.printStackTrace();
		}

		ipVO.setM_pass(shaPass);

		try {

			mDao.updatePass(ipVO);

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return mPass;
	}

}
