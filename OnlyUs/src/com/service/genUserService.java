package com.service;

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
}
