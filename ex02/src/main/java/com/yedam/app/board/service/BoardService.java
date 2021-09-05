package com.yedam.app.board.service;

import java.util.List;

import com.yedam.app.board.domain.BoardVO;

public interface BoardService {
	
	public int insert(BoardVO vo);
	
	public int update(BoardVO vo);
	
	public int delete(BoardVO vo);
	
	public BoardVO read(BoardVO vo);
	
	public List<BoardVO> getList();

}
