package com.service;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dto.bisUserDTO;
import com.dto.genUserDTO;
import com.exception.CommonException;

public class bisUserService {
	public void addBisUser(bisUserDTO dto) throws CommonException {
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			int n = session.insert("addBisUser", dto);
			session.commit();

		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("사업자회원등록 실패");
		} finally {
			session.close();
		}

	}// end addMember
	public bisUserDTO bislogin(HashMap<String, String> map) throws CommonException {
		bisUserDTO dto = null;
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			dto = session.selectOne("bislogin", map);
			System.out.println("login");
		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("로그인실패");
		} finally {
			session.close();
		}
		return dto;	
		}
	public bisUserDTO bisMypage(String userid) throws CommonException {
		bisUserDTO dto = null;
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			dto = session.selectOne("bisMypage", userid);
		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("마이페이지 불러오기 실패");
		} finally {
			session.close();
		}
		return dto;	
	}

}
