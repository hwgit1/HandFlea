package kr.co.handflea.batch;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;

import kr.co.handflea.order.OrderDTO;

public class BatchController1 {
	private final static Logger logger = LoggerFactory.getLogger(BatchController1.class);
	
	@Autowired
	private BatchService1 service;
	
	@Scheduled( cron = "50 42 16 * * *")
	public void updatePrdtcon() {
		List<OrderDTO> list = null;
		list = service.updatePrdtconList();
		
		for (int i = 0; i < list.size(); i++) {
			OrderDTO dto = list.get(i);
			dto.setPrdt_con("3");
			list.set(i, dto);
			int successCnt = 0;
			successCnt = service.updatePrdtRefund(dto);
		}
	}
}
