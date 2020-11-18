package com.spring.biz.vo;

import java.util.List;

public class RentalPlaceVO {
	private String rentalCode;
	private List<String> rentalCodeList; 
	private int placeCode;
	private int rentalPlaceCode;
	private String rentalDate;
	private String rentalTime;
	private String placeName;
	private String rentalMemberId;
	private String rentalMemberName;
	private String rentalApprovalYN;
	
	public String getRentalCode() {
		return rentalCode;
	}
	public void setRentalCode(String rentalCode) {
		this.rentalCode = rentalCode;
	}
	public List<String> getRentalCodeList() {
		return rentalCodeList;
	}
	public void setRentalCodeList(List<String> rentalCodeList) {
		this.rentalCodeList = rentalCodeList;
	}
	public int getPlaceCode() {
		return placeCode;
	}
	public void setPlaceCode(int placeCode) {
		this.placeCode = placeCode;
	}
	public int getRentalPlaceCode() {
		return rentalPlaceCode;
	}
	public void setRentalPlaceCode(int rentalPlaceCode) {
		this.rentalPlaceCode = rentalPlaceCode;
	}
	public String getRentalDate() {
		return rentalDate;
	}
	public void setRentalDate(String rentalDate) {
		this.rentalDate = rentalDate;
	}
	public String getRentalTime() {
		return rentalTime;
	}
	public void setRentalTime(String rentalTime) {
		this.rentalTime = rentalTime;
	}
	public String getPlaceName() {
		return placeName;
	}
	public void setPlaceName(String placeName) {
		this.placeName = placeName;
	}
	public String getRentalMemberId() {
		return rentalMemberId;
	}
	public void setRentalMemberId(String rentalMemberId) {
		this.rentalMemberId = rentalMemberId;
	}
	public String getRentalMemberName() {
		return rentalMemberName;
	}
	public void setRentalMemberName(String rentalMemberName) {
		this.rentalMemberName = rentalMemberName;
	}
	public String getRentalApprovalYN() {
		return rentalApprovalYN;
	}
	public void setRentalApprovalYN(String rentalApprovalYN) {
		this.rentalApprovalYN = rentalApprovalYN;
	}
	@Override
	public String toString() {
		return "RentalPlaceVO [rentalCode=" + rentalCode + ", rentalCodeList=" + rentalCodeList + ", placeCode="
				+ placeCode + ", rentalPlaceCode=" + rentalPlaceCode + ", rentalDate=" + rentalDate + ", rentalTime="
				+ rentalTime + ", placeName=" + placeName + ", rentalMemberId=" + rentalMemberId + ", rentalMemberName="
				+ rentalMemberName + ", rentalApprovalYN=" + rentalApprovalYN + "]";
	}
	
	
}
