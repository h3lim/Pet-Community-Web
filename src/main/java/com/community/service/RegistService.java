package com.community.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.community.board.BoardDAO;

public class RegistService implements IBoardService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		
		String writer = request.getParameter("bWriter");
		String title = request.getParameter("bTitle");
		String content = request.getParameter("bContent");
		
//		//데이터가 정상적으로 들어오는지 확인
//		System.out.println("작성자: " + writer);
//	    System.out.println("제목: " + title);
//	    System.out.println("내용: " + content);
		
		BoardDAO.getInstance().regist(writer, title, content);

		
		
		
	}
}
