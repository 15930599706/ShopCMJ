package com.zhanshen.dao;

import org.json.JSONObject;
import com.baidu.aip.speech.AipSpeech;
import com.baidu.aip.util.Util;

public class audioTest {
    //设置APPID/AK/SK
    public static final String APP_ID = "16613080";
    public static final String API_KEY = "ATelXBteFwUaTNRk9LPBAwLV";
    public static final String SECRET_KEY = "xe5a8qetjxqNv454iWfBztMIK5GpdHXG";
	public  String running(String path) {
		 // 初始化一个AipSpeech
		System.out.println("init");
        AipSpeech client = new AipSpeech(APP_ID, API_KEY, SECRET_KEY);
       try {
    	System.out.println(path);   
        //对本地语音文件进行识别
        //String path = "Z:\\Web\\ye.wav";
        JSONObject asrRes = client.asr(path, "wav", 8000, null);
        System.out.println(asrRes);
        String result=asrRes.get("result").toString();
        System.out.println(result);
        System.out.println("end");
        //return result;
//        对语音二进制数据进行识别
//        byte[] data = Util.readFileByBytes(path);     //readFileByBytes仅为获取二进制数据示例
//        JSONObject asrRes2 = client.asr(data, "pcm", 16000, null);
//        System.out.println(asrRes2);
        if(!result.equals(null)) {
        	return result;
        }
       }
       catch(Exception e) {
    	   
       }
       return "error404";
	 }
}

 