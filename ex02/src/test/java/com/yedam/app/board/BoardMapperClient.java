package com.yedam.app.board;

import static org.junit.Assert.assertEquals;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yedam.app.board.domain.BoardVO;
import com.yedam.app.board.service.BoardService;

import lombok.extern.java.Log;

@Log
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:/spring/*-context.xml")
public class BoardMapperClient {
	
	@Autowired BoardService boardMapper;

	@Test
	public void getList() {
		log.info(boardMapper.getList().toString());
	}
	
	//@Test
	public void insert() {
		BoardVO vo = new BoardVO();
		vo.setTitle("테스트");
		vo.setContent("테스트입니다.");
		vo.setWriter("newbie");
		
		boardMapper.insert(vo);
		log.info(vo.toString());
	}
	
	//@Test
	public void read() {
		BoardVO vo = new BoardVO();
		vo.setBno(2);
		log.info(boardMapper.read(vo).toString());
	}
	
	//@Test
	public void update() {
		BoardVO vo = new BoardVO();
		vo.setTitle("제목 수정");
		vo.setContent("내용 수정");
		vo.setWriter("작성자 수정");
		vo.setBno(6);
		
		boardMapper.update(vo);
		log.info(vo.toString());
	}
	
	//@Test
	public void delete() {
		BoardVO vo = new BoardVO();
		vo.setBno(1);
		
		int result = boardMapper.delete(vo);
		assertEquals(result, 1);
	}

}
