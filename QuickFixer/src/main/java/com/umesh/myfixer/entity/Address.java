package com.umesh.myfixer.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "address_tbl")
public class Address{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column
	private Integer id;
	
	@Column
	private String houseNumber; 
	@Column
	private String society;
	@Column
	private String area;
	@Column
	private String city;
	@Column
	private String pincode;
	
	
	public Address() {}
	
	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public String getHouseNumber() {
		return houseNumber;
	}


	public void setHouseNumber(String houseNumber) {
		this.houseNumber = houseNumber;
	}


	public String getSociety() {
		return society;
	}


	public void setSociety(String society) {
		this.society = society;
	}


	public String getArea() {
		return area;
	}


	public void setArea(String area) {
		this.area = area;
	}


	public String getCity() {
		return city;
	}


	public void setCity(String city) {
		this.city = city;
	}


	public String getPincode() {
		return pincode;
	}


	public void setPincode(String pincode) {
		this.pincode = pincode;
	}
	
}
