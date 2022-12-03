package provisio;
import java.time.YearMonth;

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
	
	public static int getNumberOfDaysInMonth(int year,int month)
    {
        YearMonth yearMonthObject = YearMonth.of(year, month);
        int daysInMonth = yearMonthObject.lengthOfMonth();
        return daysInMonth;
    }
	
	
	// pass in the month to find out how many days are in month
	public int calculatePoints(String check_in, String check_out) {
		
		int points = 0;
		
		char checkin_day1 = check_in.charAt(8);  // find the date's first number
		char checkin_day2 = check_in.charAt(9);  // find the date's second number 
		String checkin_day = Character.toString(checkin_day1) + Character.toString(checkin_day2);  // put date together

		char checkout_day1 = check_out.charAt(8);  // find the date's first num
		char checkout_day2 = check_out.charAt(9);  // find the date's second num
		String checkout_day = Character.toString(checkout_day1) + Character.toString(checkout_day2);  // put date together

		char checkin_month1 = check_in.charAt(5);
		char checkin_month2 = check_in.charAt(6);
		String checkin_month = Character.toString(checkin_month1) + Character.toString(checkin_month2);
		int checkin_monthint = Integer.parseInt(checkin_month); // convert checkin month to integer to pass to numofdaysinmonth function
		
		char checkin_year1 = check_in.charAt(0);
		char checkin_year2 = check_in.charAt(1);
		char checkin_year3 = check_in.charAt(2);
		char checkin_year4 = check_in.charAt(3);
		String checkin_year = Character.toString(checkin_year1) + Character.toString(checkin_year2)+ Character.toString(checkin_year3)+ Character.toString(checkin_year4);  // put date together
		int checkin_yearint = Integer.parseInt(checkin_year); // convert checkin month to integer to pass to numofdaysinmonth function
		
	
		
		if(Integer.parseInt(checkout_day) > Integer.parseInt(checkin_day)) {
			points = (Integer.parseInt(checkout_day) - Integer.parseInt(checkin_day))*150;  // calculate loyalty points
			return points;
		}
		
		
		if(Integer.parseInt(checkout_day) < Integer.parseInt(checkin_day)) {
			int numberOfDaysInCheckinMonth = getNumberOfDaysInMonth(checkin_yearint, checkin_monthint);
	
			
			int part1 = (numberOfDaysInCheckinMonth) - (Integer.parseInt(checkin_day)) + 1;
			int part2 = (Integer.parseInt(checkout_day) - 1);
			points = (part1 + part2) * 150;
			return points;
		
		}
		
		return points;
		
		
	}
	public String arrayToString(String[] amenities) {
		
		String amenities_string = " ";
		for(int i = 0; i < amenities.length;++i) {
			String addition = amenities[i].toString();
			amenities_string += addition;
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

/*
 * helpful source for getting days in month
 * https://java2blog.com/get-number-of-days-month-java/#:~:text=You%20can%20use%20LocalDate%20's,days%20in%20Month%20in%20java.
 */
