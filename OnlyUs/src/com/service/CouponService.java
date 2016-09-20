package com.service;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dto.couponDTO;
import com.dto.genUserDTO;
import com.exception.CommonException;

public class CouponService {

	public couponDTO MyCoupon(String userid) throws CommonException {
		couponDTO dto = null;
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			dto = session.selectOne("myCoupon", userid);
		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("내쿠폰가져오기실패");
		} finally {
			session.close();
		}
		return dto;	
	}

}
