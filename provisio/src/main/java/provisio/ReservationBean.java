package provisio;

public class ReservationBean extends createServlet {
	
	private static final long serialVersionUID = 1L;
	
	private int reservation_ID;
	private int hotel_ID;
	private String check_in;
	private String check_out;
	private String number_of_guest;
	private int customer_ID;
	private String location;
	private String room_size;
	private String[] amenities;
	private int loyalty_points;
	
	
	public ReservationBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ReservationBean(int reservation_ID, int hotel_ID, String check_in, String check_out, String number_of_guest, int customer_ID,
			String location, String room_size, String[] amenities, int loyalty_points) {
		super();
		this.reservation_ID = reservation_ID;
		this.hotel_ID = hotel_ID;
		this.check_in = check_in;
		this.check_out = check_out;
		this.number_of_guest = number_of_guest;
		this.customer_ID = customer_ID;
		this.location = location;
		this.room_size = room_size;
		this.amenities = amenities;
		this.loyalty_points = loyalty_points;
	}

	public int getReservation_ID() {
		return reservation_ID;
	}

	public void setReservation_ID(int reservation_ID) {
		this.reservation_ID = reservation_ID ;
	}
	
	public int getHotel_ID() {
		return hotel_ID;
	}

	public void setHotel_ID(int hotel_ID) {
		this.hotel_ID = hotel_ID;
	}

	public String getCheck_in() {
		return check_in;
	}

	public void setCheck_in(String check_in) {
		this.check_in = check_in;
	}

	public String getCheck_out() {
		return check_out;
	}

	public void setCheck_out(String check_out) {
		this.check_out = check_out;
	}

	public String getNumber_of_guest() {
		return number_of_guest;
	}

	public void setNumber_of_guest(String number_of_guest) {
		this.number_of_guest = number_of_guest;
	}

	public int getCustomer_ID() {
		return customer_ID;
	}

	public void setCustomer_ID(int customer_ID) {
		this.customer_ID = customer_ID;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getRoom_size() {
		return room_size;
	}

	public void setRoom_size(String room_size) {
		this.room_size = room_size;
	}

	public String[] getAmenities() {
		return amenities;
	}

	public void setAmenities(String[] amenities) {
		this.amenities = amenities;
	}

	public int getLoyalty_points() {
		return loyalty_points;
	}

	public void setLoyalty_points(int loyalty_points) {
		this.loyalty_points = loyalty_points;
	}
	
	public int calculatePoints(String check_in, String check_out) {
		char checkin_day1 = check_in.charAt(8);  // find the date's first number
		char checkin_day2 = check_in.charAt(9);  // find the date's second number 
		String checkin_day = Character.toString(checkin_day1) + Character.toString(checkin_day2);  // put date together

		char checkout_day1 = check_out.charAt(8);  // find the date's first num
		char checkout_day2 = check_out.charAt(9);  // find the date's second num
		String checkout_day = Character.toString(checkout_day1) + Character.toString(checkout_day2);  // put date together

		int points = (Integer.parseInt(checkout_day) - Integer.parseInt(checkin_day))*150;  // calculate loyalty points
		
		return points;
		
	}
	
	public String arrayToString(String[] amenities) {
		
		String amenities_string = " ";
		for(int i = 0; i < amenities.length;++i) {
			String addition = amenities[i].toString();
			amenities_string += addition + " ";
		}
		return amenities_string;
	}
	
	
	public int findHotel(String location) {
		if(location.equals("Atlanta GA")) {
			int hotel_ID = 404;
			return hotel_ID;
		}
		
		if(location.equals("Las Vegas, NV")) {
			int hotel_ID = 201;
			return hotel_ID;
		}
		
		if(location.equals("Chicago IL")) {
			int hotel_ID = 200 ;
			return hotel_ID;
		}
		
		return hotel_ID;
	}
	

	
}
