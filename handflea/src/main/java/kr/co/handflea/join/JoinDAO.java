package kr.co.handflea.join;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.handflea.util.dto.MemberDTO;

@Repository
public class JoinDAO {

	@Autowired
	private SqlSession sqlSession;

	public int join( MemberDTO dto ) {
		int successCount = 0;
		System.out.println(dto);
		successCount = sqlSession.insert("JoinMapper.join", dto);
		System.out.println(successCount);
		return successCount;
	}//join

	public int idCheck( String mem_email ) {
		int isYN = 0;
		isYN = sqlSession.selectOne("JoinMapper.idCheck", mem_email);
		return isYN;
	}//idCheck

}//class
