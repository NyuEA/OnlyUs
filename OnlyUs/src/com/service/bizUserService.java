package com.service;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dto.bisUserDTO;
import com.exception.CommonException;

public class bizUserService {
	public void addBisUser(bisUserDTO dto) throws CommonException {
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

	
}
