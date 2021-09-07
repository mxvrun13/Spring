package com.yedam.app.employee.mapper;

import java.util.List;

import com.yedam.app.board.domain.Criteria;
import com.yedam.app.employee.domain.EmployeeVO;


public interface EmpMapper {
	
	//등록, 수정, 삭제, 단건조회, 전체조회
		public int insert(EmployeeVO vo);
		
		public int update(EmployeeVO vo);
		
		public int delete(EmployeeVO vo);
		
		public EmployeeVO read(EmployeeVO vo);
		
		public List<EmployeeVO> getList(Criteria cri);

		public int getTotalCount(Criteria cri);
}
