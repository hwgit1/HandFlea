package kr.co.handflea.join;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.handflea.util.dto.MemberDTO;

@Service
public class JoinService {

	@Autowired
	private JoinDAO dao;

	public int join( MemberDTO dto ) {
		int successCount = 0;
		
		if( dto.getTel1() != null && !dto.getTel1().equals("")
				&& dto.getTel2() != null && !dto.getTel2().equals("")
				&& dto.getTel3() != null && !dto.getTel3().equals("") ) {
				dto.setPnum( dto.getTel1() + dto.getTel2() + dto.getTel3() );
			}
		
		successCount = dao.join( dto );
		return successCount;
	}//join

	public int idCheck( String mem_email ) {
		int isYN = 0;
		isYN = dao.idCheck( mem_email );
		return isYN;
	}//idCheck

}//class
