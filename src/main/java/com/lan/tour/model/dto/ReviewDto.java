package com.lan.tour.model.dto;

import java.util.Date;

public class ReviewDto {

	private int review_no;
	private int room_no;
	private int lantour_no;
	private int member_no;
	private Date review_date;
	private String review_title;
	private int review_score;

	public ReviewDto() {

	}

	public ReviewDto(int review_no, int room_no, int lantour_no, int member_no, Date review_date, String review_title,
			int review_score) {

		this.review_no = review_no;
		this.room_no = room_no;
		this.lantour_no = lantour_no;
		this.member_no = member_no;
		this.review_date = review_date;
		this.review_title = review_title;
		this.review_score = review_score;
	}

	public int getReview_no() {
		return review_no;
	}

	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}

	public int getRoom_no() {
		return room_no;
	}

	public void setRoom_no(int room_no) {
		this.room_no = room_no;
	}

	public int getLantour_no() {
		return lantour_no;
	}

	public void setLantour_no(int lantour_no) {
		this.lantour_no = lantour_no;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public Date getReview_date() {
		return review_date;
	}

	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}

	public String getReview_title() {
		return review_title;
	}

	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}

	public int getReview_score() {
		return review_score;
	}

	public void setReview_score(int review_score) {
		this.review_score = review_score;
	}

}
