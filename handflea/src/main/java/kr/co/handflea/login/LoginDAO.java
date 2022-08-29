package kr.co.handflea.login;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.handflea.util.dto.MemberDTO;

@Repository
public class LoginDAO {

	@Autowired
	private SqlSession sqlSession;

	public MemberDTO login( MemberDTO dto ) {
		MemberDTO dtoFromDB = null;
		dtoFromDB = sqlSession.selectOne("LoginMapper.login", dto);
		return dtoFromDB;
	}//login

}//class
