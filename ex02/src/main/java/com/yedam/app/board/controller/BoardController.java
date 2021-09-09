package com.yedam.app.board.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yedam.app.board.domain.BoardAttachVO;
import com.yedam.app.board.domain.BoardVO;
import com.yedam.app.board.domain.Criteria;
import com.yedam.app.board.domain.PageVO;
import com.yedam.app.board.mapper.BoardAttachMapper;
import com.yedam.app.board.service.BoardService;

@Controller
@RequestMapping("/board/*")
//@SessionAttributes("cri")
public class BoardController {

	@Autowired
	BoardService boardService;

	// 전체조회
	@GetMapping("/list")
	public void list(Model model, @ModelAttribute("cri") Criteria cri) {
		System.out.println("cri=====" + cri);
		int total = boardService.getTotalCount(cri);
		model.addAttribute("list", boardService.getList(cri));
		model.addAttribute("pageMaker", new PageVO(cri, total));
	}

	// 단건조회(수정페이지)
	@GetMapping("/get")
	public void get(Model model, BoardVO board, @ModelAttribute("cri") Criteria cri) { // bno 파라미터 -> command 객체
		model.addAttribute("board", boardService.read(board));
	}

	// 수정처리
	@PostMapping("/modify")
	public String modify(BoardVO vo, RedirectAttributes rttr, @ModelAttribute("cri") Criteria cri) {
		int result = boardService.update(vo);
		if (result == 1) {
			rttr.addFlashAttribute("result", "success");
		}
		System.out.println("modify=" + cri);
		// rttr.addAttribute("pageNum", cri.getPageNum());
		// rttr.addAttribute("amount", cri.getAmount());
		return "redirect:/board/list"; // 파라미터 전달 X
	}

	// 등록페이지
	@GetMapping("/registerForm")
	public void registerForm() {

	}

	// 등록처리
	@PostMapping("/register")
	public String register(BoardVO vo, RedirectAttributes rttr, MultipartFile[] uploadFile)
			throws IllegalStateException, IOException {
		//vo.setAttachList(list);
		boardService.insert(vo);
		rttr.addFlashAttribute("result", vo.getBno());
		return "redirect:/board/list"; // 파라미터 전달 X
	}

	// 삭제처리
	@PostMapping("/delete")
	public String delete(BoardVO vo, RedirectAttributes rttr, @ModelAttribute("cri") Criteria cri) {
		int result = boardService.delete(vo);
		if (result == 1) {
			rttr.addFlashAttribute("result", "success");
		}
		// rttr.addAttribute("pageNum", cri.getPageNum());
		// rttr.addAttribute("amount", cri.getAmount());
		return "redirect:/board/list"; // 파라미터 전달 X
	}

	@RequestMapping(value = "/download")
	public void cvplFileDownload(@RequestParam Map<String, Object> commandMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String uuid = (String) commandMap.get("uuid");
		//uuid로 첨부파일 검색
		BoardAttachVO attachVO = boardService.attachRead(uuid);
		String fileName="";
		if(attachVO != null) {
			fileName = attachVO.getFileName();
		}
		File uFile = new File("c:/upload", uuid+fileName);
		long fSize = uFile.length();
		if (fSize > 0) {
			String mimetype = "application/x-msdownload";
			response.setContentType(mimetype);
			response.setHeader("Content-Disposition",
					"attachment;filename=\"" + URLEncoder.encode(fileName, "utf-8") + "\""); //한글깨짐방지
			// setDisposition(atchFileId, request, response);
			BufferedInputStream in = null;
			BufferedOutputStream out = null;
			try {
				in = new BufferedInputStream(new FileInputStream(uFile));
				out = new BufferedOutputStream(response.getOutputStream());
				FileCopyUtils.copy(in, out);
				out.flush();
			} catch (IOException ex) {
			} finally {
				in.close();
				response.getOutputStream().flush();
				response.getOutputStream().close();
			}
		} else {
			response.setContentType("application/x-msdownload");
			PrintWriter printwriter = response.getWriter();
			printwriter.println("<html>");
			printwriter.println("<h2>Could not get file name:<br>" + fileName + "</h2>");
			printwriter.println("<center><h3><a href='javascript: history.go(-1)'>Back</a></h3></center>");
			printwriter.println("&copy; webAccess");
			printwriter.println("</html>");
			printwriter.flush();
			printwriter.close();
		}
	}

}
