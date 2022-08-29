package kr.co.handflea.util.dto;

public class SellerDTO {
	
	private String mem_no;
	private String bank_no;
	private String seller_name;
	private String seller_money;
	private String seller_account_no;
	private String seller_add_1;
	private String seller_add_2;
	private String post_code;
	private String seller_yn;
	
	private int cnt;
	
	public String toString() {
		return	 mem_no
				+ " : " + bank_no
				+ " : " + seller_name
				+ " : " + seller_money
				+ " : " + seller_account_no
				+ " : " + seller_add_1
				+ " : " + seller_add_2
				+ " : " + post_code;
	}
	
	public String getMem_no() {
		return mem_no;
	}
	public void setMem_no(String mem_no) {
		this.mem_no = mem_no;
	}
	public String getBank_no() {
		return bank_no;
	}
	public void setBank_no(String bank_no) {
		this.bank_no = bank_no;
	}
	public String getSeller_name() {
		return seller_name;
	}
	public void setSeller_name(String seller_name) {
		this.seller_name = seller_name;
	}
	public String getSeller_money() {
		return seller_money;
	}
	public void setSeller_money(String seller_money) {
		this.seller_money = seller_money;
	}
	public String getSeller_account_no() {
		return seller_account_no;
	}
	public void setSeller_account_no(String seller_account_no) {
		this.seller_account_no = seller_account_no;
	}
	public String getSeller_add_1() {
		return seller_add_1;
	}
	public void setSeller_add_1(String seller_add_1) {
		this.seller_add_1 = seller_add_1;
	}
	public String getSeller_add_2() {
		return seller_add_2;
	}
	public void setSeller_add_2(String seller_add_2) {
		this.seller_add_2 = seller_add_2;
	}
	public String getPost_code() {
		return post_code;
	}
	public void setPost_code(String post_code) {
		this.post_code = post_code;
	}

	public String getSeller_yn() {
		return seller_yn;
	}

	public void setSeller_yn(String seller_yn) {
		this.seller_yn = seller_yn;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
	
}//class
