package provisio;

public class HotelBean {

	private int hotel_ID;
	private String hotel_name;
	private String address;
	
	public int getHotel_ID() {
		return hotel_ID;
	}
	public void setHotel_ID(int hotel_ID) {
		this.hotel_ID = hotel_ID;
	}
	public String getHotel_name() {
		return hotel_name;
	}
	public void setHotel_name(String hotel_name) {
		this.hotel_name = hotel_name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	public int findHotelId(String location) {
		
		if(location.equals("Atlanta GA")) {
			int hotel_ID = 404;
			return hotel_ID;
		}
		
		if(location.equals("Las Vegas, NV")) {
			int hotel_ID = 201;
			return hotel_ID;
		}
		
		if(location.equals("Chicago, IL")) {
			int hotel_ID = 200 ;
			return hotel_ID;
		}
		
		return hotel_ID;
	}
	
}



/*
	hotel_ID int NOT NULL,
    hotel_name varchar(255) NOT NULL,
    address varchar(255) NOT NULL,
    CONSTRAINT hotel_pk PRIMARY KEY (hotel_ID)
    
*/
