package com.yedam.app.employee.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yedam.app.board.domain.BoardVO;
import com.yedam.app.employee.domain.EmployeeVO;
import com.yedam.app.employee.service.EmpService;

@Controller
@RequestMapping("/emp/*")
public class EmpController {
	
	@Autowired EmpService empService;
	
	@GetMapping("/list")
	public void list(Model model) {
		model.addAttribute("list", empService.getList());
	}
	
	@GetMapping("/get")
	public void get(Model model, EmployeeVO employee) {
		model.addAttribute("employee", empService.read(employee));
	}
	
	@PostMapping("/modify")
	public String modify(EmployeeVO vo, RedirectAttributes rttr) {
		int result = empService.update(vo);
		if(result == 1) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/emp/get";	//파라미터 전달 X
	}
	
	@GetMapping("/registerForm")
	public void registerForm() {
		
	}
	
	@PostMapping("/register")
	public String register(EmployeeVO vo, RedirectAttributes rttr) {
		empService.insert(vo);
		rttr.addFlashAttribute("result", vo.getEmpno());
		return "redirect:/emp/list";	//파라미터 전달 X
	}
	
	@PostMapping("/delete")
	public String delete(EmployeeVO vo, RedirectAttributes rttr) {
		int result = empService.delete(vo);
		if(result == 1) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/emp/list";	//파라미터 전달 X
	}
}
