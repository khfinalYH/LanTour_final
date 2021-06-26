package com.lan.tour.model.dto;

import java.util.Date;

public class CommentDto {

	private int comment_no;
	private int member_no;
	private int community_no;
	private String comment_title;
	private String comment_content;
	private Date comment_date;
	private String comment_delflag;

	public CommentDto() {

	}

	public CommentDto(int comment_no, int member_no, int community_no, String comment_title, String comment_content,
			Date comment_date, String comment_delflag) {
		this.comment_no = comment_no;
		this.member_no = member_no;
		this.community_no = community_no;
		this.comment_title = comment_title;
		this.comment_content = comment_content;
		this.comment_date = comment_date;
		this.comment_delflag = comment_delflag;
	}

	public String getComment_delflag() {
		return comment_delflag;
	}

	public void setComment_delflag(String comment_delflag) {
		this.comment_delflag = comment_delflag;
	}

	public int getComment_no() {
		return comment_no;
	}

	public void setComment_no(int comment_no) {
		this.comment_no = comment_no;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public int getCommunity_no() {
		return community_no;
	}

	public void setCommunity_no(int community_no) {
		this.community_no = community_no;
	}

	public String getComment_title() {
		return comment_title;
	}

	public void setComment_title(String comment_title) {
		this.comment_title = comment_title;
	}

	public String getComment_content() {
		return comment_content;
	}

	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}

	public Date getComment_date() {
		return comment_date;
	}

	public void setComment_date(Date comment_date) {
		this.comment_date = comment_date;
	}

}
