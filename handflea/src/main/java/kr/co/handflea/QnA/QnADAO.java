package kr.co.handflea.QnA;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.handflea.util.dto.SearchDTO;

@Repository
public class QnADAO {
	@Autowired
	private SqlSession sqlSession;
	
	public int update(QnADTO dto) {
		int successCount = 0;
		successCount = sqlSession.update("QnAMapper.update", dto);
		return successCount;
	}

	public int delete( QnADTO dto ) {
		int successCount = 0;
		successCount = sqlSession.delete("QnAMapper.delete", dto);
		return successCount;
	}
	public void incrementViewCnt( String qna_no ) {
		sqlSession.update("QnAMapper.incrementViewCnt", qna_no);
	}

	public QnADTO detail( String qna_no ) {
		QnADTO dto = null;
		dto = sqlSession.selectOne("QnAMapper.detail", qna_no);
		return dto;
	}

	public int write( QnADTO dto) {
		int successCount = 0;
		successCount = sqlSession.insert("QnAMapper.write", dto);
		return successCount;
	}

	public List<QnADTO> searchList( SearchDTO dto ) {
		List<QnADTO> list = null;
		list = sqlSession.selectList("QnAMapper.selectList", dto);
		return list;
	}

	public int searchListCount( SearchDTO dto ) {
		int totalCount = 0;
		totalCount = sqlSession.selectOne("QnAMapper.searchListCount", dto);
		return totalCount;
	}

	
	

}
