package com.spring.biz.vo;

public class ClassPlaceVO {
	private int placeCode;
    private String placeName;
    private int rentalAlltimeCharge;
    private int rentalHalftimeCharge;
    private String available;
    private int frontPlaceCode;
    
	
	public int getFrontPlaceCode() {
		return frontPlaceCode;
	}
	public void setFrontPlaceCode(int frontPlaceCode) {
		this.frontPlaceCode = frontPlaceCode;
	}
	public int getPlaceCode() {
		return placeCode;
	}
	public void setPlaceCode(int placeCode) {
		this.placeCode = placeCode;
	}
	public String getPlaceName() {
		return placeName;
	}
	public void setPlaceName(String placeName) {
		this.placeName = placeName;
	}
	public int getRentalAlltimeCharge() {
		return rentalAlltimeCharge;
	}
	public void setRentalAlltimeCharge(int rentalAlltimeCharge) {
		this.rentalAlltimeCharge = rentalAlltimeCharge;
	}
	public int getRentalHalftimeCharge() {
		return rentalHalftimeCharge;
	}
	public void setRentalHalftimeCharge(int rentalHalftimeCharge) {
		this.rentalHalftimeCharge = rentalHalftimeCharge;
	}
	public String getAvailable() {
		return available;
	}
	public void setAvailable(String available) {
		this.available = available;
	}
	@Override
	public String toString() {
		return "ClassPlaceVO [placeCode=" + placeCode + ", placeName=" + placeName + ", rentalAlltimeCharge="
				+ rentalAlltimeCharge + ", rentalHalftimeCharge=" + rentalHalftimeCharge + ", available=" + available
				+ ", frontPlaceCode=" + frontPlaceCode + "]";
	}
	
  
    
    
}   