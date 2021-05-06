package phin.controllers.auth;

import java.util.List;
import java.util.Locale;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import phin.constant.URLConstant;
import phin.models.District;
import phin.models.User;
import phin.service.DistrictWardService;
import phin.service.UserService;

@Controller
@RequestMapping(URLConstant.AUTH)
public class AuthController {
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Autowired
	private DistrictWardService districtWardService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	MessageSource messageSource;
	
	@GetMapping(URLConstant.LOGIN)
	public String login() {
		return "auth.login";
	}
	
	/*@PostMapping(URLConstant.LOGIN)
	public String login(@RequestParam("username") String username, @RequestParam("password") String password,
						RedirectAttributes ra, HttpSession session) {
		User user = userService.login(username, password);
		if (user == null) {
			ra.addFlashAttribute("msg", messageSource.getMessage("msg.loginfail", null, Locale.getDefault()));
			return "redirect:auth/login";
		}
		session.setAttribute("user", user);
		return "admin.index";
	}*/
	
	@GetMapping(URLConstant.SIGNUP)
	public String signup(Model model) {
		List<District> districtList = districtWardService.getDistrictList();
		model.addAttribute("districtList", districtList);
		return "auth.signup";
	}
	
	@PostMapping(URLConstant.SIGNUP)
	public String signup(@Valid @ModelAttribute("user") User user, BindingResult rs, 
			RedirectAttributes ra, Model model) {
		if (rs.hasErrors()) {
			List<District> districtList = districtWardService.getDistrictList();
			model.addAttribute("districtList", districtList);
			model.addAttribute("user", user);
			return "uniroom.index";
		}
		//trungten
		List<User> userByName = userService.getByName(user.getUsername());
		if (userByName.size() > 0) {
			List<District> districtList = districtWardService.getDistrictList();
			model.addAttribute("districtList", districtList);
			model.addAttribute("user", user);
			model.addAttribute("msg", messageSource.getMessage("msg.trungten", null, Locale.getDefault()));
			return "auth.signup";
		}
		user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
		if (userService.save(user) > 0) {
			ra.addFlashAttribute("msg", messageSource.getMessage("msg.checkmail", null, Locale.getDefault()));
			return "redirect:/auth/signup";
		}
		ra.addFlashAttribute("msg", messageSource.getMessage("msg.fail", null, Locale.getDefault()));
		return "redirect:/auth/signup";
	}
}