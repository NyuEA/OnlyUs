package com.service;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dto.genUserDTO;
import com.exception.CommonException;

public class genUserService {
	public void addGenUser(genUserDTO dto) throws CommonException {
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			int n = session.insert("addGenUser", dto);
			session.commit();

		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("일반회원등록 실패");
		} finally {
			session.close();
		}

	}// end addMember


		//로그인
	public genUserDTO login(HashMap<String, String> map) throws CommonException {
		genUserDTO dto = null;
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			dto = session.selectOne("login", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("로그인 실패");
		} finally {
			session.close();
		}
		return dto;	
		}// 로그인 끝
	
}