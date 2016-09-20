package com.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dto.couponDTO;
import com.dto.downCouponDTO;
import com.dto.genUserDTO;
import com.dto.mycouponDTO;
import com.exception.CommonException;

public class CouponService {

	public List<mycouponDTO> MyCoupon(String userid) throws CommonException {
		List<mycouponDTO> list = null;
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			list = session.selectList("myCoupon", userid);
		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("내쿠폰가져오기실패");
		} finally {
			session.close();
		}
		return list;	
	}

}
