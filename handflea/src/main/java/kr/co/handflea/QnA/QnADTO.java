package kr.co.handflea.QnA;

public class QnADTO {

	private String qna_no;
	private String title;
	private String mem_no;
	private String contents;
	private String view_cnt;
	private String write_date;
	private String answer_yn;
	private String answer;
	private String mem_name;
	private String mem_photopath;
	
	@Override
	public String toString() {
		return qna_no
				+ " : " + title
				+ " : " + mem_no
				+ " : " + contents
				+ " : " + view_cnt
				+ " : " + write_date
				+ " : " + answer_yn
				+ " : " + answer
				+ " : " + mem_name;
	}

	public String getQna_no() {
		return qna_no;
	}

	public void setQna_no(String qna_no) {
		this.qna_no = qna_no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getMem_no() {
		return mem_no;
	}

	public void setMem_no(String mem_no) {
		this.mem_no = mem_no;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getView_cnt() {
		return view_cnt;
	}

	public void setView_cnt(String view_cnt) {
		this.view_cnt = view_cnt;
	}

	public String getWrite_date() {
		return write_date;
	}

	public void setWrite_date(String write_date) {
		this.write_date = write_date;
	}

	public String getAnswer_yn() {
		return answer_yn;
	}

	public void setAnswer_yn(String answer_yn) {
		this.answer_yn = answer_yn;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	public String getMem_photopath() {
		return mem_photopath;
	}

	public void setMem_photopath(String mem_photopath) {
		this.mem_photopath = mem_photopath;
	}
	
}
