package kr.co.handflea.review;

import org.springframework.web.multipart.MultipartFile;

public class ReviewDTO {
	private String review_no;
	private String detail_no;
	private String mem_no;
	private String prdt_no;
	private String option_no;
	private String review_contents;
	private MultipartFile review_photo;
	private String review_photoname;
	private String review_photopath;
	private String star_point;
	private String reg_date;
	private String mem_name;
	private String option_contents;
	private String mem_photopath;
	private String prdt_name;
	private String thumbnail_path;
	
	public String toString() {
		return review_no
				+ " : " + detail_no  
				+ " : " + mem_no
				+ " : " + review_contents
				+ " : " + prdt_no
				+ " : " + option_no
				+ " : " + review_contents
				+ " : " + review_photoname
				+ " : " + review_photopath
				+ " : " + star_point
				+ " : " + reg_date;
	}

	public String getReview_no() {
		return review_no;
	}

	public void setReview_no(String review_no) {
		this.review_no = review_no;
	}

	public String getDetail_no() {
		return detail_no;
	}

	public void setDetail_no(String detail_no) {
		this.detail_no = detail_no;
	}

	public String getMem_no() {
		return mem_no;
	}

	public void setMem_no(String mem_no) {
		this.mem_no = mem_no;
	}

	public String getPrdt_no() {
		return prdt_no;
	}

	public void setPrdt_no(String prdt_no) {
		this.prdt_no = prdt_no;
	}

	public String getOption_no() {
		return option_no;
	}

	public void setOption_no(String option_no) {
		this.option_no = option_no;
	}

	public String getReview_contents() {
		return review_contents;
	}

	public void setReview_contents(String review_contents) {
		this.review_contents = review_contents;
	}

	public MultipartFile getReview_photo() {
		return review_photo;
	}

	public void setReview_photo(MultipartFile review_photo) {
		this.review_photo = review_photo;
	}

	public String getReview_photoname() {
		return review_photoname;
	}

	public void setReview_photoname(String review_photoname) {
		this.review_photoname = review_photoname;
	}

	public String getReview_photopath() {
		return review_photopath;
	}

	public void setReview_photopath(String review_photopath) {
		this.review_photopath = review_photopath;
	}

	public String getStar_point() {
		return star_point;
	}

	public void setStar_point(String star_point) {
		this.star_point = star_point;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	public String getOption_contents() {
		return option_contents;
	}

	public void setOption_contents(String option_contents) {
		this.option_contents = option_contents;
	}

	public String getMem_photopath() {
		return mem_photopath;
	}

	public void setMem_photopath(String mem_photopath) {
		this.mem_photopath = mem_photopath;
	}

	public String getPrdt_name() {
		return prdt_name;
	}

	public void setPrdt_name(String prdt_name) {
		this.prdt_name = prdt_name;
	}

	public String getThumbnail_path() {
		return thumbnail_path;
	}

	public void setThumbnail_path(String thumbnail_path) {
		this.thumbnail_path = thumbnail_path;
	}
	
}
