package com.community.dogapi;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.XML;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;

public class DogDataFetcher {

    private static final String SERVICE_KEY = "OB8zOGGA8DZ14ANXcPMlZsCphr1KZg8aa4FPrn9NtyB%2Bx%2BWpxZdh1DDM79htVufnJ%2FYg6KgKkVS%2BvqnUXIsyXw%3D%3D";
    private static final String BASE_API_URL = "http://apis.data.go.kr/1543061/abandonmentPublicSrvc/abandonmentPublic";
    private static final int MAX_RETRIES = 3;  // Max retry attempts
    private static final int RETRY_DELAY_MS = 2000;  // Delay between retries in milliseconds

    public ArrayList<HashMap<String, String>> fetchData(String bgnde, String endde) throws Exception {
        int attempt = 0;
        boolean success = false;
        ArrayList<HashMap<String, String>> list = new ArrayList<>();

        while (attempt < MAX_RETRIES && !success) {
            try {
                list = fetchDataFromAPI(bgnde, endde);
                success = true;
            } catch (Exception e) {
                attempt++;
                System.out.println("Attempt " + attempt + " failed: " + e.getMessage());

                if (attempt < MAX_RETRIES) {
                    Thread.sleep(RETRY_DELAY_MS);
                } else {
                    System.out.println("Max retries reached. Unable to fetch data from the API.");
                    throw e;  // Throw exception if max retries are reached
                }
            }
        }
        return list;
    }

    private ArrayList<HashMap<String, String>> fetchDataFromAPI(String bgnde, String endde) throws Exception {
        String apiURL = BASE_API_URL + "?serviceKey=" + SERVICE_KEY + "&bgnde=" + bgnde + "&endde=" + endde + "&_type=xml";

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

        return parseXMLData(sb.toString());
    }

    private ArrayList<HashMap<String, String>> parseXMLData(String xmlData) {
        ArrayList<HashMap<String, String>> list = new ArrayList<>();

        try {
            JSONObject jsonObject = XML.toJSONObject(xmlData);
            JSONObject response = jsonObject.getJSONObject("response");
            JSONObject body = response.getJSONObject("body");
            JSONObject items = body.getJSONObject("items");

            if (items.has("item")) {
                Object itemObj = items.get("item");

                if (itemObj instanceof JSONArray) {
                    JSONArray itemArray = (JSONArray) itemObj;

                    for (int i = 0; i < itemArray.length(); i++) {
                        JSONObject item = itemArray.getJSONObject(i);
                        list.add(convertItemToMap(item));
                    }
                } else if (itemObj instanceof JSONObject) {
                    JSONObject item = (JSONObject) itemObj;
                    list.add(convertItemToMap(item));
                }
            } else {
                System.out.println("조회 결과가 없습니다.");
            }

        } catch (JSONException e) {
            e.printStackTrace();
        }
        return list;
    }

    private HashMap<String, String> convertItemToMap(JSONObject item) {
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
        return map;
    }
}