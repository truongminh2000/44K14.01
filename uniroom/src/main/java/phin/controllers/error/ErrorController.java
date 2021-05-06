package phin.controllers.error;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import phin.constant.URLConstant;

@Controller
@RequestMapping(URLConstant.ERROR)
public class ErrorController {
	
	@GetMapping(URLConstant.STATUS_403)
	public String error403() {
		return "error.403";
	}
}
