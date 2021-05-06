package phin.controllers.admin;

import java.sql.Date;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
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

import phin.constant.GlobalConstant;
import phin.constant.URLConstant;
import phin.models.District;
import phin.models.Mail;
import phin.models.Post;
import phin.service.DistrictWardService;
import phin.service.MailService;
import phin.service.PostService;
import phin.util.FileUtil;
import phin.util.PageUtil;
import phin.util.StringUtil;

@Controller
@RequestMapping(value=URLConstant.URL_ADMIN_POST)
public class AdminPostController {
	
	@Autowired
	public JavaMailSender emailSender;
	
	@Resource
	MessageSource messageSource;
	
	@Autowired
	private DistrictWardService districtWardService;
	
	@Autowired
	private PostService postService;
	
	@Autowired
	private MailService mailService;
	
	@GetMapping({URLConstant.INDEX, URLConstant.INDEX_PAGE})
	public String index(Model model, @PathVariable(required = false) Integer page) {
		if (page == null || page < 1) {
			page = 1;
		}
		int offset = PageUtil.getOffset(page);
		List<Post> postList = postService.getAll(offset, GlobalConstant.TOTAL_ROW);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPage", PageUtil.getTotalPage(postService.totalRow()));
		model.addAttribute("postList", postList);
		return "admin.post.index";
	}
	
	@PostMapping(URLConstant.SEARCH)
	public String search(Model model, @RequestParam("search") String search, RedirectAttributes ra) {
		String searchStr = StringUtil.makeSearch(search);
		if ("".equals(searchStr)) {
			ra.addFlashAttribute("msg", messageSource.getMessage("msg.searchnull", null, Locale.getDefault()));
			return "redirect:/admin/post/index";
		}
		List<Post> postListSearch = postService.findByName(searchStr);
		model.addAttribute("postListSearch", postListSearch);
		model.addAttribute("search", search);
		return "admin.post.index";
	}
	
	@PostMapping(URLConstant.STATISTIC)
	public String statistic(Model model, @RequestParam("datebegin") Date datebegin, 
			@RequestParam("dateend") Date dateend, RedirectAttributes ra) {
		if (dateend.compareTo(datebegin) < 0) {
			ra.addFlashAttribute("msg", messageSource.getMessage("msg.dateerror", null, Locale.getDefault()));
			return "redirect:/admin/post/index";
		}
		if (dateend.compareTo(datebegin) == 0) {
			List<Post> postListStatistic = postService.statisticPost(datebegin);
			model.addAttribute("postListStatistic", postListStatistic);
			model.addAttribute("datebegin", datebegin);
			model.addAttribute("dateend", dateend);
			return "admin.post.index";
		}
		List<Post> postListStatistic = postService.statisticPost(datebegin, dateend);
		model.addAttribute("postListStatistic", postListStatistic);
		model.addAttribute("datebegin", datebegin);
		model.addAttribute("dateend", dateend);
		return "admin.post.index";
	}
	
	@GetMapping(URLConstant.ADD)
	public String add(Model model) {
		List<District> districtList = districtWardService.getDistrictList();
		model.addAttribute("districtList", districtList);
		return "admin.post.add";
	}
	
	@PostMapping(URLConstant.ADD)
	public String add(@Valid @ModelAttribute("post") Post post, BindingResult rs, @RequestParam("file") MultipartFile file, 
			RedirectAttributes ra, HttpServletRequest request, Model model) {
		if (rs.hasErrors()) {
			List<District> districtList = districtWardService.getDistrictList();
			model.addAttribute("districtList", districtList);
			model.addAttribute("post", post);
			return "admin.post.add";
		}
		//trungten
		List<Post> postByName = postService.getByName(post.getPname());
		if (postByName.size() > 0) {
			List<District> districtList = districtWardService.getDistrictList();
			model.addAttribute("districtList", districtList);
			model.addAttribute("post", post);
			model.addAttribute("msg", messageSource.getMessage("msg.trungten", null, Locale.getDefault()));
			return "admin.post.add";
		}
		String fileName = FileUtil.upload(file, request);
		post.setPicture(fileName);
		if (postService.save(post) > 0) {
			ra.addFlashAttribute("msg", messageSource.getMessage("msg.success", null, Locale.getDefault()));
			return "redirect:/admin/index";
		}
		ra.addFlashAttribute("msg", messageSource.getMessage("msg.fail", null, Locale.getDefault()));
		return "redirect:/admin/index";
	}
	
