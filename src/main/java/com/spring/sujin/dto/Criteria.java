package com.spring.sujin.dto;

public class Criteria {
	  private int page;
	    private int perPageNum;
//	    private int PageStart;

	    public Criteria() {
	        this.page = 1;
	        this.perPageNum = 10;
	    }

	    public void setPage(int page) {

	        if (page <= 0) {
	            this.page = 1;
	            return;
	        }

	        this.page = page;
	    }

	    @Override
		public String toString() {
			return "Criteria [page=" + page + ", perPageNum=" + perPageNum + "]";
		}

		public int getPage() {
	        return page;
	    }

	    public void setPerPageNum(int perPageNum) {

	        if (perPageNum <= 0 || perPageNum > 100) {
	            this.perPageNum = 10;
	            return;
	        }

	        this.perPageNum = perPageNum;
	    }

	    public int getPerPageNum() {
	        return this.perPageNum;
	    }

	    public int getPageStart() {
	        return (this.page - 1) * perPageNum;
	    }

//		public void setPageStart(int pageStart) {
//			PageStart = pageStart;
//		}

}
