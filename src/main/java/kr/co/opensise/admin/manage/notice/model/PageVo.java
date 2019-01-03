package kr.co.opensise.admin.manage.notice.model;

public class PageVo {
	private int page;
	private int pageSize;
	private String post_brd;
	private String searchNm;
	private String selBox;
	
	private int rnum;

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public String getPost_brd() {
		return post_brd;
	}

	public void setPost_brd(String post_brd) {
		this.post_brd = post_brd;
	}

	public String getSearchNm() {
		return searchNm;
	}

	public void setSearchNm(String searchNm) {
		this.searchNm = searchNm;
	}

	public String getSelBox() {
		return selBox;
	}

	public void setSelBox(String selBox) {
		this.selBox = selBox;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	@Override
	public String toString() {
		return "PageVo [page=" + page + ", pageSize=" + pageSize + ", post_brd=" + post_brd + ", searchNm=" + searchNm
				+ ", selBox=" + selBox + ", rnum=" + rnum + "]";
	}
	
	
	
}
