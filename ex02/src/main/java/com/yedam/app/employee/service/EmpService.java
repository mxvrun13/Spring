package com.yedam.app.employee.service;

import java.util.List;

import com.yedam.app.employee.domain.EmployeeVO;


public interface EmpService {
	
	public int insert(EmployeeVO vo);
	
	public int update(EmployeeVO vo);
	
	public int delete(EmployeeVO vo);
	
	public EmployeeVO read(EmployeeVO vo);
	
	public List<EmployeeVO> getList();

}
