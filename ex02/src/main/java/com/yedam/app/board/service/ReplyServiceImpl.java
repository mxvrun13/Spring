package com.yedam.app.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.app.board.domain.Criteria;
import com.yedam.app.board.domain.ReplyPageVO;
import com.yedam.app.board.domain.ReplyVO;
import com.yedam.app.board.mapper.BoardMapper;
import com.yedam.app.board.mapper.ReplyMapper;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired ReplyMapper replyMapper;
	@Autowired BoardMapper boardMapper;

	@Override
	public List<ReplyVO> getList(Criteria cri, Long bno) {
		return replyMapper.getList(cri, bno);
	}

	@Override
	public ReplyVO read(ReplyVO vo) {
		return replyMapper.read(vo);
	}

	@Override
	public int insert(ReplyVO vo) {
		boardMapper.updateReplycnt(vo.getBno(), 1L);
		return replyMapper.insert(vo);
	}

	@Override
	public int update(ReplyVO reply) {
		return replyMapper.update(reply);
	}

	@Override
	public int delete(ReplyVO vo) {
		boardMapper.updateReplycnt(vo.getBno(), -1L);
		return replyMapper.delete(vo);
	}

	@Override
	public ReplyPageVO getListWithPaging(Criteria cri, Long bno) {
		ReplyPageVO vo = new ReplyPageVO();
		vo.setReplyCnt(replyMapper.getCountByBno(bno));
		vo.setList(replyMapper.getList(cri, bno));
		return vo;
	}

	@Override
	public int getCountByBno(Long bno) {
		return replyMapper.getCountByBno(bno);
	}

}
