package kh.finalpj.zlack.main.model.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalpj.zlack.main.model.dao.ZlackMainDAO;

@Service
public class ZlackMainServiceImpl implements ZlackMainService {
	
	Logger logger = LoggerFactory.getLogger(ZlackMainServiceImpl.class);
	
	@Autowired
	ZlackMainDAO zlackMainDao;


}
