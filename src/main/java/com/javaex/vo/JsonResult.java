package com.javaex.vo;

public class JsonResult {

	//필드
	private String result;	/* "success" or "fail" */
	private Object data;	/* 성공했을 때 result = "success" 일때 데이터*/
	private String failMsg;	/* 실패했을 때 result = "fail" 일때 참고 할 수 있는 메세지 */
	public JsonResult() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public JsonResult(String result, Object data, String failMsg) {
		super();
		this.result = result;
		this.data = data;
		this.failMsg = failMsg;
	}

	/* 메소드 gs */
	public String getResult() {
		return result;
	}
	public Object getData() {
		return data;
	}
	public String getFailMsg() {
		return failMsg;
	}
	/* 메소드 일반 */
	
	// 성공했을 때 사용하는 메소드
	public void success(Object data) {
		this.result = "success";
		this.data = data;
	}

	// 실패했을 때 사용하는 메소드
	public void fail(String msg) {
		this.result = "fail";
		this.failMsg = msg;
	}
	
	@Override
	public String toString() {
		return "JsonResult [result=" + result + ", data=" + data + ", failMsg=" + failMsg + "]";
	} 
	
}
