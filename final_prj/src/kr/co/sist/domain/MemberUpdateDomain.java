package kr.co.sist.domain;

public class MemberUpdateDomain {
	private String name,birth,phone,email,nick,gender;

	public MemberUpdateDomain() {
		super();
	}
	

	public MemberUpdateDomain(String name, String birth, String phone, String email, String nick, String gender) {
		super();
		this.name = name;
		this.birth = birth;
		this.phone = phone;
		this.email = email;
		this.nick = nick;
		this.gender = gender;
	}


	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}
	
}
