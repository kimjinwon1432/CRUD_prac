package main.service;

public class BoardVO {
	private int boardnum;
	private String title;
	private String id;
	private String contents;
	private String file_path="";
//	private String file_size;
	private	String updatedate;
	private String regdate;
	private int hits;
	
	private String searchType;
	private String searchText;

	private int viewPage	=1;
	private int startIndex	=1;
	private int endIndex	=10;
	//5, 10, 15개씩 보기 선택 시 사용할 변수
	private int unit=10;
	
	public int getUnit() {
		return unit;
	}
	public void setUnit(int unit) {
		this.unit = unit;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getSearchText() {
		return searchText;
	}
	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}
		
	public int getViewPage() {
		return viewPage;
	}
	public void setViewPage(int viewPage) {
		this.viewPage = viewPage;
	}
	public int getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}
	public int getEndIndex() {
		return endIndex;
	}
	public void setEndIndex(int endIndex) {
		this.endIndex = endIndex;
	}
	
	
	public int getBoardnum() {
		return boardnum;
	}
	public void setBoardnum(int boardnum) {
		this.boardnum = boardnum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getFile_path() {
		return file_path;
	}
	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}
	public String getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(String updatedate) {
		this.updatedate = updatedate;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	@Override
	public String toString() {
		return "BoardVO [boardnum=" + boardnum + ", title=" + title + ", id=" + id + ", contents=" + contents
				+ ", file_path=" + file_path + ", updatedate=" + updatedate + ", regdate="
				+ regdate + ", hits=" + hits + ", viewPage=" + viewPage + ", startIndex=" + startIndex + ", endIndex="
				+ endIndex + "]";
	}
	
	
	

}
