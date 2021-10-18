package com.yedam.app;

import java.sql.Connection;

import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;

@Controller
public class PDFController {

	@Autowired
	DataSource dataSource;
	
	@RequestMapping("/empPdf")
	public void empPdf(HttpServletResponse response) throws Exception {
		Connection conn = dataSource.getConnection();
		//소스파일 컴파일하여 저장 : compileReportToFile
		String jrxmlFile = getClass().getResource("/report/empList.jrxml").getFile();
		String jasperFile = JasperCompileManager.compileReportToFile( jrxmlFile );
		JasperPrint jasperPrint = JasperFillManager.fillReport(jasperFile, null, conn);
		JasperExportManager.exportReportToPdfStream(jasperPrint, response.getOutputStream());
	}
}