	@GetMapping(URLConstant.DELETE_ID)
	public String del(@PathVariable(required = true) Integer id, RedirectAttributes ra) {
		if (postService.del(id) > 0) {
			ra.addFlashAttribute("msg", messageSource.getMessage("msg.success", null, Locale.getDefault()));
			return "redirect:/admin/post/index";
		}
		ra.addFlashAttribute("msg", messageSource.getMessage("msg.fail", null, Locale.getDefault()));
		return "redirect:/admin/post/index";
	}
	
	@GetMapping(URLConstant.UP)
	public String up(@PathVariable(required = true) Integer id, RedirectAttributes ra) {
		if (postService.up(id) > 0) {
			Post post = postService.findById(id);
			List<Mail> mailList = mailService.getAll();
			for (Mail mail : mailList) {
				if (mail.getDid() == post.getDistrict().getDid()) {
					SimpleMailMessage message = new SimpleMailMessage();
					message.setTo(mail.getEmail());
					message.setSubject("Find rooms at Uniroom!");
					message.setText("There is a new post in "+ StringUtil.removeAccent(post.getDistrict().getDname()) +" District \n"
							+ " Link: http://phinuniroom.j.layershift.co.uk/detail/phin-"+id+".html");
					emailSender.send(message);
				}
			}
			ra.addFlashAttribute("msg", messageSource.getMessage("msg.success", null, Locale.getDefault()));
			return "redirect:/admin/post/index";
		}
		ra.addFlashAttribute("msg", messageSource.getMessage("msg.fail", null, Locale.getDefault()));
		return "redirect:/admin/post/index";
	}
	
	@GetMapping(URLConstant.CANCEL)
	public String cancel(@PathVariable(required = true) Integer id, RedirectAttributes ra) {
		if (postService.cancel(id) > 0) {
			ra.addFlashAttribute("msg", messageSource.getMessage("msg.success", null, Locale.getDefault()));
			return "redirect:/admin/post/index";
		}
		ra.addFlashAttribute("msg", messageSource.getMessage("msg.fail", null, Locale.getDefault()));
		return "redirect:/admin/post/index";
	}
	
	@GetMapping(URLConstant.EDIT_ID)
	public String edit(@PathVariable Integer id, Model model) {
		List<District> districtList = districtWardService.getDistrictList();
		model.addAttribute("districtList", districtList);
		model.addAttribute("post", postService.findById(id));
		return "admin.post.edit";
	}
	
	@PostMapping(URLConstant.EDIT)
	public String edit(@Valid @ModelAttribute("post") Post post, BindingResult rs, HttpServletRequest request,
			RedirectAttributes ra, @RequestParam("file") MultipartFile file, Model model) {
		if (rs.hasErrors()) {
			List<District> districtList = districtWardService.getDistrictList();
			model.addAttribute("districtList", districtList);
			model.addAttribute("post", post);
			return "admin.post.edit";
		}
		//trungten
		List<Post> postByName = postService.getByName(post.getPname());
		Post postById = postService.findById(post.getPid());
		if (postByName.size() > 0 && !post.getPname().equals(postById.getPname())) {
			List<District> districtList = districtWardService.getDistrictList();
			model.addAttribute("districtList", districtList);
			model.addAttribute("post", post);
			model.addAttribute("msg", messageSource.getMessage("msg.trungten", null, Locale.getDefault()));
			return "admin.post.edit";
		}
		if (!file.isEmpty()) {
			String fileName = FileUtil.upload(file, request);
			post.setPicture(fileName);
		}
		if (postService.update(post) > 0) {
			ra.addFlashAttribute("msg", messageSource.getMessage("msg.success", null, Locale.getDefault()));
			return "redirect:/admin/post/index";
		}
		ra.addFlashAttribute("msg", messageSource.getMessage("msg.fail", null, Locale.getDefault()));
		return "redirect:/admin/post/index";
	}
}
