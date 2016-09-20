package com.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dto.CouponDTO;
import com.dto.DownCouponDTO;
import com.dto.GenUserDTO;
import com.dto.MycouponDTO;
import com.exception.CommonException;

public class CouponService {

	public List<MycouponDTO> MyCoupon(String userid) throws CommonException {
		List<MycouponDTO> list = null;
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
