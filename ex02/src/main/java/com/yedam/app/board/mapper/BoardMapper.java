package com.yedam.app.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.app.board.domain.BoardVO;
import com.yedam.app.board.domain.Criteria;

public interface BoardMapper {
	
	//등록, 수정, 삭제, 단건조회, 전체조회
	public int insert(BoardVO vo);
	
	public int update(BoardVO vo);
	
	public int delete(BoardVO vo);
	
	public BoardVO read(BoardVO vo);
	
	public List<BoardVO> getList(Criteria cri);
	
	//전제 데이터 건수
	public int getTotalCount(Criteria cri);
	
	public int updateReplycnt(@Param("bno") Long bno, @Param("amount") Long amount);

}
