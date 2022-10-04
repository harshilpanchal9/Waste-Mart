package com.model;

public class CompanyCartModel {
	private int cartid,subcatid,companyid;
	public int getCartid() {
		return cartid;
	}
	public void setCartid(int cartid) {
		this.cartid = cartid;
	}
	public int getSubcatid() {
		return subcatid;
	}
	public void setSubcatid(int subcatid) {
		this.subcatid = subcatid;
	}
	public int getCompanyid() {
		return companyid;
	}
	public void setCompanyid(int companyid) {
		this.companyid = companyid;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getQty() {
		return qty;
	}
	public void setQty(String qty) {
		this.qty = qty;
	}
	public String getTotal() {
		return total;
	}
	public void setTotal(String total) {
		this.total = total;
	}
	public String getCatimage() {
		return catimage;
	}
	public void setCatimage(String catimage) {
		this.catimage = catimage;
	}
	public String getSubcatname() {
		return subcatname;
	}
	public void setSubcatname(String subcatname) {
		this.subcatname = subcatname;
	}
	private String price,qty,total,catimage,subcatname;

}
