package com.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dto.BisUserDTO;
import com.dto.CouponDTO;
import com.dto.DownCouponDTO;
import com.dto.GenUserDTO;
import com.dto.MycouponDTO;
import com.dto.Top10DTO;
import com.exception.CommonException;

public class CouponService {

	public List<MycouponDTO> MyCoupon(String userid) throws CommonException {
		List<MycouponDTO> list = null;
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			list = session.selectList("myCoupon", userid);
		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("�궡荑좏룿媛��졇�삤湲곗떎�뙣");
		} finally {
			session.close();
		}
		return list;	
	}

	public List<Top10DTO> first10() throws CommonException {
		List<Top10DTO> list = null;
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			list = session.selectList("first10");
		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("10媛��졇�삤湲� �떎�뙣");
		} finally {
			session.close();
		}
		return list;	
	}
	public List<CouponDTO> BisCoupon(String bisid) throws CommonException {
		List<CouponDTO> list = null;
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			list = session.selectList("BisCoupon", bisid);
		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("BisCoupon 리스트 가져오기 실패");
		} finally {
			session.close();
		}
		return list;	
	}
	
	public List<BisUserDTO> admin1() throws CommonException {
		List<BisUserDTO> list = null;
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			list = session.selectList("admin");
		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("가입관리");
		} finally {
			session.close();
		}
		return list;	
	}

	public List<Top10DTO> search(String searchName) throws CommonException {
		List<Top10DTO> list = null;
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			list = session.selectList("serch10",searchName);
		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("지역10가져오기 실패");
		} finally {
			session.close();
		}
		return list;	
	}

}
