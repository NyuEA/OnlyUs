package com.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;


import com.dao.BisUserDAO;
import com.dto.BisUserDTO;
import com.exception.CommonException;

public class BisUserService {
	
	@Autowired
	BisUserDAO dao;
	
	
	public void addBisUser(BisUserDTO dto) throws CommonException {
	

	}// end addMember

	public BisUserDTO bislogin(HashMap<String, String> map) throws CommonException {
		
		return dao.bislogin(map);
	}

	public List<BisUserDTO> bisjoinList() throws CommonException {
		
		return dao.bisjoinList();
	}
	public List<BisUserDTO> bisList() throws CommonException {
		
		return dao.bisList();
	}
	public BisUserDTO bisMypage(String bisid) throws CommonException {
		
		return dao.bisMypage(bisid);	
	}
	public void updatebisUser(BisUserDTO bisdto) throws CommonException {
		dao.updatebisUser(bisdto);
	}

	public void approvalY(String bisid) throws CommonException {
		dao.approvalY(bisid);
	}
	public void deleteBis(String bisid) throws CommonException {
		dao.deleteBis(bisid);
	}
}
