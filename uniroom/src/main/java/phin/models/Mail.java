package phin.models;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Mail {
	
	private int id;
	
	@Size(max=200, message="Email nhỏ hơn 200 ký tự!")
	@NotEmpty(message="Họ tên không được để trống!")
	private String email;
	
	@Min(value=1, message="Vui lòng chọn quận!")
	private int did;
}
