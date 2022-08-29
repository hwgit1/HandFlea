package kr.co.handflea.util.dto;

public class AdjustDTO {
	private String adjust_no;
	private String mem_no;
	private int fundage;
	private int deposit;
	private int withdraw;
	private int balance;
	private String reg_date;
	private String detail_no;
	
	private String prdt_name;
	
	public String getAdjust_no() {
		return adjust_no;
	}
	public void setAdjust_no(String adjust_no) {
		this.adjust_no = adjust_no;
	}
	public String getMem_no() {
		return mem_no;
	}
	public void setMem_no(String mem_no) {
		this.mem_no = mem_no;
	}
	public int getFundage() {
		return fundage;
	}
	public void setFundage(int fundage) {
		this.fundage = fundage;
	}
	public int getDeposit() {
		return deposit;
	}
	public void setDeposit(int deposit) {
		this.deposit = deposit;
	}
	public int getWithdraw() {
		return withdraw;
	}
	public void setWithdraw(int withdraw) {
		this.withdraw = withdraw;
	}
	public int getBalance() {
		return balance;
	}
	public void setBalance(int balance) {
		this.balance = balance;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getDetail_no() {
		return detail_no;
	}
	public void setDetail_no(String detail_no) {
		this.detail_no = detail_no;
	}
	public String getPrdt_name() {
		return prdt_name;
	}
	public void setPrdt_name(String prdt_name) {
		this.prdt_name = prdt_name;
	}
}
