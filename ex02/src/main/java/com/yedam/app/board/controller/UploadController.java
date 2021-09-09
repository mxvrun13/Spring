package com.yedam.app.board.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.yedam.app.board.domain.BoardAttachVO;
import com.yedam.app.board.domain.BoardVO;

import lombok.extern.java.Log;

@Log
@Controller
public class UploadController {
	
	@GetMapping("page2")
	public ResponseEntity<BoardVO> page2(@RequestParam int h) {
		ResponseEntity<BoardVO> result = null;
		if(h<10) {
			result = ResponseEntity.status(HttpStatus.NOT_FOUND).body(new BoardVO());
		} else {
			result = ResponseEntity.status(HttpStatus.OK).body(new BoardVO());
		}
		return result;
	}
	
	@GetMapping("page1")
	public void page1(HttpServletResponse response) throws IOException {
		String mimeType = "application/xml";
		response.setContentType(mimeType);
		//response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<body>");
		out.println("<div>test</div>");
		out.println("<div>안녕하세요</div>");
		out.println("</body>");
		out.println("</html>");
	}

	@PostMapping("/uploadFormAction")
	public void uploadFormAction(MultipartFile[] uploadFile) throws IllegalStateException, IOException {
		for (int i = 0; i < uploadFile.length; i++) {
			MultipartFile ufile = uploadFile[i];
			if(!ufile.isEmpty() && ufile.getSize()>0) {
				String fileName = ufile.getOriginalFilename();
				//String saveName = System.currentTimeMillis() + "";
				UUID uuid = UUID.randomUUID();
				File file =  new File("c:/upload", uuid+fileName);
				ufile.transferTo(file);
			}
		}
	}
	
	@PostMapping("/uploadAjaxAction")
	@ResponseBody
	public List<BoardAttachVO> uploadAjaxAction(MultipartFile[] uploadFile, BoardVO vo) throws IllegalStateException, IOException {
		List<BoardAttachVO> list = new ArrayList<BoardAttachVO>();
		String path = "c:/upload";
		for (int i = 0; i < uploadFile.length; i++) {
			MultipartFile ufile = uploadFile[i];
			if (!ufile.isEmpty() && ufile.getSize() > 0) {
				String fileName = ufile.getOriginalFilename();
				UUID uuid = UUID.randomUUID();
				File file = new File(path, uuid + fileName);
				ufile.transferTo(file);
				// 파일 정보
				BoardAttachVO attach = new BoardAttachVO();
				attach.setUuid(uuid.toString());
				attach.setFileName(fileName);
				attach.setUploadPath(path);
				list.add(attach);
			}
		}
		return list;
	}

}
