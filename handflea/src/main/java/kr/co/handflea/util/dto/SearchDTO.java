package kr.co.handflea.util.dto;

public class SearchDTO {

   private String searchOption;
   private String searchWord;
   private int limitNum;
   private String mem_no;
   private String prdt_no;
   @Override
   public String toString() {
      return searchOption + " : " + searchWord;
   }

   public String getSearchOption() {
      return searchOption;
   }
   public void setSearchOption(String searchOption) {
      this.searchOption = searchOption;
   }
   public String getSearchWord() {
      return searchWord;
   }
   public void setSearchWord(String searchWord) {
      this.searchWord = searchWord;
   }
   public int getLimitNum() {
      return limitNum;
   }
   public void setLimitNum(int limitNum) {
      this.limitNum = limitNum;
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

}//class