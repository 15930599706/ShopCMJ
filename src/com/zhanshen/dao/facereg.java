package com.zhanshen.dao;

import com.baidu.ai.aip.utils.HttpUtil;
import com.baidu.ai.aip.utils.Base64Util;
import com.baidu.ai.aip.utils.FileUtil;
import com.baidu.ai.aip.utils.GsonUtils;
import com.baidu.aip.*;
import com.google.gson.Gson;

import java.util.*;

//import org.json.*;
//import net.sf.json;
import net.sf.json.*;
/**
* �����Ա�
*/
public class facereg {

    /**
    * ��Ҫ��ʾ���������蹤����
    * FileUtil,Base64Util,HttpUtil,GsonUtils���
    * https://ai.baidu.com/file/658A35ABAB2D404FBF903F64D47C1F72
    * https://ai.baidu.com/file/C8D81F3301E24D2892968F09AE1AD6E2
    * https://ai.baidu.com/file/544D677F5D4E4F17B4122FBD60DB82B3
    * https://ai.baidu.com/file/470B3ACCA3FE43788B5A963BF0B625F3
    * ����
    */
    public static String match(String idpic,String livepic) {
        // ����url
        String url = "https://aip.baidubce.com/rest/2.0/face/v3/match";
        String judge="error404";
        try {

            byte[] bytes1 = FileUtil.readFileByBytes(idpic);
            byte[] bytes2 = FileUtil.readFileByBytes(livepic);
            String image1 = Base64Util.encode(bytes1);
            String image2 = Base64Util.encode(bytes2);

            List<Map<String, Object>> images = new ArrayList<>();

            Map<String, Object> map1 = new HashMap<>();
            map1.put("image", image1);
            map1.put("image_type", "BASE64");
            map1.put("face_type", "CERT");
            map1.put("quality_control", "LOW");
            map1.put("liveness_control", "NONE");

            Map<String, Object> map2 = new HashMap<>();
            map2.put("image", image2);
            map2.put("image_type", "BASE64");
            map2.put("face_type", "LIVE");
            map2.put("quality_control", "LOW");
            map2.put("liveness_control", "NONE");

            images.add(map1);
            images.add(map2);

            String param = GsonUtils.toJson(images);

            // ע�������Ϊ�˼򻯱���ÿһ������ȥ��ȡaccess_token�����ϻ���access_token�й���ʱ�䣬 �ͻ��˿����л��棬���ں����»�ȡ��
            AuthService as=new AuthService();
            String accessToken =as.getAuth();
           
            String result = HttpUtil.post(url, accessToken, "application/json", param);
            //�ַ���תlist<String>
            Gson gson = new Gson();
            Map<String, Object> map = new HashMap<String, Object>();
            map = gson.fromJson(result, map.getClass());
//            Map m = new HashMap(); 
//            for(Object o : map.keySet()){ 
//                map.get(o); 
//                System.out.println(map.get(o).toString());
//            } 
            String goodsid=map.get("result").toString();
            Map<String, Object> map21 = new HashMap<String, Object>();
            map21 = gson.fromJson(goodsid, map.getClass());
          //  int score =  Double.valueOf(map21.get("score").toString());
            double score=Double.valueOf(map21.get("score").toString());
            System.out.println(score);
            if(score>90.0) {
            	judge="true";
            }
            //return judge;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return judge;
    }

//    public static void main(String[] args) {
//    	System.out.println("1");
//    	System.out.println( facereg.match("f:\\0.jpg","f:\\1.jpg"));
//       
//    }
}