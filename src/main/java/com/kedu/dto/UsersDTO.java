package com.kedu.dto;

import java.sql.Timestamp;

public class UsersDTO {
	 	private int member_seq;
	    private String id;
	    private String name;
	    private String pw;
	    private String email;
	    private String phone;
	    private String zipcode;
	    private String address1;
	    private String address2;
	    private String gender;
	    private int age;
	    private Timestamp birth;
	    private String profile_img;
	    private int point;
	    private String team;
	    private Timestamp regdate;
	    private int blackList;
	    private String admin;

	    public UsersDTO() {
	    }

	    public UsersDTO(int member_seq, String id, String name, String pw,
	                    String email, String phone, String zipcode,
	                    String address1, String address2, String gender,
	                    int age, Timestamp birth, String profile_img,
	                    int point, String team, Timestamp regdate,
	                    int blackList, String admin) {

	        this.member_seq = member_seq;
	        this.id = id;
	        this.name = name;
	        this.pw = pw;
	        this.email = email;
	        this.phone = phone;
	        this.zipcode = zipcode;
	        this.address1 = address1;
	        this.address2 = address2;
	        this.gender = gender;
	        this.age = age;
	        this.birth = birth;
	        this.profile_img = profile_img;
	        this.point = point;
	        this.team = team;
	        this.regdate = regdate;
	        this.blackList = blackList;
	        this.admin = admin;
	    }

	    public int getMember_seq() {
	        return member_seq;
	    }

	    public void setMember_seq(int member_seq) {
	        this.member_seq = member_seq;
	    }

	    public String getId() {
	        return id;
	    }

	    public void setId(String id) {
	        this.id = id;
	    }

	    public String getName() {
	        return name;
	    }

	    public void setName(String name) {
	        this.name = name;
	    }

	    public String getPw() {
	        return pw;
	    }

	    public void setPw(String pw) {
	        this.pw = pw;
	    }

	    public String getEmail() {
	        return email;
	    }

	    public void setEmail(String email) {
	        this.email = email;
	    }

	    public String getPhone() {
	        return phone;
	    }

	    public void setPhone(String phone) {
	        this.phone = phone;
	    }

	    public String getZipcode() {
	        return zipcode;
	    }

	    public void setZipcode(String zipcode) {
	        this.zipcode = zipcode;
	    }

	    public String getAddress1() {
	        return address1;
	    }

	    public void setAddress1(String address1) {
	        this.address1 = address1;
	    }

	    public String getAddress2() {
	        return address2;
	    }

	    public void setAddress2(String address2) {
	        this.address2 = address2;
	    }

	    public String getGender() {
	        return gender;
	    }

	    public void setGender(String gender) {
	        this.gender = gender;
	    }

	    public int getAge() {
	        return age;
	    }

	    public void setAge(int age) {
	        this.age = age;
	    }

	    public Timestamp getBirth() {
	        return birth;
	    }

	    public void setBirth(Timestamp birth) {
	        this.birth = birth;
	    }

	    public String getProfile_img() {
	        return profile_img;
	    }

	    public void setProfile_img(String profile_img) {
	        this.profile_img = profile_img;
	    }

	    public int getPoint() {
	        return point;
	    }

	    public void setPoint(int point) {
	        this.point = point;
	    }

	    public String getTeam() {
	        return team;
	    }

	    public void setTeam(String team) {
	        this.team = team;
	    }

	    public Timestamp getRegdate() {
	        return regdate;
	    }

	    public void setRegdate(Timestamp regdate) {
	        this.regdate = regdate;
	    }

	    public int getBlackList() {
	        return blackList;
	    }

	    public void setBlackList(int blackList) {
	        this.blackList = blackList;
	    }

	    public String getAdmin() {
	        return admin;
	    }

	    public void setAdmin(String admin) {
	        this.admin = admin;
	    }
}
