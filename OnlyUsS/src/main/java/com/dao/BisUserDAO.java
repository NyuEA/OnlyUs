package com.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.dto.BisUserDTO;
import com.exception.CommonException;


public class BisUserDAO {

	@Autowired
	SqlSessionTemplate template;
		
	public void addBisUser(BisUserDTO dto) throws CommonException{
	
		try {
			int n = template.insert("addBisUser", dto);
			

		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("�쉶�썝媛��엯 �떎�뙣.");
		} 

	}// end addMember

	public BisUserDTO bislogin(HashMap<String, String> map) throws CommonException {
		BisUserDTO dto = null;
		
		try {
			dto = template.selectOne("bislogin", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("濡쒓렇�씤�떎�뙣.");
		} 
		return dto;
	}

	public List<BisUserDTO> bisjoinList() throws CommonException {
		List<BisUserDTO> list = null;
		
		try {
			list = template.selectList("bisjoinList");
		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("媛��엯�떊泥�紐⑸줉 媛��졇�삤湲� �떎�뙣.");
		} 
		return list;
	}
	public List<BisUserDTO> bisList() throws CommonException {
		List<BisUserDTO> list = null;
		
		try {
			list = template.selectList("bisList");
		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("�뾽泥대ぉ濡� 媛��졇�삤湲� �떎�뙣.");
		} 
		return list;
	}
	public BisUserDTO bisMypage(String bisid) throws CommonException {
		BisUserDTO dto = null;
		
		try {
			dto = template.selectOne("bisMypage", bisid);
		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("留덉씠�럹�씠吏� 遺덈윭�삤湲� �떎�뙣");
		} 
		return dto;	
	}
	public void updatebisUser(BisUserDTO bisdto) throws CommonException {
		
		try {
			int n = template.update("updatebisUser", bisdto);
			

		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("�쉶�썝 �닔�젙 �떎�뙣");
		} 
	}

	public void approvalY(String bisid) throws CommonException {
		
		try {
			int n = template.update("approvalY", bisid);
			

		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("�듅�씤 �떎�뙣");
		}
	}
	public void deleteBis(String bisid) throws CommonException {
		
		try {
			int n = template.delete("deletebis", bisid);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("�궘�젣 �떎�뙣");
		} 
	}
}
