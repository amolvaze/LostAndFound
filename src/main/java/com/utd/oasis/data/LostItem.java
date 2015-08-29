package com.utd.oasis.data;

public class LostItem {
	 /* rs.getInt("item_id");
      rs.getString("item_name");
      rs.getString("item_desc");
      rs.getString("user_id");
      rs.getString("lost_location");*/
	private int itemId;
	private String itemName;
	private String itemDesc;
    private int contact;
    private String name;
	public int getContact() {
		return contact;
	}
	public void setContact(int contact) {
		this.contact = contact;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	private String userLocation;
	public int getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String getItemDesc() {
		return itemDesc;
	}
	public void setItemDesc(String itemDesc) {
		this.itemDesc = itemDesc;
	}

	public String getUserLocation() {
		return userLocation;
	}
	public void setUserLocation(String userLocation) {
		this.userLocation = userLocation;
	}
	public LostItem()
	{
		
	}
	public LostItem(int itemId, String itemName, String itemDesc,
			String userId, String userLocation,int contact, String name) {
		super();
		this.itemId = itemId;
		this.itemName = itemName;
		this.itemDesc = itemDesc;
        this.contact=contact;
        this.name=name;
		this.userLocation = userLocation;
	}
	@Override
	public String toString() {
		return "LostItem [itemId=" + itemId + ", itemName=" + itemName
				+ ", itemDesc=" + itemDesc
				+ ", userLocation=" + userLocation +", contact="+ contact +",name="+name+"]";
	}
	
	
	
}
