package digitalCanteenSSM.po;

import java.util.Date;

public class Ad {
	private int    adID   = 0;
	private int    adDishID = 0;
	private int    adWndID = 0;
	private String adName = "";
	private String adPhoto = "";
	private String adExp = "";
	private Date   adStartDate = null;
	private Date   adEndDate = null;
	private String adState = "";
	private String adDiscount = "";
	private String adFinalPrice = "";
	private String adNote = "";
	
	public int getAdID() {
		return adID;
	}
	public void setAdID(int adID) {
		this.adID = adID;
	}
	public int getAdDishID() {
		return adDishID;
	}
	public void setAdDishID(int adDishID) {
		this.adDishID = adDishID;
	}
	public int getAdWndID() {
		return adWndID;
	}
	public void setAdWndID(int adWndID) {
		this.adWndID = adWndID;
	}
	public String getAdName() {
		return adName;
	}
	public void setAdName(String adName) {
		this.adName = adName;
	}
	public String getAdPhoto() {
		return adPhoto;
	}
	public void setAdPhoto(String adPhoto) {
		this.adPhoto = adPhoto;
	}
	public String getAdExp() {
		return adExp;
	}
	public void setAdExp(String adExp) {
		this.adExp = adExp;
	}
	public Date getAdStartDate() {
		return adStartDate;
	}
	public void setAdStartDate(Date adStartDate) {
		this.adStartDate = adStartDate;
	}
	public Date getAdEndDate() {
		return adEndDate;
	}
	public void setAdEndDate(Date adEndDate) {
		this.adEndDate = adEndDate;
	}
	public String getAdState() {
		return adState;
	}
	public void setAdState(String adState) {
		this.adState = adState;
	}
	public String getAdDiscount() {
		return adDiscount;
	}
	public void setAdDiscount(String adDiscount) {
		this.adDiscount = adDiscount;
	}
	public String getAdFinalPrice() {
		return adFinalPrice;
	}
	public void setAdFinalPrice(String adFinalPrice) {
		this.adFinalPrice = adFinalPrice;
	}
	public String getAdNote() {
		return adNote;
	}
	public void setAdNote(String adNote) {
		this.adNote = adNote;
	}
	
	
}
