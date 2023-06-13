package com.javaex.vo;

public class CategoryVo {
	private int cateNo;
	private String id;
	private String cateName;
	private int postCount;
	private String description;
	private String regDate;
	
	public CategoryVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CategoryVo(int cateNo, String id, String cateName, int postCount, String description, String regDate) {
		super();
		this.cateNo = cateNo;
		this.id = id;
		this.cateName = cateName;
		this.postCount = postCount;
		this.description = description;
		this.regDate = regDate;
	}

	public int getCateNo() {
		return cateNo;
	}

	public void setCateNo(int cateNo) {
		this.cateNo = cateNo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCateName() {
		return cateName;
	}

	public void setCateName(String cateName) {
		this.cateName = cateName;
	}

	public int getPostCount() {
		return postCount;
	}

	public void setPostCount(int postCount) {
		this.postCount = postCount;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "CategoryVo [cateNo=" + cateNo + ", id=" + id + ", cateName=" + cateName + ", postCount=" + postCount
				+ ", description=" + description + ", regDate=" + regDate + "]";
	}
	
	
	
	
}
