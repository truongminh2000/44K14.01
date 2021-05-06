package phin.models;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {
	
	private int id;
	
	@Size(min=4, max=200, message = "Tên đăng nhập từ 5 - 200 ký tự!")
	@NotEmpty(message="Tên đăng nhập không được để trống!")
	private String username;
	
	@NotEmpty(message="Tên đầy đủ không được để trống!")
	@Size(max=200, message="Tên nhỏ hơn 200 ký tự!")
	private String fullname;
	
	@Size(min=4, max=200, message="Mật khẩu phải từ 5 - 200 ký tự trở lên!")
	@NotEmpty(message="Mật khẩu không được để trống!")
	private String password;
	
	private int roleId;
	
	private int enabled;
}
