package com.model;

public class SubCategoryModel 
{
	private int subcatid,catid;
	private String itemname,itemprice,itemimage,itemstock;
	public int getSubcatid() {
		return subcatid;
	}
	public void setSubcatid(int subcatid) {
		this.subcatid = subcatid;
	}
	public int getCatid() {
		return catid;
	}
	public void setCatid(int catid) {
		this.catid = catid;
	}
	public String getItemname() {
		return itemname;
	}
	public void setItemname(String itemname) {
		this.itemname = itemname;
	}
	public String getItemprice() {
		return itemprice;
	}
	public void setItemprice(String itemprice) {
		this.itemprice = itemprice;
	}
	public String getItemimage() {
		return itemimage;
	}
	public void setItemimage(String itemimage) {
		this.itemimage = itemimage;
	}
	public String getItemstock() {
		return itemstock;
	}
	public void setItemstock(String itemstock) {
		this.itemstock = itemstock;
	}
	
}
