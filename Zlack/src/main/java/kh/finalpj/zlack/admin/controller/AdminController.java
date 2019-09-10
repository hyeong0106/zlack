package kh.finalpj.zlack.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kh.finalpj.zlack.admin.model.service.AdminService;

@Controller
public class AdminController {
	@Autowired
	AdminService adminservice;
}
