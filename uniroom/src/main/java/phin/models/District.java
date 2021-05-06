package phin.models;

import javax.validation.constraints.NotEmpty;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class District {
	
	private int did;
	
	@NotEmpty(message="Quận không được để trống!")
	private String dname;
}
