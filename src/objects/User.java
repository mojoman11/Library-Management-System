package objects;

/**
 *
 * @author MAHE
 */
public class User {

    private String email;
    private String password;
    private String type;
    private String name;
    private int memId;
    
    
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
	
	public String getType() {
		return type;
	}
	
	public void setType(String type) {
		this.type = type;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public int getMemId() {
		return memId;
	}
	
	public void setMemId(int memId) {
		this.memId = memId;
	}
    

}
