package com.spring.biz.vo;

public class ReplyVO {
	int replyNum;
	int replyBoardNum;
	String replyMemberId;
	String replyContent;
	String replyCreateDate;
	String replyIsSecret;
	public int getReplyNum() {
		return replyNum;
	}
	public void setReplyNum(int replyNum) {
		this.replyNum = replyNum;
	}
	public int getReplyBoardNum() {
		return replyBoardNum;
	}
	public void setReplyBoardNum(int replyBoardNum) {
		this.replyBoardNum = replyBoardNum;
	}
	public String getReplyMemberId() {
		return replyMemberId;
	}
	public void setReplyMemberId(String replyMemberId) {
		this.replyMemberId = replyMemberId;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public String getReplyCreateDate() {
		return replyCreateDate;
	}
	public void setReplyCreateDate(String replyCreateDate) {
		this.replyCreateDate = replyCreateDate;
	}
	public String getReplyIsSecret() {
		return replyIsSecret;
	}
	public void setReplyIsSecret(String replyIsSecret) {
		this.replyIsSecret = replyIsSecret;
	}
	@Override
	public String toString() {
		return "ReplyVO [replyNum=" + replyNum + ", replyBoardNum=" + replyBoardNum + ", replyMemberId=" + replyMemberId
				+ ", replyContent=" + replyContent + ", replyCreateDate=" + replyCreateDate + ", replyIsSecret="
				+ replyIsSecret + "]";
	}
	
	
	
	
	
}