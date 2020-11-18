package com.spring.biz.vo;

public class SearchVO {
	private String searchWord;
	private String searchKeyword;
	private String searchValue;
	private String fromDate;
	private String toDate;
	private String rentalApprovalYN;
	
	public String getSearchWord() {
		return searchWord;
	}
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	public String getSearchValue() {
		return searchValue;
	}
	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}
	public String getFromDate() {
		return fromDate;
	}
	public void setFromDate(String fromDate) {
		this.fromDate = fromDate;
	}
	public String getToDate() {
		return toDate;
	}
	public void setToDate(String toDate) {
		this.toDate = toDate;
	}
	public String getRentalApprovalYN() {
		return rentalApprovalYN;
	}
	public void setRentalApprovalYN(String rentalApprovalYN) {
		this.rentalApprovalYN = rentalApprovalYN;
	}
	@Override
	public String toString() {
		return "SearchVO [searchWord=" + searchWord + ", searchKeyword=" + searchKeyword + ", searchValue="
				+ searchValue + ", fromDate=" + fromDate + ", toDate=" + toDate + ", rentalApprovalYN="
				+ rentalApprovalYN + "]";
	}
	
	


	
	
}
