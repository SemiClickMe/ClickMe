package org.clickMe.common.model.dto;

	import java.sql.Date; 
	 
	public class InquiryDTO implements java.io.Serializable { 
	 
		private static final long serialVersionUID = -9194975670319475203L; 
	 
		private int no; 
		private int inoTypeCode; 
		private int userCode; 
		private String inoTitle; 
		private String inoContent; 
		private Date inoTime; 
		private String ansContent; 
		private Date ansTime; 
		private String ansYn; 
	 
		public InquiryDTO() { 
		} 
	 
		public InquiryDTO(int no, int inoTypeCode, int userCode, String inoTitle, String inoContent, Date inoTime, 
				String ansContent, Date ansTime, String ansYn) { 
			this.no = no; 
			this.inoTypeCode = inoTypeCode; 
			this.userCode = userCode; 
			this.inoTitle = inoTitle; 
			this.inoContent = inoContent; 
			this.inoTime = inoTime; 
			this.ansContent = ansContent; 
			this.ansTime = ansTime; 
			this.ansYn = ansYn; 
		} 
	 
		public int getNo() { 
			return no; 
		} 
	 
		public void setNo(int no) { 
			this.no = no; 
		} 
	 
		public int getInoTypeCode() { 
			return inoTypeCode; 
		} 
	 
		public void setInoTypeCode(int inoTypeCode) { 
			this.inoTypeCode = inoTypeCode; 
		} 
	 
		public int getUserCode() { 
			return userCode; 
		} 
	 
		public void setUserCode(int userCode) { 
			this.userCode = userCode; 
		} 
	 
		public String getInoTitle() { 
			return inoTitle; 
		} 
	 
		public void setInoTitle(String inoTitle) { 
			this.inoTitle = inoTitle; 
		} 
	 
		public String getInoContent() { 
			return inoContent; 
		} 
	 
		public void setInoContent(String inoContent) { 
			this.inoContent = inoContent; 
		} 
	 
		public Date getInoTime() { 
			return inoTime; 
		} 
	 
		public void setInoTime(Date inoTime) { 
			this.inoTime = inoTime; 
		} 
	 
		public String getAnsContent() { 
			return ansContent; 
		} 
	 
		public void setAnsContent(String ansContent) { 
			this.ansContent = ansContent; 
		} 
	 
		public Date getAnsTime() { 
			return ansTime; 
		} 
	 
		public void setAnsTime(Date ansTime) { 
			this.ansTime = ansTime; 
		} 
	 
		public String getAnsYn() { 
			return ansYn; 
		} 
	 
		public void setAnsYn(String ansYn) { 
			this.ansYn = ansYn; 
		} 
	 
		public static long getSerialversionuid() { 
			return serialVersionUID; 
		} 
	 
		@Override 
		public String toString() { 
			return "InquiryDTO [no=" + no + ", inoTypeCode=" + inoTypeCode + ", userCode=" + userCode + ", inoTitle=" 
					+ inoTitle + ", inoContent=" + inoContent + ", inoTime=" + inoTime + ", ansContent=" + ansContent 
					+ ", ansTime=" + ansTime + ", ansYn=" + ansYn + "]"; 
		} 
	 
	} 
}