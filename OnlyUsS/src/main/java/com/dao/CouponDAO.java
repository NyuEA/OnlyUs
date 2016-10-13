package com.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.dto.BisUserDTO;
import com.dto.CouponDTO;
import com.dto.MycouponDTO;
import com.dto.Top10DTO;
import com.exception.CommonException;

public class CouponDAO {


	@Autowired
	SqlSessionTemplate template;
	
	
	public List<MycouponDTO> MyCoupon(String userid) throws CommonException {
		List<MycouponDTO> list = null;
		
		try {
			list = template.selectList("myCoupon", userid);
		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("占쎄땀�뜎醫뤿？揶쏉옙占쎌죬占쎌궎疫꿸퀣�뼄占쎈솭");
		} 
		return list;	
	}

	public void deleteCoupon(String couid) throws CommonException {
		
		try {
			int n = template.delete("deleteCoupon", couid);
			

		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("荑좏룿�궘�젣 �떎�뙣");
		} 
	}
	public List<Top10DTO> first10() throws CommonException {
		List<Top10DTO> list = null;
		
		try {
			list = template.selectList("first10");
		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("10揶쏉옙占쎌죬占쎌궎疫뀐옙 占쎈뼄占쎈솭");
		} 
		return list;	
	}
	public void update_YN(HashMap<String, String> map) throws CommonException {
		
		try {
			int n = template.update("update_YN", map);
			

		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("荑좏룿 �젣怨듭뿬遺� �닔�젙 �떎�뙣");
		} 
	}
	public List<CouponDTO> BisCoupon(String bisid) throws CommonException {
		List<CouponDTO> list = null;
		
		try {
			list = template.selectList("BisCoupon", bisid);
		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("BisCoupon 由ъ뒪�듃 媛��졇�삤湲� �떎�뙣");
		} 
		return list;	
	}
	
	public List<BisUserDTO> admin1() throws CommonException {
		List<BisUserDTO> list = null;
		
		try {
			list = template.selectList("admin");
		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("媛��엯愿�由�");
		} 
		return list;	
	}

	public List<Top10DTO> search(String searchName) throws CommonException {
		List<Top10DTO> list = null;
		
		try {
			list = template.selectList("serch10",searchName);
		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("吏��뿭10媛��졇�삤湲� �떎�뙣");
		} 
		return list;	
	}


}
