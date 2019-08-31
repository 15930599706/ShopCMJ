package com.zhanshen.web.servlet;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.RequestWrapper;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import com.zhanshen.dao.*;
import org.json.JSONObject;
import com.baidu.aip.speech.AipSpeech;
import com.baidu.aip.util.Util;

/**
 * Servlet implementation class FilePost
 */
@WebServlet("/FilePost")
public class FilePost extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private File uploadPath;  //设置文件上传路径
	private File temPath;     //当文件过大时，设置一个临时保存路径
	private static final int DEFUALT_SIZE_THRESHOLD = 4096;   //当超过该大小时，文件存储为临时文件
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FilePost() {
        super();
        // TODO Auto-generated constructor stub
    }
   
 
    

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//  设置编码为UTF-8
		String endpath="";
		request.setCharacterEncoding("UTF-8");
		response.setContentType("utf-8");
		String questionaireId="";
		String Tihao="";
		String StuId= (String) request.getSession().getAttribute("StuID");
		
		String AllPath="";
		
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setSizeThreshold(DEFUALT_SIZE_THRESHOLD);    //超过该大小,存储为临时文件
		factory.setRepository(temPath);
		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setSizeMax(1000000*20);  //设置上传文件的最大值
		try {
			List<FileItem> fileItems = upload.parseRequest(request);
			//为了防止重复文件名以及文件名称，基于文件上传时间来生成随机文件名以及文件名称
			String filePackName = getRadomFileName();
			File file = new File(uploadPath+"\\"+filePackName);
			file.mkdirs();	//在upload文件夹或temp文件夹下新建一个文件夹用于存放新上传的文件
			for(Iterator<FileItem> iter = fileItems.iterator(); iter.hasNext();){
				FileItem item = (FileItem) iter.next();
				
				//普通表单输入域
				if(item.isFormField()){
				//获得这个数据的name
					String name = item.getFieldName();
				//获得这个数据的value
					String value = item.getString();
				//编码转化
					value = new String(value.getBytes("ISO-8859-1"),"UTF-8");
				//对数据进行判断
					switch(name)
					{
						case "QnaireID":
							questionaireId = value;
							break;
						case "this_que_num":
							Tihao = value;
							break;
						default:
							break;
					}
				}
				
				//上传文件表单输入域
				if(!item.isFormField()){
					String fileName = item.getName();	//获取文件名称
					long size = item.getSize();	//获取文件大小
					System.out.println("文件名称:"+fileName+";文件大小:"+size);
					if((fileName == null || fileName.equals("")) && size == 0){//判断文件名是否为空
						continue;
					}
					//截取地址字符串
					System.out.println("提交地址:"+fileName);
					fileName="audioanaly.wav";
					item.write(new File(uploadPath+"\\"+filePackName,fileName));//将上传的文件写入对应的文件夹
					System.out.println("文件上传成功");
					System.out.println("文件成功保存到"+uploadPath+"\\"+filePackName+"目录下");
					AllPath = uploadPath+"\\"+filePackName;
					endpath=uploadPath+"\\"+filePackName+"\\"+fileName;
				}
			}
            
		}catch (FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("-------------------------"+endpath);
		audioTest at=new audioTest();
		String ret=at.running(endpath);
		System.out.println("-------------------------"+ret);
		
		int start,stop;
		start=stop=0;
		if(ret.equals("error404")) {
			ret="语音识别失败";
			//request.getSession().setAttribute("audio_info","语音识别失败");
			 System.out.println("fail");
		}else {
			boolean gets=false;
			for(int i=0;i<ret.length();i++) {
				if(ret.charAt(i)=='"'&&gets==false) {
					start=i+1;
					gets=true;
				}else if((ret.charAt(i)=='"'||ret.charAt(i)=='。')&&gets==true) {
					stop=i;
					break;
				}
			}
			ret=ret.substring(start,stop);
			
		}
		try {
		//return value:ret
		request.getSession().setAttribute("audio_info",ret);
		request.getRequestDispatcher("aesfas").forward(request, response);
		System.out.println("aaaa");
		//request.getRequestDispatcher("/luyin2.jsp").forward(request, response);
		}catch (Exception e) {
			// TODO: handle exception
		}
		}
	
	//基于当前时间生成随机文件夹名及文件名
	public static String getRadomFileName(){
		return "audio";
	}
	public void init(){
		uploadPath = new File(getServletContext().getRealPath("upload"));
		//判断目录是否存在
		if(!uploadPath.exists()){
			//创建目录
			uploadPath.mkdir();
			System.out.println("目录"+uploadPath+"创建成功");
		}
		System.out.println("目录"+uploadPath+"存在");
		//临时目录
		temPath = new File(getServletContext().getRealPath("temp"));
		if(!temPath.exists()){
			temPath.mkdir();
			System.out.println("临时目录"+temPath+"创建成功");
		}
		System.out.println("临时目录"+temPath+"存在");
		System.out.println(uploadPath);
	}
}




