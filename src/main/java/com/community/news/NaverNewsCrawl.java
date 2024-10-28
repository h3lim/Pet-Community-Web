package com.community.news;

import java.io.IOException;
import java.util.ArrayList;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class NaverNewsCrawl {
	private static final int REQUEST_DELAY = 1000; // 1000 milliseconds = 1 second delay between requests

	public ArrayList<NewsVO> getNaverNews() {
		String url = "https://search.naver.com/search.naver?ssc=tab.news.all&where=news&sm=tab_jum&query=%EB%B0%98%EB%A0%A4%EA%B2%AC";
		Document doc = null;
		ArrayList<NewsVO> list = new ArrayList<NewsVO>();

		try {
			// Delay to handle rate limit
			Thread.sleep(REQUEST_DELAY);

			// Connect to the URL and parse content
			doc = Jsoup.connect(url).get();
			Elements liList = doc.select("#main_pack > section.sc_new.sp_nnews._fe_news_collection._prs_nws > div.api_subject_bx > div.group_news > ul > li");

			for (Element li : liList) {
				String href = li.select("li > div > div > div.news_contents > a").attr("href");
				String img = li.select("li > div > div > div.news_contents > a.dsc_thumb > img").attr("data-lazysrc");
				String title = li.select("a.news_tit").attr("title");
				String ref = li.select("div.news_info > div.info_group > a.info.press ").text();
				String detail = li.select("li > div > div > div.news_contents > div > div > a").text();
				String regdate = li.select("div.news_wrap.api_ani_send > div > div.news_info > div.info_group > span").text();

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
		} catch (IOException e) {
			e.printStackTrace();
		} catch (InterruptedException e) {
			Thread.currentThread().interrupt();
			System.out.println("Thread was interrupted, failed to complete operation");
		}

		return list;
	}
}