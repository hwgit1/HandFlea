package kr.co.handflea.product;

import org.springframework.web.multipart.MultipartFile;

public class ProductDTO {
	private String prdt_no;
	private String prdt_name;
	private String mem_no;
	private String mem_email;
	private String description;
	private String price;
	private String delivery_price;
	private String option_no;
	private String option_contents;
	private String option_yn;
	private String view_cnt;
	private String reg_date;
	private MultipartFile thumbnail;
	private MultipartFile prdt_img;
	private MultipartFile desc_img;
	private String thumbnail_name;
	private String thumbnail_path;
	private String desc_img_name;
	private String desc_img_path;
	
	private String bigcate_no;
	private String bigcate_name;
	private String smallcate_no;
	private String smallcate_name;
	
	private String prdt_rdy;
	private String del_yn;
	private String del_date;
	
	private String basket_no;
	private String buy_qty;
	private String total_price;
	
	private String [] arr_option;
	private String [] arr_option_no;
	
	private int limitNum;
	
	private String seller_name;
	
	private String mem_photopath;
	private String mem_photo;
	
	private int cnt;
	private int star_point;
	
	private String detail_no;
	
	@Override
	public String toString() {
		return prdt_no
				+ " : " + prdt_name
				+ " : " + mem_no
				+ " : " + mem_email
				+ " : " + price
				+ " : " + delivery_price
				+ " : " + description
				+ " : " + option_no
				+ " : " + view_cnt
				+ " : " + reg_date
				+ " : " + thumbnail
				+ " : " + prdt_img
				+ " : " + desc_img
				+ " : " + thumbnail_name
				+ " : " + thumbnail_path
				+ " : " + desc_img_name
				+ " : " + desc_img_path
				+ " : " + buy_qty
				+ " : " + total_price
				+ " : " + bigcate_name
				+ " : " + smallcate_name
				+ " : " + prdt_rdy;
		
	}

	public String getPrdt_no() {
		return prdt_no;
	}

	public void setPrdt_no(String prdt_no) {
		this.prdt_no = prdt_no;
	}

	public String getPrdt_name() {
		return prdt_name;
	}

	public void setPrdt_name(String prdt_name) {
		this.prdt_name = prdt_name;
	}

	public String getMem_no() {
		return mem_no;
	}

	public void setMem_no(String mem_no) {
		this.mem_no = mem_no;
	}

	public String getMem_email() {
		return mem_email;
	}

	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getDelivery_price() {
		return delivery_price;
	}

	public void setDelivery_price(String delivery_price) {
		this.delivery_price = delivery_price;
	}

	public String getOption_no() {
		return option_no;
	}

	public void setOption_no(String option_no) {
		this.option_no = option_no;
	}

	public String getOption_contents() {
		return option_contents;
	}

	public void setOption_contents(String option_contents) {
		this.option_contents = option_contents;
	}

	public String getOption_yn() {
		return option_yn;
	}

	public void setOption_yn(String option_yn) {
		this.option_yn = option_yn;
	}

	public String getView_cnt() {
		return view_cnt;
	}

	public void setView_cnt(String view_cnt) {
		this.view_cnt = view_cnt;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public MultipartFile getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(MultipartFile thumbnail) {
		this.thumbnail = thumbnail;
	}

	public MultipartFile getPrdt_img() {
		return prdt_img;
	}

	public void setPrdt_img(MultipartFile prdt_img) {
		this.prdt_img = prdt_img;
	}

	public MultipartFile getDesc_img() {
		return desc_img;
	}

	public void setDesc_img(MultipartFile desc_img) {
		this.desc_img = desc_img;
	}

	public String getThumbnail_name() {
		return thumbnail_name;
	}

	public void setThumbnail_name(String thumbnail_name) {
		this.thumbnail_name = thumbnail_name;
	}

	public String getThumbnail_path() {
		return thumbnail_path;
	}

	public void setThumbnail_path(String thumbnail_path) {
		this.thumbnail_path = thumbnail_path;
	}

	public String getDesc_img_name() {
		return desc_img_name;
	}

	public void setDesc_img_name(String desc_img_name) {
		this.desc_img_name = desc_img_name;
	}

	public String getDesc_img_path() {
		return desc_img_path;
	}

	public void setDesc_img_path(String desc_img_path) {
		this.desc_img_path = desc_img_path;
	}

	public String getBigcate_no() {
		return bigcate_no;
	}

	public void setBigcate_no(String bigcate_no) {
		this.bigcate_no = bigcate_no;
	}

	public String getBigcate_name() {
		return bigcate_name;
	}

	public void setBigcate_name(String bigcate_name) {
		this.bigcate_name = bigcate_name;
	}

	public String getSmallcate_no() {
		return smallcate_no;
	}

	public void setSmallcate_no(String smallcate_no) {
		this.smallcate_no = smallcate_no;
	}

	public String getSmallcate_name() {
		return smallcate_name;
	}

	public void setSmallcate_name(String smallcate_name) {
		this.smallcate_name = smallcate_name;
	}

	public String getPrdt_rdy() {
		return prdt_rdy;
	}

	public void setPrdt_rdy(String prdt_rdy) {
		this.prdt_rdy = prdt_rdy;
	}

	public String getDel_yn() {
		return del_yn;
	}

	public void setDel_yn(String del_yn) {
		this.del_yn = del_yn;
	}

	public String getDel_date() {
		return del_date;
	}

	public void setDel_date(String del_date) {
		this.del_date = del_date;
	}

	public String getBasket_no() {
		return basket_no;
	}

	public void setBasket_no(String basket_no) {
		this.basket_no = basket_no;
	}

	public String getBuy_qty() {
		return buy_qty;
	}

	public void setBuy_qty(String buy_qty) {
		this.buy_qty = buy_qty;
	}

	public String getTotal_price() {
		return total_price;
	}

	public void setTotal_price(String total_price) {
		this.total_price = total_price;
	}

	public String[] getArr_option() {
		return arr_option;
	}

	public void setArr_option(String[] arr_option) {
		this.arr_option = arr_option;
	}

	public String[] getArr_option_no() {
		return arr_option_no;
	}

	public void setArr_option_no(String[] arr_option_no) {
		this.arr_option_no = arr_option_no;
	}

	public int getLimitNum() {
		return limitNum;
	}

	public void setLimitNum(int limitNum) {
		this.limitNum = limitNum;
	}

	public String getSeller_name() {
		return seller_name;
	}

	public void setSeller_name(String seller_name) {
		this.seller_name = seller_name;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public String getMem_photopath() {
		return mem_photopath;
	}

	public void setMem_photopath(String mem_photopath) {
		this.mem_photopath = mem_photopath;
	}

	public String getMem_photo() {
		return mem_photo;
	}

	public void setMem_photo(String mem_photo) {
		this.mem_photo = mem_photo;
	}

	public int getStar_point() {
		return star_point;
	}

	public void setStar_point(int star_point) {
		this.star_point = star_point;
	}

	public String getDetail_no() {
		return detail_no;
	}

	public void setDetail_no(String detail_no) {
		this.detail_no = detail_no;
	}
	
}//class
