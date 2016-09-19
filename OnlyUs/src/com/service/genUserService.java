package com.service;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dto.bisUserDTO;
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
			throw new CommonException("회원등록 실패");
		} finally {
			session.close();
		}

	}// end addMember


		//占싸깍옙占쏙옙
	public genUserDTO login(HashMap<String, String> map) throws CommonException {
		genUserDTO dto = null;
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


	public genUserDTO mypage(String userid) throws CommonException {
		genUserDTO dto = null;
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
	public void updateGenUser(genUserDTO dto) throws CommonException {
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
}