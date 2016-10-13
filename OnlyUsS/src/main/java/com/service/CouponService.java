package com.service;

import java.util.HashMap;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.CouponDAO;
import com.dto.BisUserDTO;
import com.dto.CouponDTO;

import com.dto.MycouponDTO;
import com.dto.Top10DTO;
import com.exception.CommonException;

@Service
public class CouponService {

	@Autowired
	CouponDAO dao;
	
	
	public List<MycouponDTO> MyCoupon(String userid) throws CommonException {
		
		return dao.MyCoupon(userid);	
	}

	public void deleteCoupon(String couid) throws CommonException {
		dao.deleteCoupon(couid);
	}
	public List<Top10DTO> first10() throws CommonException {
		
		return dao.first10();	
	}
	public void update_YN(HashMap<String, String> map) throws CommonException {
		dao.update_YN(map);
	}
	public List<CouponDTO> BisCoupon(String bisid) throws CommonException {
		
		return dao.BisCoupon(bisid);	
	}
	
	public List<BisUserDTO> admin1() throws CommonException {
		
		return dao.admin1();	
	}

	public List<Top10DTO> search(String searchName) throws CommonException {
		
		return dao.search(searchName);	
	}


}
