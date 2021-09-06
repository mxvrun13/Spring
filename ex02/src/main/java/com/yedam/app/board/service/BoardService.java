package com.yedam.app.board.service;

import java.util.List;

import com.yedam.app.board.domain.BoardVO;
import com.yedam.app.board.domain.Criteria;

public interface BoardService {
	
	public int insert(BoardVO vo);
	
	public int update(BoardVO vo);
	
	public int delete(BoardVO vo);
	
	public BoardVO read(BoardVO vo);
	
	public List<BoardVO> getList(Criteria cri);
	
	//전제 데이터 건수
	public int getTotalCount(Criteria cri);

}
