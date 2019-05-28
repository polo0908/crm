package com.cbt.controller;
import java.io.File;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cbt.util.OperationFileUtil1;
import com.cbt.util.UploadAndDownloadPathUtil;

@Controller
@RequestMapping("/file")
public class FileController {
	
     @RequestMapping("/uploadFile.do")
     public void saveClientOrder(HttpServletRequest request, HttpServletResponse response) throws Exception{
    	 String path = UploadAndDownloadPathUtil.getFactoryFilePath();
		 File file = new File(path);
		 if  (!file.exists()  && !file .isDirectory())       {         
				file .mkdir();     
		 }  	
		 //调用保存文件的帮助类进行保存文件(文件上传，form表单提交)
		 Map<String, String> multiFileUpload = OperationFileUtil1.multiFileUpload(request, path+File.separator);
     }
}
