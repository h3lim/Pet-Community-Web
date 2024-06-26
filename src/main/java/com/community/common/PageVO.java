package com.community.common;




//사용자가 선택하는 페이지의 전반적인 정보를 담아놓을 클래스
public class PageVO {



	private int page; //사용자가 선택한 페이지의 번호
	private int cpp;  //한 화면에 보여질 게시물의 개수



	public PageVO() {
		//PageVO가 생성될 떄 기본값을 생성해 줄 것이다.
		//왜? 처음 게시판에 들어올 떄는 페이지에 대한 정보가 전달되지 않기 때문에.
		page = 1; //객체가 생성될 떄 page = 1
		cpp = 10; //객체가 생성될 떄 cpp = 10;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getCpp() {
		return cpp;
	}

	public void setCpp(int cpp) {
		this.cpp = cpp;
	}





	@Override
	public String toString() {
		return "PageVO [page=" + page + ", cpp=" + cpp + "]";
	}



}
