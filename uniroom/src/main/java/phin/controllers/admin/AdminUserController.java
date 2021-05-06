package phin.controllers.admin;

import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import phin.constant.GlobalConstant;
import phin.constant.URLConstant;
import phin.models.User;
import phin.service.UserService;
import phin.util.PageUtil;
import phin.util.StringUtil;

@Controller
@RequestMapping(value=URLConstant.URL_ADMIN_USER)
public class AdminUserController {
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Resource
	MessageSource messageSource;
	
	@Autowired
	private UserService userService;
	
	@GetMapping({URLConstant.INDEX, URLConstant.INDEX_PAGE})
	public String index(Model model, @PathVariable(required = false) Integer page) {
		if (page == null || page < 1) {
			page = 1;
		}
		int offset = PageUtil.getOffset(page);
		List<User> userList = userService.getAll(offset, GlobalConstant.TOTAL_ROW);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPage", PageUtil.getTotalPage(userService.totalRow()));
		model.addAttribute("userList", userList);
		return "admin.user.index";
	}
	
	@PostMapping(URLConstant.SEARCH)
	public String search(Model model, @RequestParam("search") String search, RedirectAttributes ra) {
		String searchStr = StringUtil.makeSearch(search);
		if ("".equals(searchStr)) {
			ra.addFlashAttribute("msg", messageSource.getMessage("msg.searchnull", null, Locale.getDefault()));
			return "redirect:/admin/user/index";
		}
		List<User> userListSearch = userService.findByName(searchStr);
		model.addAttribute("userListSearch", userListSearch);
		model.addAttribute("search", search);
		return "admin.user.index";
	}
	
	@GetMapping(URLConstant.ADD)
	public String add() {
		return "admin.user.add";
	}
	
	@PostMapping(URLConstant.ADD)
	public String add(@Valid @ModelAttribute("user") User user, BindingResult rs, 
			RedirectAttributes ra, Model model) {
		if (rs.hasErrors()) {
			model.addAttribute("user", user);
			return "admin.user.add";
		}
		//trungten
		List<User> userByName = userService.getByName(user.getUsername());
		if (userByName.size() > 0) {
			model.addAttribute("user", user);
			model.addAttribute("msg", messageSource.getMessage("msg.trungten", null, Locale.getDefault()));
			return "admin.user.add";
		}
		user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
		if (userService.save(user) > 0) {
			ra.addFlashAttribute("msg", messageSource.getMessage("msg.success", null, Locale.getDefault()));
			return "redirect:/admin/user/index";
		}
		ra.addFlashAttribute("msg", messageSource.getMessage("msg.fail", null, Locale.getDefault()));
		return "admin.user.add";
	}
	
	@GetMapping(URLConstant.DELETE_ID)
	public String del(@PathVariable Integer id, RedirectAttributes ra) {
		if (userService.del(id) > 0) {
			ra.addFlashAttribute("msg", messageSource.getMessage("msg.success", null, Locale.getDefault()));
			return "redirect:/admin/user/index";
		}
		ra.addFlashAttribute("msg", messageSource.getMessage("msg.fail", null, Locale.getDefault()));
		return "redirect:/admin/user/index";
	}
	
	@GetMapping(URLConstant.EDIT_ID)
	public String edit(@PathVariable Integer id, Model model) {
		model.addAttribute("user", userService.findById(id));
		return "admin.user.edit";
	}
	
	@PostMapping(URLConstant.EDIT)
	public String edit(@Valid @ModelAttribute("user") User user, BindingResult rs, 
			RedirectAttributes ra, Model model) {
		if (rs.hasErrors()) {
			model.addAttribute("user", user);
			return "admin.user.edit";
		}
		//trungten
		List<User> userByName = userService.getByName(user.getUsername());
		User userById = userService.findById(user.getId());
		if (userByName.size() > 0 && !user.getUsername().equals(userById.getUsername())) {
			model.addAttribute("user", user);
			model.addAttribute("msg", messageSource.getMessage("msg.trungten", null, Locale.getDefault()));
			return "admin.user.edit";
		}
		if (userById.getPassword().equals(user.getPassword())) {
			user.setPassword(userById.getPassword());
		} else {
			user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
		}
		if (userService.update(user) > 0) {
			ra.addFlashAttribute("msg", messageSource.getMessage("msg.success", null, Locale.getDefault()));
			return "redirect:/admin/user/index";
		}
		model.addAttribute("user", user);
		ra.addFlashAttribute("msg", messageSource.getMessage("msg.fail", null, Locale.getDefault()));
		return "admin.user.edit";
	}
}
