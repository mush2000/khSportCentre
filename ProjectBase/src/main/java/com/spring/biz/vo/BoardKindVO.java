package com.spring.biz.vo;

public class BoardKindVO {
	String kindName;
	int kindCode;
	int writeAuthority;
	int replyAuthority;
	
	
	public String getKindName() {
		return kindName;
	}
	public void setKindName(String kindName) {
		this.kindName = kindName;
	}
	public int getKindCode() {
		return kindCode;
	}
	public void setKindCode(int kindCode) {
		this.kindCode = kindCode;
	}
	public int getWriteAuthority() {
		return writeAuthority;
	}
	public void setWriteAuthority(int writeAuthority) {
		this.writeAuthority = writeAuthority;
	}
	public int getReplyAuthority() {
		return replyAuthority;
	}
	public void setReplyAuthority(int replyAuthority) {
		this.replyAuthority = replyAuthority;
	}
	@Override
	public String toString() {
		return "BoardKindVO [kindName=" + kindName + ", kindCode=" + kindCode + ", writeAuthority=" + writeAuthority
				+ ", replyAuthority=" + replyAuthority + "]";
	}
	
	
	
	
}
