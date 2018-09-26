package hs.bm.server;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hs.bm.util.FileManageUtil;
import hs.bm.util.PropertiesUtil;
import hs.bm.vo.ResObj;

public class ImageUpLoadServer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ImageUpLoadServer() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		ResObj ro = new ResObj();
		ro.setSuccess("fail");
		ro.setError(1);
		
		String suff = request.getHeader("suff");
		if(suff==null){
			suff=".png";
		}
		String name = UUID.randomUUID().toString().replaceAll("-", "");
		
		File file = new File(PropertiesUtil.getPropertiesByName("tmpDir"));
		if(!file.exists()){
			file.mkdirs();
		}
//		System.out.println(file.getPath());
		String basePath = new File(PropertiesUtil.getPropertiesByName("rootDir")).getPath()+File.separator;
		file = new File(PropertiesUtil.getPropertiesByName("tmpDir"),name+suff);
		String path = FileManageUtil.fileUploadToDisk(file,  request);
		path = path.replace(basePath, "");
		ro.setObj(path);
		ro.ToJsp(response);
		return;
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
