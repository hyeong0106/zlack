package kh.finalpj.zlack.admin.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalpj.zlack.admin.model.dao.AdminDAO;
import kh.finalpj.zlack.member.model.dao.MemberDAO;

@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	AdminDAO admindao;
}
