package com.yedam.app.employee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.app.employee.domain.EmployeeVO;
import com.yedam.app.employee.mapper.EmpMapper;

@Service
public class EmpServiceImpl implements EmpService {
	
	@Autowired EmpMapper empMapper;

	@Override
	public int insert(EmployeeVO vo) {
		return empMapper.insert(vo);
	}

	@Override
	public int update(EmployeeVO vo) {
		return empMapper.update(vo);
	}

	@Override
	public int delete(EmployeeVO vo) {
		return empMapper.delete(vo);
	}

	@Override
	public EmployeeVO read(EmployeeVO vo) {
		return empMapper.read(vo);
	}

	@Override
	public List<EmployeeVO> getList() {
		return empMapper.getList();
	}

}
