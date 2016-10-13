package com.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.GenUserDAO;

import com.dto.GenUserDTO;
import com.exception.CommonException;



@Service
public class GenUserService {
	
	
	@Autowired
	GenUserDAO dao;
	

	public void addGenUser(GenUserDTO dto) throws CommonException{
		dao.addGenUser(dto);
	}
	
	public List<GenUserDTO> genList() throws CommonException {	
		return dao.genList();
	}

	
	public GenUserDTO login(HashMap<String, String> map) throws CommonException {
		
		return dao.login(map);	
		}


	public GenUserDTO mypage(String userid) throws CommonException {
		
		return dao.mypage(userid);	
	}
	
	
	public void updateGenUser(GenUserDTO dto) throws CommonException {
		dao.updateGenUser(dto);
	}


	public void deleteGenUser(String userid) throws CommonException{
		dao.deleteGenUser(userid);
	}
}