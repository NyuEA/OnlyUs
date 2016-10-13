package com.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.dto.GenUserDTO;
import com.exception.CommonException;



public class GenUserDAO {
	
	@Autowired
	SqlSessionTemplate template;
		//페이지
	
	public void addGenUser(GenUserDTO dto) throws CommonException {
		
		try {
			int n = template.insert("addGenUser", dto);
			

		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("ll");
		}

	}// end addMember
	public List<GenUserDTO> genList() throws CommonException {
		List<GenUserDTO> list = null;
		;
		try {
			list = template.selectList("genList");
		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("�쉶�썝紐⑸줉 媛��졇�삤湲� �떎�뙣.");
		}
		return list;
	}

		//�뜝�떥源띿삕�뜝�룞�삕
	public GenUserDTO login(HashMap<String, String> map) throws CommonException {
		GenUserDTO dto = null;
	
		try {
			dto = template.selectOne("login", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("濡쒓렇�씤�떎�뙣");
		}
		return dto;	
		}// �뜝�떥源띿삕�뜝�룞�삕 �뜝�룞�삕


	public GenUserDTO mypage(String userid) throws CommonException {
		GenUserDTO dto = null;
		
		try {
			dto = template.selectOne("mypage", userid);
		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("留덉씠�럹�씠吏� 遺덈윭�삤湲� �떎�뙣");
		} 
		return dto;	
	}
	public void updateGenUser(GenUserDTO dto) throws CommonException {
		
		try {
			int n = template.update("updateGenUser", dto);
			

		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("�쉶�썝�닔�젙 �떎�뙣");
		} 
	}


	public void deleteGenUser(String userid) throws CommonException{
		
		try {
			int n = template.update("deleteGenUser", userid);
			

		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("�쉶�썝�깉�눜 �떎�뙣");
		} 
	}
}
