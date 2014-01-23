package eznews;

import java.util.Date;

/**
 * Tdfiles entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class Tdfiles implements java.io.Serializable {

	// Fields

	private Integer sn;
	private String filename;
	private Date cdate;
	private String filecomment;
	private String filetype;
	private int count;


	// Constructors

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	/** default constructor */
	public Tdfiles() {
	}

	/** minimal constructor */
	public Tdfiles(Integer sn, String title) {
		this.sn = sn;
		this.filename = title;
	}

	/** full constructor */
	public Tdfiles(Integer sn, String filename,  Date cdate,
			 String filecomment) {
		this.sn = sn;
		this.filename = filename;
		this.cdate = cdate;
		this.filecomment = filecomment;
	}

	// Property accessors

	public Integer getSn() {
		return this.sn;
	}

	public void setSn(Integer sn) {
		this.sn = sn;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public Date getCdate() {
		return cdate;
	}

	public void setCdate(Date cdate) {
		this.cdate = cdate;
	}

	public String getFilecomment() {
		return filecomment;
	}

	public void setFilecomment(String filecomment) {
		this.filecomment = filecomment;
	}

	public String getFiletype() {
		return filetype;
	}

	public void setFiletype(String filetype) {
		this.filetype = filetype;
	}


}