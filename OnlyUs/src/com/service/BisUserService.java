package com.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dto.BisUserDTO;
import com.exception.CommonException;

public class BisUserService {
	public void addBisUser(BisUserDTO dto) throws CommonException {
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			int n = session.insert("addBisUser", dto);
			session.commit();

		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("회원가입 실패.");
		} finally {
			session.close();
		}

	}// end addMember

	public BisUserDTO bislogin(HashMap<String, String> map) throws CommonException {
		BisUserDTO dto = null;
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			dto = session.selectOne("bislogin", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("로그인실패.");
		} finally {
			session.close();
		}
		return dto;
	}

	public List<BisUserDTO> bisjoinList() throws CommonException {
		List<BisUserDTO> list = null;
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			list = session.selectList("bisjoinList");
		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("가입신청목록 가져오기 실패.");
		} finally {
			session.close();
		}
		return list;
	}
	public List<BisUserDTO> bisList() throws CommonException {
		List<BisUserDTO> list = null;
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			list = session.selectList("bisList");
		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("업체목록 가져오기 실패.");
		} finally {
			session.close();
		}
		return list;
	}
	public BisUserDTO bisMypage(String bisid) throws CommonException {
		BisUserDTO dto = null;
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			dto = session.selectOne("bisMypage", bisid);
		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("마이페이지 불러오기 실패");
		} finally {
			session.close();
		}
		return dto;	
	}
	public void updatebisUser(BisUserDTO bisdto) throws CommonException {
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			int n = session.update("updatebisUser", bisdto);
			session.commit();

		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("회원 수정 실패");
		} finally {
			session.close();
		}
	}

	public void approvalY(String bisid) throws CommonException {
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			int n = session.update("approvalY", bisid);
			session.commit();

		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("승인 실패");
		} finally {
			session.close();
		}
	}
	public void deleteBis(String bisid) throws CommonException {
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			int n = session.delete("deletebis", bisid);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("삭제 실패");
		} finally {
			session.close();
		}
	}
}
