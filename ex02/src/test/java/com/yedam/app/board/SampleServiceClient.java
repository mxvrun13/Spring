package com.yedam.app.board;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yedam.app.sample.service.SampleService;

import lombok.extern.java.Log;

@Log
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:/spring/*-context.xml")
public class SampleServiceClient {

	@Autowired SampleService sampleService;
	
	@Test
	@Rollback(true)
	public void test() {
		String str = "length error12";
		//String str = "yes1";
		sampleService.addData(str);
		log.info("length="+ str.getBytes().length);
	}
}
