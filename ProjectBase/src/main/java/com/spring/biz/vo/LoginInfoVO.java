package com.spring.biz.vo;

public class LoginInfoVO {
	private String memberId;
	private String memberName;
	private int instNum;
	private int wrongPwCnt;
	private boolean wrongId;
	private int authority;
	
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public int getInstNum() {
		return instNum;
	}
	public void setInstNum(int instNum) {
		this.instNum = instNum;
	}
	public int getWrongPwCnt() {
		return wrongPwCnt;
	}
	public void setWrongPwCnt(int wrongPwCnt) {
		this.wrongPwCnt = wrongPwCnt;
	}
	public boolean isWrongId() {
		return wrongId;
	}
	public void setWrongId(boolean wrongId) {
		this.wrongId = wrongId;
	}
	public int getAuthority() {
		return authority;
	}
	public void setAuthority(int authority) {
		this.authority = authority;
	}
	
	
	
	@Override
	public String toString() {
		return "LoginInfoVO [memberId=" + memberId + ", memberName=" + memberName + ", instNum=" + instNum
				+ ", wrongPwCnt=" + wrongPwCnt + ", wrongId=" + wrongId + ", authority=" + authority + "]";
	}

	
	
	
}
