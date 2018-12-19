package kr.co.opensise.admin.manage.notice.model;

public class PageVo {
	private int page;
	private int pageSize;
	private String post_brd;
	private String search;
	
	public String getNotice_id() {
		return post_brd;
	}
	public void setNotice_id(String notice_id) {
		this.post_brd = notice_id;
	}
	
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
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
	@Override
	public String toString() {
		return "PageVo [page=" + page + ", pageSize=" + pageSize + ", post_brd=" + post_brd + ", search=" + search
				+ "]";
	}
	
	
}
