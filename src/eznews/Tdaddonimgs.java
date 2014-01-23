package eznews;

import java.sql.Blob;
import java.util.Date;

public class Tdaddonimgs {
	private Integer isn;
	private String imgname;
	private Blob img;
	private Date cdate;
	private Integer sn;
	private Integer subid;
	private Tdnews news;
	private Tdnews getNews() {
		return news;
	}
	public void setNews(Tdnews news) {
		this.news = news;
	}
	public Integer getIsn() {
		return isn;
	}
	public void setIsn(Integer isn) {
		this.isn = isn;
	}
	public String getImgname() {
		return imgname;
	}
	public void setImgname(String imgname) {
		this.imgname = imgname;
	}
	public Blob getImg() {
		return img;
	}
	public void setImg(Blob img) {
		this.img = img;
	}
	public Date getCdate() {
		return cdate;
	}
	public void setCdate(Date cdate) {
		this.cdate = cdate;
	}
	public Integer getSn() {
		return sn;
	}
	public void setSn(Integer sn) {
		this.sn = sn;
	}
	public Integer getSubid() {
		return subid;
	}
	public void setSubid(Integer subid) {
		this.subid = subid;
	}
}
