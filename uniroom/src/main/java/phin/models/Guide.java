package phin.models;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
@AllArgsConstructor
public class Guide {
	
	private int gid;
	
	@NotEmpty(message="Tên không được để trống!")
	@Size(max=200, message="Tên quá dài!")
	private String gname;
	
	@NotEmpty(message="Nội dung không được để trống!")
	@Size(max=8900, message="Nội dung quá dài!")
	private String content;
}
