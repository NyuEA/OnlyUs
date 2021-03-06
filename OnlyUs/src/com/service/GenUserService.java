package com.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dto.BisUserDTO;
import com.dto.GenUserDTO;
import com.exception.CommonException;

public class GenUserService {
	public void addGenUser(GenUserDTO dto) throws CommonException {
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			int n = session.insert("addGenUser", dto);
			session.commit();

		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("회원등록 실패");
		} finally {
			session.close();
		}

	}// end addMember
	public List<GenUserDTO> genList() throws CommonException {
		List<GenUserDTO> list = null;
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			list = session.selectList("genList");
		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("회원목록 가져오기 실패.");
		} finally {
			session.close();
		}
		return list;
	}

		//占싸깍옙占쏙옙
	public GenUserDTO login(HashMap<String, String> map) throws CommonException {
		GenUserDTO dto = null;
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			dto = session.selectOne("login", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("로그인실패");
		} finally {
			session.close();
		}
		return dto;	
		}// 占싸깍옙占쏙옙 占쏙옙


	public GenUserDTO mypage(String userid) throws CommonException {
		GenUserDTO dto = null;
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			dto = session.selectOne("mypage", userid);
		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("마이페이지 불러오기 실패");
		} finally {
			session.close();
		}
		return dto;	
	}
	public void updateGenUser(GenUserDTO dto) throws CommonException {
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			int n = session.update("updateGenUser", dto);
			session.commit();

		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("회원수정 실패");
		} finally {
			session.close();
		}
	}


	public void deleteGenUser(String userid) throws CommonException{
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			int n = session.update("deleteGenUser", userid);
			session.commit();

		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("회원탈퇴 실패");
		} finally {
			session.close();
		}
	}
}