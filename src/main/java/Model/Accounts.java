package Model;

public class Accounts 
{
	private String email;
	private String password;
	private String role;
	public Accounts()
	{
		
	}
	public Accounts(String email, String password) 
	{
		super();
		this.email = email;
		this.password = password;
	}
	public Accounts(String email, String password, String role) 
	{
		super();
		this.email = email;
		this.password = password;
		this.role = role;
	}
	public String getEmail() 
	{
		return email;
	}
	public void setEmail(String email) 
	{
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) 
	{
		this.password = password;
	}
	public String getRole() 
	{
		return role;
	}
	public void setRole(String role) 
	{
		this.role = role;
	}
	
}
