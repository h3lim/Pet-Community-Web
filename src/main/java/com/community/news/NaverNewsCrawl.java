package com.community.news;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class NaverNewsCrawl {
	private static final int REQUEST_DELAY = 1000; // 1초 지연
	private static final long CACHE_EXPIRY = 60000; // 캐시 만료 시간 (60초)
	private static final Map<String, CacheEntry> cache = new ConcurrentHashMap<>(); // 캐시 관리

	public ArrayList<NewsVO> getNaverNews() {
		String url = "https://search.naver.com/search.naver?ssc=tab.news.all&where=news&sm=tab_jum&query=%EB%B0%98%EB%A0%A4%EA%B2%AC";

		// 캐시 확인 후 재활용 가능 여부 검토
		if (cache.containsKey(url) && !cache.get(url).isExpired()) {
			return cache.get(url).getData();
		}

		Document doc = null;
		ArrayList<NewsVO> list = new ArrayList<>();

		try {
			// API 호출 시 Rate Limit 대응을 위한 지연
			Thread.sleep(REQUEST_DELAY);

			// URL 연결 및 데이터 파싱
			doc = Jsoup.connect(url).get();
			Elements liList = doc.select("#main_pack > section.sc_new.sp_nnews._fe_news_collection._prs_nws > div.api_subject_bx > div.group_news > ul > li");

			for (Element li : liList) {
				String href = li.select("li > div > div > div.news_contents > a").attr("href");
				String img = li.select("li > div > div > div.news_contents > a.dsc_thumb > img").attr("data-lazysrc");
				String title = li.select("a.news_tit").attr("title");
				String ref = li.select("div.news_info > div.info_group > a.info.press ").text();
				String detail = li.select("li > div > div > div.news_contents > div > div > a").text();
				String regdate = li.select("div.news_wrap.api_ani_send > div > div.news_info > div.info_group > span").text();

				// 기본 이미지 설정
				if (img == null || img.isEmpty()) {
					img = "assets/img/logo/logo.jpg";
				}

				NewsVO nvo = new NewsVO();
				nvo.setHref(href);
				nvo.setImg(img);
				nvo.setTitle(title);
				nvo.setRef(ref);
				nvo.setDetail(detail);
				nvo.setRegdate(regdate);

				list.add(nvo);
			}

			// 결과를 캐시에 저장
			cache.put(url, new CacheEntry(list));

		} catch (IOException e) {
			e.printStackTrace();
		} catch (InterruptedException e) {
			Thread.currentThread().interrupt();
			System.out.println("Thread was interrupted, failed to complete operation");
		}

		return list;
	}

	// 캐시 엔트리 관리 클래스
	private static class CacheEntry {
		private final long timestamp;
		private final ArrayList<NewsVO> data;

		public CacheEntry(ArrayList<NewsVO> data) {
			this.timestamp = System.currentTimeMillis();
			this.data = data;
		}

		public boolean isExpired() {
			return System.currentTimeMillis() - timestamp > CACHE_EXPIRY;
		}

		public ArrayList<NewsVO> getData() {
			return data;
		}
	}
}
