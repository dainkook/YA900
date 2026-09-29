package com.kedu.dto;

import java.sql.Timestamp;

public class NewsDTO {

	private int news_seq;
	private String title;
	private String originalLink;
	private String link;
	private String description;
	private Timestamp pubdate;
	
	public int getNews_seq() {
		return news_seq;
	}
	public void setNews_seq(int news_seq) {
		this.news_seq = news_seq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getOriginalLink() {
		return originalLink;
	}
	public void setOriginalLink(String originalLink) {
		this.originalLink = originalLink;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Timestamp getPubdate() {
		return pubdate;
	}
	public void setPubdate(Timestamp pubdate) {
		this.pubdate = pubdate;
	}
	
	public NewsDTO() {}
	public NewsDTO(int news_seq, String title, String originalLink, String link, String description,
		Timestamp pubdate) {
		this.news_seq = news_seq;
		this.title = title;
		this.originalLink = originalLink;
		this.link = link;
		this.description = description;
		this.pubdate = pubdate;
	};
	
	
	
}
