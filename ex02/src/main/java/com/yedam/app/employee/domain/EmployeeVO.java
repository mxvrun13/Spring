package com.yedam.app.employee.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class EmployeeVO {
	
	private int empno;
	private String empname;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date hiredate;
	private String department;
	private int salary;

}
