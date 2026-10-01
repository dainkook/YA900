package com.kedu.dto;

public class PageDTO {

	private int currentPage; // 현재 페이지
	private int recordCount; // 전체 데이터 개수
	private int recordsPerPage; // 한 페이지에 출력할 데이터 개수
	private int pageTotal; // 전체 페이지 개수
	private int startPage; // 첫 페이지 번호
	private int endPage; // 마지막 페이지 번호
	private int startIndex; // DB 조회 시작 번호
	private int endIndex; // DB 조회 끝 번호

	public PageDTO() {
	}

	public PageDTO(int currentPage, int recordCount, int recordsPerPage) {

		this.currentPage = currentPage;
		this.recordCount = recordCount;
		this.recordsPerPage = recordsPerPage;

		// 전체 페이지 개수
		this.pageTotal = (recordCount + recordsPerPage - 1) / recordsPerPage;

		// DB 조회 시작 번호
		this.startIndex = (currentPage - 1) * recordsPerPage + 1;

		// DB 조회 끝 번호
		this.endIndex = currentPage * recordsPerPage;

		// 페이지 버튼 한 번에 10개 표시
		int pageBlock = 10;

		this.startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;

		this.endPage = startPage + pageBlock - 1;

		// 마지막 페이지가 pageTotal보다 크면 pageTotal로 맞춤
		if (endPage > pageTotal) {
			endPage = pageTotal;
		}
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getRecordCount() {
		return recordCount;
	}

	public void setRecordCount(int recordCount) {
		this.recordCount = recordCount;
	}

	public int getRecordsPerPage() {
		return recordsPerPage;
	}

	public void setRecordsPerPage(int recordsPerPage) {
		this.recordsPerPage = recordsPerPage;
	}

	public int getPageTotal() {
		return pageTotal;
	}

	public void setPageTotal(int pageTotal) {
		this.pageTotal = pageTotal;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
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

}
