package cn.edu.sanyautqc.ssc.utils;

import java.io.IOException;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import com.alibaba.fastjson.parser.Feature;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class JsonUtil
{
  public static String toJSONString(int total, List rows)
  {
    Map jsonMap = new HashMap();
    jsonMap.put("total", Integer.valueOf(total));
    jsonMap.put("rows", rows);

    JSONObject jsonObj = JSONObject.fromObject(jsonMap);
    String result = jsonObj.toString();

    return result;
  }

  public static String toJSONString(List rows)
  {
    JSONArray jsonArray = JSONArray.fromObject(rows);
    String result = jsonArray.toString();

    return result;
  }

  public static String toJSONString(Object obj)
  {
    new JSONObject(); return JSONObject.fromObject(obj).toString();
  }

  public static String toJSONStringByFastjson(int total, List rows)
  {
    Map jsonMap = new HashMap();
    jsonMap.put("total", Integer.valueOf(total));
    jsonMap.put("rows", rows);

    String result = JSON.toJSONString(jsonMap);

    return result;
  }
  
  public static String toJSONStringByFastjson(long total, List rows)
  {
    Map jsonMap = new HashMap();
    jsonMap.put("total", Long.valueOf(total));
    jsonMap.put("rows", rows);

    String result = JSON.toJSONString(jsonMap);

    return result;
  }
  
  public static Map<String,Object> toJsonMap(long total, List rows)
  {
	Map<String,Object> jsonMap = new HashMap<String,Object>();
    jsonMap.put("total", Long.valueOf(total));
    jsonMap.put("rows", rows);
    return jsonMap;
  }

  public static String toJSONStringByFastjson(List rows)
  {
    String result = JSON.toJSONString(rows, new SerializerFeature[] { SerializerFeature.DisableCircularReferenceDetect });

    return result;
  }

  public static String toJSONStringByFastjson(Object obj)
  {
    String result = JSON.toJSONString(obj, new SerializerFeature[] { SerializerFeature.DisableCircularReferenceDetect });
    return result;
  }

  public static Object toBeanByFastjson(String json)
  {
    Object o = JSON.parseObject(json, new TypeReference()
    {
    }
    , new Feature[0]);
    return o;
  }

  public static Object toBeanByFastjson(String json, TypeReference typeRef)
  {
    Object o = JSON.parseObject(json, typeRef, new Feature[0]);
    return o;
  }

  public static String toJSONStringByJackson(int total, List rows)
  {
    long startTime = System.nanoTime();
    ObjectMapper objectMapper = new ObjectMapper();
    Map jsonMap = new HashMap();
    jsonMap.put("total", Integer.valueOf(total));
    jsonMap.put("rows", rows);
    String result = "";
    try
    {
      StringWriter sw = new StringWriter();
      JsonGenerator gen = objectMapper.getJsonFactory().createJsonGenerator(sw);
      objectMapper.writeValue(gen, jsonMap);
      gen.close();
      result = sw.toString();
    }
    catch (IOException e) {
      e.printStackTrace();
    }
    long consumingTime = System.nanoTime() - startTime;
    System.out.println("Jackson��ʱ:" + consumingTime / 1000L + "΢��");
    return result;
  }

  public static String toJSONStringByGson(int total, List rows)
  {
    long startTime = System.nanoTime();
    String result = "";
    Map jsonMap = new HashMap();
    jsonMap.put("total", Integer.valueOf(total));
    jsonMap.put("rows", rows);
    Gson gson = new Gson();
    result = gson.toJson(jsonMap);
    long consumingTime = System.nanoTime() - startTime;
    System.out.println("Gson��ʱ:" + consumingTime / 1000L + "΢��");
    return result;
  }

  public static String toTreeGridJSONString(List rows, String pIdName, String toppId)
    throws Exception
  {
    List list = new ArrayList();
    for (int i = 0; i < rows.size(); i++) {
      Map map = BeanUtils.describe(rows.get(i));
      if (!map.get(pIdName).equals(toppId)) {
        map.put("_parentId", map.get(pIdName));
      }
      else {
        map.put("_parentId", "");
      }
      list.add(map);
    }
    String treeNode = toJSONStringByFastjson(list.size(), list);
    return treeNode;
  }

  public static String toTreeGridJSONString2(List rows, String idName, String pIdName)
    throws Exception
  {
    List list = new ArrayList();
    for (int i = 0; i < rows.size(); i++) {
      Map map = BeanUtils.describe(rows.get(i));
      list.add(map);
    }

    List list2 = new ArrayList();
    for (int j = 0; j < list.size(); j++) {
      boolean flag = false;
      Map m1 = (Map)list.get(j);
      for (int k = 0; k < list.size(); k++) {
        Map m2 = (Map)list.get(k);
        if (!String.valueOf(m1.get(pIdName)).equals(String.valueOf(m2.get(idName))))
          continue;
        flag = true;
        m1.put("_parentId", m1.get(pIdName));
        break;
      }

      if (!flag) {
        m1.put("_parentId", "");
      }
    }
    String treeNode = toJSONStringByFastjson(list.size(), list);
    return treeNode;
  }

  public static String toTreeJSONString(List rows, String idName, String pIdName, String displayName)
    throws Exception
  {
    List list1 = new ArrayList();
    for (int i = 0; i < rows.size(); i++) {
      Map map = BeanUtils.describe(rows.get(i));
      map.put("id", map.get(idName));
      map.put("text", map.get(displayName));
      map.put("children", new ArrayList());
      Map temp = new HashMap();
      temp.put(idName, map.get(idName));
      temp.put(pIdName, map.get(pIdName));
      map.put("attributes", temp);

      list1.add(map);
    }
    for (int j = 0; j < list1.size(); j++) {
      Map m1 = (Map)list1.get(j);
      for (int k = 0; k < list1.size(); k++) {
        Map m2 = (Map)list1.get(k);
        if (String.valueOf(m2.get(pIdName)).equals(String.valueOf(m1.get(idName)))) {
          List l = (List)m1.get("children");
          l.add(m2);
          m1.put("children", l);
        }
      }
    }

    List list2 = new ArrayList();
    for (int m = 0; m < list1.size(); m++) {
      Map m1 = (Map)list1.get(m);
      if (((List)m1.get("children")).size() > 0) {
        list2.add(m1);
      }
    }
    List list3 = new ArrayList();
    for (int n = 0; n < list1.size(); n++) {
      boolean hasparent = false;
      Map m3 = (Map)list1.get(n);
      for (int s = 0; s < list2.size(); s++) {
        Map m4 = (Map)list2.get(s);
        if (String.valueOf(m3.get(pIdName)).equals(String.valueOf(m4.get(idName)))) {
          hasparent = true;
          break;
        }
      }

      if (!hasparent) {
        Map temp = new HashMap();
        temp.put(idName, m3.get(idName));
        temp.put(pIdName, m3.get(pIdName));
        m3.put("attributes", temp);
        m3.put("id", m3.get(idName));
        list3.add(m3);
      }
    }

    List list4 = new ArrayList();
    for (int t = 0; t < list3.size(); t++) {
      Map temp = (Map)list3.get(t);
      temp.remove(idName);
      temp.remove(pIdName);
      list4.add(temp);
    }

    return toJSONStringByFastjson(list4);
  }
  
  /**
	 * 返回Treegrid header,body,footer三部分
	 * @param list body 列表
	 * @param id 编号
	 * @param pid 上级编号
	 * @param footerList 底部list
	 * @return StringBuffer 封装的Treegrid header,body,footer三部分
	 * @see StringBuffer
	 * @see List
	 * @see Exception
	 * @throws Exception
	 */
	public static StringBuffer toTreeGridJSONString(List list, String id, String pid,List footerList) throws Exception{
		String treegridJson = "";
		if(list!=null)
		treegridJson = JsonUtil.toTreeGridJSONString2(list, id, pid);
		
		StringBuffer json = new StringBuffer(treegridJson);
		
		json.insert(json.length()-1, ",\"footer\":"+JsonUtil.toJSONStringByFastjson(footerList));
		
		return json;
				
	}
}