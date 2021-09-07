package com.yedam.app.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.app.board.domain.Criteria;
import com.yedam.app.board.domain.ReplyVO;

public interface ReplyMapper {

	public List<ReplyVO> getList(@Param("cri") Criteria cri, @Param("bno") Long bno);
	
	public ReplyVO read(ReplyVO vo);
	
	public int insert(ReplyVO vo);
	
	public int update(ReplyVO reply);
	
	public int delete(ReplyVO vo);
	
}
