package phin.models;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class FeedBack {
	
	private int fid;
	
	@NotEmpty(message="Họ tên không được để trống!")
	@Size(max=200, message="Tên nhỏ hơn 200 ký tự!")
	private String fullname;
	
	@NotEmpty(message="Email không được để trống!")
	@Size(max=200, message="Email nhỏ hơn 200 ký tự!")
	private String email;
	
	@NotEmpty(message="Chủ đề không được để trống!")
	@Size(max=200, message="Chủ đề nhỏ hơn 200 ký tự!")
	private String subject;
	
	@NotEmpty(message="Nội dung không được để trống!")
	@Size(max=950, message="Nội dung nhỏ hơn 950 ký tự!")
	private String content;
}
