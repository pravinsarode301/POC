/**
 * 
 */
package com.BeautyCare.Bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

/**
 * @author pravtej
 *
 */

@Entity
@Table(name="ADDRESS")
public class Address {
	@Id
	@GeneratedValue
	@Column(name = "ADDRESS_ID")
	private long addrId;
	@Column(name = "LANDMARK")
	private String landmark;
	@Column(name = "CITY")
	private String city;
	@Column(name = "DIST")
	private String dist;
	@Column(name = "STATE")
	private String state;
	@Column(name = "COUNTRY")
	private String country;
	@Column(name = "PIN_CODE")
	private String pinCode;
	@Column(name = "EMAIL")
	private String email;
	@Column(name="CONTACT_NUMBER")
	private long contactNumber;
	
	public Address() {
		// TODO Auto-generated constructor stub
	}

	public Address(long addrId, String landmark, String city, String dist, String state, String country, String pinCode,
			String email, long contactNumber) {
		super();
		this.addrId = addrId;
		this.landmark = landmark;
		this.city = city;
		this.dist = dist;
		this.state = state;
		this.country = country;
		this.pinCode = pinCode;
		this.email = email;
		this.contactNumber = contactNumber;
	}

	public long getAddrId() {
		return addrId;
	}

	public void setAddrId(long addrId) {
		this.addrId = addrId;
	}

	public String getLandmark() {
		return landmark;
	}

	public void setLandmark(String landmark) {
		this.landmark = landmark;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getDist() {
		return dist;
	}

	public void setDist(String dist) {
		this.dist = dist;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getPinCode() {
		return pinCode;
	}

	public void setPinCode(String pinCode) {
		this.pinCode = pinCode;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public long getContactNumber() {
		return contactNumber;
	}

	public void setContactNumber(long contactNumber) {
		this.contactNumber = contactNumber;
	}
	
	
	
	
	
	
}
