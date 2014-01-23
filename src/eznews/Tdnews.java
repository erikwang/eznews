package eznews;

import java.util.Date;
import java.sql.Blob;
import java.util.*;

/**
 * Tdnews entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class Tdnews implements java.io.Serializable {

	// Fields

	private Integer sn;
	private String title;
	private Blob maintext;
	private Blob img;
	private Date cdate;
	private Date edate;
	private String author;
	private String visitorscope;
	private Integer count;
	private String newstype;
	private Set Tdaddonimgs;
	private String flag;
	private String owner;
	
	// Constructors

	public String getOwner() {
		return owner;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public String getNewstype() {
		return newstype;
	}

	public void setNewstype(String newstype) {
		this.newstype = newstype;
	}

	/** default constructor */
	public Tdnews() {
	}

	/** minimal constructor */
	public Tdnews(Integer sn, String title) {
		this.sn = sn;
		this.title = title;
	}

	/** full constructor */
	public Tdnews(Integer sn, String title, Blob maintext, Date cdate,
			Date edate, String author, String visitorscope) {
		this.sn = sn;
		this.title = title;
		this.maintext = maintext;
		this.cdate = cdate;
		this.edate = edate;
		this.author = author;
		this.visitorscope = visitorscope;
	}

	// Property accessors

	public Integer getSn() {
		return this.sn;
	}

	public void setSn(Integer sn) {
		this.sn = sn;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Blob getMaintext() {
		return this.maintext;
	}

	public void setMaintext(Blob maintext) {
		this.maintext = maintext;
	}
	
	public Blob getImg() {
		return this.img;
	}

	public void setImg(Blob img) {
		this.img = img;
	}

	public Date getCdate() {
		return this.cdate;
	}

	public void setCdate(Date cdate) {
		this.cdate = cdate;
	}

	public Date getEdate() {
		return this.edate;
	}

	public void setEdate(Date edate) {
		this.edate = edate;
	}

	public String getAuthor() {
		return this.author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getVisitorscope() {
		return this.visitorscope;
	}

	public void setVisitorscope(String visitorscope) {
		this.visitorscope = visitorscope;
	}

	public Set getTdaddonimgs() {
		return Tdaddonimgs;
	}

	public void setTdaddonimgs(Set tdaddonimgs) {
		Tdaddonimgs = tdaddonimgs;
	}

}