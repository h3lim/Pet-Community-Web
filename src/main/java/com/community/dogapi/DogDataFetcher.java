package com.community.dogapi;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.XML;
// import org.w3c.dom.Element;
// import org.w3c.dom.NodeList;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;

public class DogDataFetcher {
    public ArrayList<HashMap<String, String>> fetchData(String bgnde, String endde) throws Exception {
        // 인증키
        String serviceKey = "OB8zOGGA8DZ14ANXcPMlZsCphr1KZg8aa4FPrn9NtyB%2Bx%2BWpxZdh1DDM79htVufnJ%2FYg6KgKkVS%2BvqnUXIsyXw%3D%3D";

        // API 호출을 위한 URL 생성
        String apiURL = "http://apis.data.go.kr/1543061/abandonmentPublicSrvc/abandonmentPublic"
                + "?serviceKey=" + serviceKey
                + "&bgnde=" + bgnde
                + "&endde=" + endde
                + "&_type=xml"; // JSON 대신 XML 요청

        // API 요청 및 응답 데이터 수신
        URL url = new URL(apiURL);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");

        BufferedReader rd;
        if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }

        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();

        // XML 파싱
        ArrayList<HashMap<String, String>> list = new ArrayList<>();
        try {
            JSONObject jsonObject = XML.toJSONObject(sb.toString()); // 주어진 XML을 JSONObject로 변환

            JSONObject response = jsonObject.getJSONObject("response"); // 최상위 요소인 "response"를 가져옴
            JSONObject body = response.getJSONObject("body"); // "body"를 가져옴
            JSONObject items = body.getJSONObject("items"); // "items"를 가져옴

            // "item" 키가 존재하는지 확인
            if (items.has("item")) {
                Object itemObj = items.get("item");

                if (itemObj instanceof JSONArray) {
                    JSONArray itemArray = (JSONArray) itemObj; // "item"들을 배열로 가져옴

                    for (int i = 0; i < itemArray.length(); i++) {
                        JSONObject item = itemArray.getJSONObject(i);
                        HashMap<String, String> map = new HashMap<>();
                        map.put("desertionNo", String.valueOf(item.getLong("desertionNo")));
                        map.put("filename", item.getString("filename"));
                        map.put("happenDt", String.valueOf(item.getInt("happenDt")));
                        map.put("happenPlace", item.getString("happenPlace"));
                        map.put("kindCd", item.getString("kindCd"));
                        map.put("colorCd", item.getString("colorCd"));
                        map.put("age", item.getString("age"));
                        map.put("weight", item.getString("weight"));
                        map.put("noticeNo", item.getString("noticeNo"));
                        map.put("noticeSdt", String.valueOf(item.getInt("noticeSdt")));
                        map.put("noticeEdt", String.valueOf(item.getInt("noticeEdt")));
                        map.put("popfile", item.getString("popfile"));
                        map.put("processState", item.getString("processState"));
                        map.put("sexCd", item.getString("sexCd"));
                        map.put("neuterYn", item.getString("neuterYn"));
                        map.put("specialMark", item.getString("specialMark"));
                        map.put("careNm", item.getString("careNm"));
                        map.put("careTel", item.getString("careTel"));
                        map.put("careAddr", item.getString("careAddr"));
                        map.put("orgNm", item.getString("orgNm"));
                        map.put("chargeNm", item.getString("chargeNm"));
                        map.put("officetel", item.getString("officetel"));
                        list.add(map);
                    }
                } else if (itemObj instanceof JSONObject) {
                    JSONObject item = (JSONObject) itemObj;
                    HashMap<String, String> map = new HashMap<>();
                    map.put("desertionNo", String.valueOf(item.getLong("desertionNo")));
                    map.put("filename", item.getString("filename"));
                    map.put("happenDt", String.valueOf(item.getInt("happenDt")));
                    map.put("happenPlace", item.getString("happenPlace"));
                    map.put("kindCd", item.getString("kindCd"));
                    map.put("colorCd", item.getString("colorCd"));
                    map.put("age", item.getString("age"));
                    map.put("weight", item.getString("weight"));
                    map.put("noticeNo", item.getString("noticeNo"));
                    map.put("noticeSdt", String.valueOf(item.getInt("noticeSdt")));
                    map.put("noticeEdt", String.valueOf(item.getInt("noticeEdt")));
                    map.put("popfile", item.getString("popfile"));
                    map.put("processState", item.getString("processState"));
                    map.put("sexCd", item.getString("sexCd"));
                    map.put("neuterYn", item.getString("neuterYn"));
                    map.put("specialMark", item.getString("specialMark"));
                    map.put("careNm", item.getString("careNm"));
                    map.put("careTel", item.getString("careTel"));
                    map.put("careAddr", item.getString("careAddr"));
                    map.put("orgNm", item.getString("orgNm"));
                    map.put("chargeNm", item.getString("chargeNm"));
                    map.put("officetel", item.getString("officetel"));
                    list.add(map);
                }
            } else {
                // "item" 키가 없을 경우, 조회 결과가 없음
                System.out.println("조회 결과가 없습니다.");
            }

        } catch (JSONException e) {
            e.printStackTrace();
        }

        return list;
    }
}