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
			throw new CommonException("�Ϲ�ȸ����� ����");
		} finally {
			session.close();
		}

	}// end addMember


		//�α���
	public genUserDTO login(HashMap<String, String> map) throws CommonException {
		genUserDTO dto = null;
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			dto = session.selectOne("login", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("�α��� ����");
		} finally {
			session.close();
		}
		return dto;	
		}// �α��� ��


	public genUserDTO mypage(String userid) throws CommonException {
		genUserDTO dto = null;
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			dto = session.selectOne("mypage", userid);
		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("�α��� ����");
		} finally {
			session.close();
		}
		return dto;	
	}
	
}