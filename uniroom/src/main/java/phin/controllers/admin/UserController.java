package phin.controllers.admin;

import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import phin.constant.URLConstant;
import phin.models.District;
import phin.models.Post;
import phin.models.User;
import phin.service.DistrictWardService;
import phin.service.PostService;
import phin.service.UserService;
import phin.util.FileUtil;

@Controller
@RequestMapping("admin/indexuser")
public class UserController {
	
	@Autowired
	public JavaMailSender emailSender;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private DistrictWardService districtWardService;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Resource
	MessageSource messageSource;
	
	@Autowired
	private PostService postService;
	
	@GetMapping(URLConstant.POST_INDEX_USER)
	public String index(Model model, @PathVariable(required = true) String username, 
				RedirectAttributes ra) {
		Authentication loggedInUser = SecurityContextHolder.getContext().getAuthentication();
		if (!loggedInUser.getName().equals(username)) {
			ra.addFlashAttribute("msg", messageSource.getMessage("msg.fail", null, Locale.getDefault()));
			return "redirect:/user/index.html";
		}
		List<Post> postUserList = postService.getAllUser(username);
		model.addAttribute("postUserList", postUserList);
		return "admin.indexuser.post.index";
	}
	
	@GetMapping("/post/add")
	public String add(Model model) {
		List<District> districtList = districtWardService.getDistrictList();
		model.addAttribute("districtList", districtList);
		return "admin.indexuser.post.add";
	}
	
	@PostMapping("/post/add")
	public String add(@Valid @ModelAttribute("post") Post post, BindingResult rs, @RequestParam("file") MultipartFile file, 
			RedirectAttributes ra, HttpServletRequest request, Model model) {
		if (rs.hasErrors()) {
			List<District> districtList = districtWardService.getDistrictList();
			model.addAttribute("districtList", districtList);
			model.addAttribute("post", post);
			return "admin.indexuser.post.add";
		}
		//trungten
		List<Post> postByName = postService.getByName(post.getPname());
		if (postByName.size() > 0) {
			List<District> districtList = districtWardService.getDistrictList();
			model.addAttribute("districtList", districtList);
			model.addAttribute("post", post);
			model.addAttribute("msg", messageSource.getMessage("msg.trungten", null, Locale.getDefault()));
			return "admin.indexuser.post.add";
		}
		String fileName = FileUtil.upload(file, request);
		post.setPicture(fileName);
		if (postService.save(post) > 0) {
			ra.addFlashAttribute("msg", messageSource.getMessage("msg.success", null, Locale.getDefault()));
			return "redirect:/user/index.html";
		}
		ra.addFlashAttribute("msg", messageSource.getMessage("msg.fail", null, Locale.getDefault()));
		return "redirect:/user/index.html";
	}
	
	@GetMapping("/post/del/{username}/{id}")
	public String del(@PathVariable(required = true) Integer id, @PathVariable(required = true) String username, 
			RedirectAttributes ra) {
		Post post = postService.findById(id);
		if (!username.equals(post.getUsername())) {
			ra.addFlashAttribute("msg", messageSource.getMessage("msg.fail", null, Locale.getDefault()));
			return "redirect:/admin/indexuser/post/{username}";
		}
		if (postService.del(id) > 0) {
			ra.addFlashAttribute("msg", messageSource.getMessage("msg.success", null, Locale.getDefault()));
			return "redirect:/user/post/{username}/index.html";
		}
		ra.addFlashAttribute("msg", messageSource.getMessage("msg.fail", null, Locale.getDefault()));
		return "redirect:/user/post/{username}/index.html";
	}
	
