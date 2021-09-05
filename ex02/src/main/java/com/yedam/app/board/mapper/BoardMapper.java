package com.yedam.app.board.mapper;

import java.util.List;

import com.yedam.app.board.domain.BoardVO;

public interface BoardMapper {
	
	//등록, 수정, 삭제, 단건조회, 전체조회
	public int insert(BoardVO vo);
	
	public int update(BoardVO vo);
	
	public int delete(BoardVO vo);
	
	public BoardVO read(BoardVO vo);
	
	public List<BoardVO> getList();

}
