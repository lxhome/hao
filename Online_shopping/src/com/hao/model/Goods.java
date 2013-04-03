package com.hao.model;
import java.math.*;
public class Goods {
   private int goodsId;
   private String  g_name;
   private float g_price;
   private  String g_infor;
   private int g_amount;
   private String g_type;
   private String g_images;
	private String specificClass;
	
	
	public int getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(int goodsId) {
		this.goodsId = goodsId;
	}

	public String getG_name() {
		return g_name;
	}

	public void setG_name(String g_name) {
		this.g_name = g_name;
	}

	public double getG_price() {	
		return g_price;
	}

	public void setG_price(float g_price) {
		this.g_price = g_price;
	}

	public String getG_infor() {
		return g_infor;
	}

	public void setG_infor(String g_infor) {
		this.g_infor = g_infor;
	}

	public int getG_amount() {
		return g_amount;
	}

	public void setG_amount(int g_amount) {
		this.g_amount = g_amount;
	}

	public String getG_type() {
		return g_type;
	}

	public void setG_type(String g_type) {
		this.g_type = g_type;
	}

	public String getG_images() {
		return g_images;
	}

	public void setG_images(String g_images) {
		this.g_images = g_images;
	}

	public String getSpecificClass() {
		return specificClass;
	}

	public void setSpecificClass(String specificClass) {
		this.specificClass = specificClass;
	}
}