	@GetMapping("/post/edit/{username}/{id}")
	public String edit(@PathVariable Integer id, Model model, RedirectAttributes ra,
			@PathVariable(required = true) String username) {
		Post post = postService.findById(id);
		if (post == null) {
			ra.addFlashAttribute("msg", messageSource.getMessage("msg.fail", null, Locale.getDefault()));
			return "redirect:/user/index.html";
		}
		if (!username.equals(post.getUsername())) {
			ra.addFlashAttribute("msg", messageSource.getMessage("msg.fail", null, Locale.getDefault()));
			return "redirect:/user/index.html";
		}
		List<District> districtList = districtWardService.getDistrictList();
		model.addAttribute("districtList", districtList);
		model.addAttribute("post", post);
		return "admin.indexuser.post.edit";
	}
	
	@PostMapping("/post/edit")
	public String edit(@Valid @ModelAttribute("post") Post post, BindingResult rs, HttpServletRequest request,
			RedirectAttributes ra, @RequestParam("file") MultipartFile file, Model model) {
		if (rs.hasErrors()) {
			List<District> districtList = districtWardService.getDistrictList();
			model.addAttribute("districtList", districtList);
			model.addAttribute("post", post);
			return "admin.indexuser.post.edit";
		}
		//trungten
		List<Post> postByName = postService.getByName(post.getPname());
		Post postById = postService.findById(post.getPid());
		if (postByName.size() > 0 && !post.getPname().equals(postById.getPname())) {
			List<District> districtList = districtWardService.getDistrictList();
			model.addAttribute("districtList", districtList);
			model.addAttribute("post", post);
			model.addAttribute("msg", messageSource.getMessage("msg.trungten", null, Locale.getDefault()));
			return "admin.indexuser.post.edit";
		}
		if (!file.isEmpty()) {
			String fileName = FileUtil.upload(file, request);
			post.setPicture(fileName);
		}
		if (postService.update(post) > 0) {
			ra.addFlashAttribute("msg", messageSource.getMessage("msg.success", null, Locale.getDefault()));
			return "redirect:/user/post/"+post.getUsername()+"/index.html";
		}
		ra.addFlashAttribute("msg", messageSource.getMessage("msg.fail", null, Locale.getDefault()));
		return "redirect:/user/post/"+post.getUsername()+"/index.html";
	}
	
	@GetMapping("/user/edit/{username}/{id}")
	public String edit(@PathVariable(required = true) Integer id, RedirectAttributes ra,
					@PathVariable(required = true) String username, Model model) {
		User user = userService.findById(id);
		if (user == null) {
			ra.addFlashAttribute("msg", messageSource.getMessage("msg.fail", null, Locale.getDefault()));
			return "redirect:/user/index.html";
		}
		if (!username.equals(user.getUsername())) {
			ra.addFlashAttribute("msg", messageSource.getMessage("msg.fail", null, Locale.getDefault()));
			return "redirect:/user/index.html";
		}
		model.addAttribute("user", user);
		return "admin.indexuser.user.edit";
	}
	
	@PostMapping("/user/edit")
	public String edit(@Valid @ModelAttribute("user") User user, BindingResult rs, 
			RedirectAttributes ra, Model model) {
		if (rs.hasErrors()) {
			model.addAttribute("user", user);
			return "admin.indexuser.user.edit";
		}
		//trungten
		List<User> userByName = userService.getByName(user.getUsername());
		User userById = userService.findById(user.getId());
		if (userByName.size() > 0 && !user.getUsername().equals(userById.getUsername())) {
			model.addAttribute("user", user);
			model.addAttribute("msg", messageSource.getMessage("msg.trungten", null, Locale.getDefault()));
			return "admin.indexuser.user.edit";
		}
		if (userById.getPassword().equals(user.getPassword())) {
			user.setPassword(userById.getPassword());
		} else {
			user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
		}
		if (userService.update(user) > 0) {
			ra.addFlashAttribute("msg", messageSource.getMessage("msg.editusersuccess", null, Locale.getDefault()));
			return "redirect:/auth/logout";
		}
		model.addAttribute("user", user);
		ra.addFlashAttribute("msg", messageSource.getMessage("msg.fail", null, Locale.getDefault()));
		return "redirect:/user/index.html";
	}
}
