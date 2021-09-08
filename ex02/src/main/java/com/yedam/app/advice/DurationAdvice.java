package com.yedam.app.advice;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import lombok.extern.java.Log;

@Log
@Component
//@Aspect
public class DurationAdvice {

	@Around("LogAdvice.allpointcut()")
	public Object logTime(ProceedingJoinPoint pjp) {
		long start = System.currentTimeMillis();
		Object obj = null;
		try {
			obj = pjp.proceed();
		} catch (Throwable e) {
			e.printStackTrace();
		} //서비스 메서드 호출
		long end = System.currentTimeMillis();
		log.info("Time===" + (end-start));
		return obj;
	}
	
}
