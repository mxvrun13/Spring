package com.yedam.app.board.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.app.board.domain.Criteria;
import com.yedam.app.board.domain.ReplyPageVO;
import com.yedam.app.board.domain.ReplyVO;

public interface ReplyService {

	public List<ReplyVO> getList(@Param("cri") Criteria cri, @Param("bno") Long bno);

	public ReplyVO read(ReplyVO vo);

	public int insert(ReplyVO vo);

	public int update(ReplyVO reply);

	public int delete(ReplyVO vo);

	public ReplyPageVO getListWithPaging(@Param("cri") Criteria cri, @Param("bno") Long bno);

	public int getCountByBno(Long bno);

}
