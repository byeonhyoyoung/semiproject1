package data.dto;

import java.sql.Timestamp;

public class TourDto {

	private String t_num;
	private String t_category;
	private String t_subject;
	private String t_subject_j;
	private String t_content;
	private String t_image;
	private String t_location;
	private String t_link;
	private String t_time;
	private String t_tel;
	private String t_price;
	private String t_googlemap;
	private Timestamp t_writeday;
	
	
	public String getT_subject_j() {
		return t_subject_j;
	}
	public void setT_subject_j(String t_subject_j) {
		this.t_subject_j = t_subject_j;
	}
	public String getT_time() {
		return t_time;
	}
	public void setT_time(String t_time) {
		this.t_time = t_time;
	}
	public String getT_tel() {
		return t_tel;
	}
	public void setT_tel(String t_tel) {
		this.t_tel = t_tel;
	}
	public String getT_price() {
		return t_price;
	}
	public void setT_price(String t_price) {
		this.t_price = t_price;
	}
	public String getT_num() {
		return t_num;
	}
	public void setT_num(String t_num) {
		this.t_num = t_num;
	}
	public String getT_category() {
		return t_category;
	}
	public void setT_category(String t_category) {
		this.t_category = t_category;
	}
	public String getT_subject() {
		return t_subject;
	}
	public void setT_subject(String t_subject) {
		this.t_subject = t_subject;
	}
	public String getT_content() {
		return t_content;
	}
	public void setT_content(String t_content) {
		this.t_content = t_content;
	}
	public String getT_image() {
		return t_image;
	}
	public void setT_image(String t_image) {
		this.t_image = t_image;
	}
	public String getT_location() {
		return t_location;
	}
	public void setT_location(String t_location) {
		this.t_location = t_location;
	}
	public String getT_link() {
		return t_link;
	}
	public void setT_link(String t_link) {
		this.t_link = t_link;
	}
	public String getT_googlemap() {
		return t_googlemap;
	}
	public void setT_googlemap(String t_googlemap) {
		this.t_googlemap = t_googlemap;
	}
	public Timestamp getT_writeday() {
		return t_writeday;
	}
	public void setT_writeday(Timestamp t_writeday) {
		this.t_writeday = t_writeday;
	}
}