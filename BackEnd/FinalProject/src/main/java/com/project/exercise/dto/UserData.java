package com.project.exercise.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class UserData {
	private String userId;
	private String nickName;
	private String userName;
	private String category;
	private int score;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss")
	private Date solveDate;

	public UserData() {
		
	}

	public UserData(String userId, String nickName, String userName, String category, int score, Date solveDate) {
		this.userId = userId;
		this.nickName = nickName;
		this.userName = userName;
		this.category = category;
		this.score = score;
		this.solveDate = solveDate;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public Date getSolveDate() {
		return solveDate;
	}

	public void setSolveDate(Date solveDate) {
		this.solveDate = solveDate;
	}

	@Override
	public String toString() {
		return "UserData [userId=" + userId + ", nickName=" + nickName + ", userName=" + userName + ", category="
				+ category + ", score=" + score + ", solveDate=" + solveDate + "]";
	}
	
}