package kr.co.handflea.batch;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;

@Configuration
@EnableScheduling
public class BatchConfig1 {

	@Bean
	public BatchController1 createBatchController1() {
		return new BatchController1();
	}
}
