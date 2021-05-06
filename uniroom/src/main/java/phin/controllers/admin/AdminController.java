package phin.controllers.admin;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import phin.models.User;
import phin.service.GuideService;
import phin.service.PostService;
import phin.service.UserService;

@RequestMapping("admin")
@Controller
public class AdminController {
	
	@Autowired
	private GuideService guideService;
	
	@Autowired
	private PostService postService;
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/index")
	public String index(Model model, HttpSession session) {
		Authentication loggedInUser = SecurityContextHolder.getContext().getAuthentication();
		String username = loggedInUser.getName();
		User userInf = userService.login(username);
		session.setAttribute("userInf", userInf);
		int totalGuide = guideService.totalRow();
		int totalPost = postService.totalRow();
		int totalUser = userService.totalRow();
		model.addAttribute("totalGuide", totalGuide);
		model.addAttribute("totalPost", totalPost);
		model.addAttribute("totalUser", totalUser);
		return "admin.index";
	}
	
	@GetMapping("/indexuser")
	public String indexuser(Model model, HttpSession session) {
		Authentication loggedInUser = SecurityContextHolder.getContext().getAuthentication();
		String username = loggedInUser.getName();
		User userInf = userService.login(username);
		session.setAttribute("userInf", userInf);
		int totalPost = postService.totalRowUser(username);
		model.addAttribute("totalPost", totalPost);
		return "admin.indexuser";
	}
}
