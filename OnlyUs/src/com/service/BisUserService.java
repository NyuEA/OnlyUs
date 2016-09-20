package com.service;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dto.BisUserDTO;
import com.dto.GenUserDTO;
import com.exception.CommonException;

public class BisUserService {
	public void addBisUser(BisUserDTO dto) throws CommonException {
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			int n = session.insert("addBisUser", dto);
			session.commit();

		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("�����ȸ����� ����");
		} finally {
			session.close();
		}

	}// end addMember
	public BisUserDTO bislogin(HashMap<String, String> map) throws CommonException {
		BisUserDTO dto = null;
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			dto = session.selectOne("bislogin", map);
			System.out.println("login");
		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("�α��ν���");
		} finally {
			session.close();
		}
		return dto;	
		}
	public BisUserDTO bisMypage(String userid) throws CommonException {
		BisUserDTO dto = null;
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			dto = session.selectOne("bisMypage", userid);
		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("���������� �ҷ����� ����");
		} finally {
			session.close();
		}
		return dto;	
	}
	public void updatebisUser(BisUserDTO bisdto) throws CommonException {
		System.out.println(bisdto.getAddr1());
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			int n = session.update("updatebisUser", bisdto);
			session.commit();

		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("ȸ������ ����");
		} finally {
			session.close();
		}
	}
}
