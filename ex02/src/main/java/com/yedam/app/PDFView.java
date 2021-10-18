package com.yedam.app;

import java.sql.Connection;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.view.AbstractView;

import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;

@Component
public class PDFView extends AbstractView {

	@Autowired
	DataSource datasource; @Override
	
	protected void renderMergedOutputModel(Map<String, Object> model, 
										HttpServletRequest request, HttpServletResponse response) throws Exception { 
		Connection conn = datasource.getConnection();
		String reportFile = (String)model.get("filename");
		//HashMap<String,Object> map = (String) model.get("param");
		//소스파일 컴파일하여 저장 : compileReportToFile
		String jrxmlFile = getClass().getResource(reportFile).getFile();
		String jasperFile = JasperCompileManager.compileReportToFile( jrxmlFile );
		JasperPrint jasperPrint = JasperFillManager.fillReport(jasperFile, null, conn);
		JasperExportManager.exportReportToPdfStream(jasperPrint, response.getOutputStream());
	}
}
