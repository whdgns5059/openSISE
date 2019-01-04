package kr.co.opensise.admin.manage.member.model;
	
public class PageVO {
	
	private int page;
	private int pageSize;
	private int favor_mem;
	
	
	public int getPage() {
		return page;
	}
	
	
	public int getFavor_mem() {
		return favor_mem;
	}


	public void setFavor_mem(int favor_mem) {
		this.favor_mem = favor_mem;
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
	
}
