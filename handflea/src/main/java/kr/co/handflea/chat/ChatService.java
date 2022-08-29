package kr.co.handflea.chat;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ChatService {
	
	@Autowired
	ChatDAO dao;

	public List<ChatDTO> ajaxList(String mem_no) {
		List<ChatDTO> list = null;
		list = dao.ajaxList(mem_no);
		
		return list;
	}

	public List<ChatDTO> chatDetail(ChatDTO dto) {
		List<ChatDTO> list = null;
		list = dao.chatDetail(dto);
		
		return list;
	}

	public int chatSend(ChatDTO dto) {
		int insertYN = 0;
		insertYN = dao.chatSend(dto);
		
		return insertYN;
	}

	public String selectName(String other_no) {
		String mem_name = null;
		mem_name = dao.selectName(other_no);
		
		return mem_name;
	}

	public String setRoomNo(ChatDTO dto) {
		String chat_roomno = null;
		chat_roomno = dao.setRoomNo(dto);
		
		return chat_roomno;
	}

	public String selectPhotopath(String other_no) {
		String mem_photopath = null;
		mem_photopath = dao.selectPhotopath(other_no);
		
		return mem_photopath;
	}
}
