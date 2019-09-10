package kh.finalpj.zlack.main.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalpj.zlack.analysis.model.vo.UseChannelAnalysis;
import kh.finalpj.zlack.analysis.model.vo.UserChannel;

@Repository
public class ZlackMainDAOImpl implements ZlackMainDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	
	


}
