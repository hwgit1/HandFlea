package kr.co.handflea.QnA;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.handflea.util.dto.SearchDTO;

@Service
public class QnAService {
	
	@Autowired
	private QnADAO dao;
	
	public int update( QnADTO dto) {
		int successCount = 0;
		successCount = dao.update( dto );
		return successCount;
	}
	
	public int delete( QnADTO dto) {
		int successCount = 0;
		successCount = dao.delete( dto );
		return successCount;
	
	}
	public QnADTO detail( String qna_no) {
		dao.incrementViewCnt( qna_no);
		
		QnADTO dto = null;
		dto = dao.detail( qna_no);
		return dto;
	}
 
	public int write( QnADTO dto) {
		int successCount = 0;
		successCount = dao.write( dto );
		return successCount;
	}
	
	public List<QnADTO> searchList( SearchDTO dto) {
		List<QnADTO> list= null;
		list = dao.searchList( dto);
		return list;
	}
	
	public int searchListCount( SearchDTO dto) {
		int totalCount = 0;
		totalCount = dao.searchListCount( dto );
		return totalCount;
	}

	





}









