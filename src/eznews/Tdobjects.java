package eznews;

import java.util.Date;

/**
 * Tdobjects entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class Tdobjects implements java.io.Serializable {

	// Fields

	private Integer sn;
	private String title;
	private String maintext;
	private Date cdate;
	private Date edate;
	private String author;
	private String visitorscope;
	private String img;

	// Constructors

	/** default constructor */
	public Tdobjects() {
	}

	/** minimal constructor */
	public Tdobjects(Integer sn, String title) {
		this.sn = sn;
		this.title = title;
	}

	/** full constructor */
	public Tdobjects(Integer sn, String title, String maintext, Date cdate,
			Date edate, String author, String visitorscope, String img) {
		this.sn = sn;
		this.title = title;
		this.maintext = maintext;
		this.cdate = cdate;
		this.edate = edate;
		this.author = author;
		this.visitorscope = visitorscope;
		this.img = img;
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

	public String getMaintext() {
		return this.maintext;
	}

	public void setMaintext(String maintext) {
		this.maintext = maintext;
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

	public String getImg() {
		return this.img;
	}

	public void setImg(String img) {
		this.img = img;
	}

}