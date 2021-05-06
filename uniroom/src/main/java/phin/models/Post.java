package phin.models;

import java.sql.Timestamp;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.NumberFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Post {
	
	private int pid;
	
	@NotEmpty(message="Tên bài đăng không được để trống!")
	@Size(max = 200, message = "Tên nhỏ hơn 200 ký tự!")
	private String pname;
	
	private String username;
	
	@NotEmpty(message="Mô tả không được để trống!")
	@Size(max = 950, message = "Mô tả nhỏ hơn 950 ký tự!")
	private String description;
	
	private Timestamp dateCreate;
	
	@NumberFormat
	@Min(value = 1, message = "Diện tích phải lớn hơn 0")
	private int area;
	
	private String picture;
	
	private int status;
	
	@NotEmpty(message="Địa chỉ không được để trống!")
	@Size(max = 200, message = "Địa chỉ nhỏ hơn 200 ký tự!")
	private String addDetail;
	
	@NumberFormat
	@Min(value = 1, message = "Giá phải lớn hơn 0")
	private int price;
	
	private Ward ward;
	
	private District district;
}
