package provisio;

public class acctBean {

    private int customer_id;
    private String first_name;
    private String last_name;
    private String email;
    private String password;
    private String password2;
    
    public int getCustomerID() {
    	return customer_id;
    }
    
    public String getFirstName() {
        return first_name;
    }
    public void setFirstName(String first_name) {
        this.first_name = first_name;
    }
    
    public String getLastName() {
        return last_name;
    }
    public void setLastName(String last_name) {
        this.last_name = last_name;
    }
    
    public String getEmail() {
    	return email;
    }
    public void setEmail(String email) {
    	this.email = email;
    }
    
    public String getPassword() {
    	return password;
    }
    
    public void setPassword(String password) {
    	this.password = password;
    }
    
    public String getPassword2() {
    	return password2;
    }
    
    public void setPassword2(String password2) {
    	this.password2 = password2;
    }
}