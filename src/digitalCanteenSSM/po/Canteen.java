package digitalCanteenSSM.po;

public class Canteen {
	private int    cantID          = 0;
	private int    cantTypeID      = 0;
	private int    cantCampusID    = 0;
	private String cantName        = "";
	private String cantAddr        = "";
	private String cantDescription = "";	
	private String cantPhoto       = "";
	private String cantNote        = "";	
	private int starCant           = 0;	//名星食堂标志，默认为0（非名星食堂）
	
	public int getCantID() {
		return cantID;
	}
	public void setCantID(int cantID) {
		this.cantID = cantID;
	}
	public int getCantTypeID() {
		return cantTypeID;
	}
	public void setCantTypeID(int cantToTypeID) {
		this.cantTypeID = cantToTypeID;
	}
	public int getCantCampusID() {
		return cantCampusID;
	}
	public void setCantCampusID(int cantCampusID) {
		this.cantCampusID = cantCampusID;
	}
	public String getCantName() {
		return cantName;
	}
	public void setCantName(String cantName) {
		this.cantName = cantName;
	}
	public String getCantAddr() {
		return cantAddr;
	}
	public void setCantAddr(String cantAddr) {
		this.cantAddr = cantAddr;
	}
	public String getCantDescription() {
		return cantDescription;
	}
	public void setCantDescription(String cantDescription) {
		this.cantDescription = cantDescription;
	}
	public String getCantPhoto() {
		return cantPhoto;
	}
	public void setCantPhoto(String cantPhoto) {
		this.cantPhoto = cantPhoto;
	}
	public String getCantNote() {
		return cantNote;
	}
	public void setCantNote(String cantNote) {
		this.cantNote = cantNote;
	}
	public int getStarCant() {
		return starCant;
	}
	public void setStarCant(int starCant) {
		this.starCant = starCant;
	}	

	
}
