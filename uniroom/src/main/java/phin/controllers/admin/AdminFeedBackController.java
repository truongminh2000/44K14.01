package phin.controllers.admin;

import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import phin.constant.GlobalConstant;
import phin.constant.URLConstant;
import phin.models.FeedBack;
import phin.service.FeedBackService;
import phin.util.PageUtil;
import phin.util.StringUtil;

@Controller
@RequestMapping(value=URLConstant.URL_ADMIN_FEEDBACK)
public class AdminFeedBackController {
	
	@Resource
	MessageSource messageSource;
	
	@Autowired
	private FeedBackService feedBackService;
	
	@GetMapping({URLConstant.INDEX, URLConstant.INDEX_PAGE})
	public String index(Model model, @PathVariable(required = false) Integer page) {
		if (page == null || page < 1) {
			page = 1;
		}
		int offset = PageUtil.getOffset(page);
		List<FeedBack> feedBackList = feedBackService.getAll(offset, GlobalConstant.TOTAL_ROW);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPage", PageUtil.getTotalPage(feedBackService.totalRow()));
		model.addAttribute("feedBackList", feedBackList);
		return "admin.feedback.index";
	}
	
	@PostMapping(URLConstant.SEARCH)
	public String search(Model model, @RequestParam("search") String search, RedirectAttributes ra) {
		String searchStr = StringUtil.makeSearch(search);
		if ("".equals(searchStr)) {
			ra.addFlashAttribute("msg", messageSource.getMessage("msg.searchnull", null, Locale.getDefault()));
			return "redirect:/admin/feedback/index";
		}
		List<FeedBack> feedBackListSearch = feedBackService.findByName(searchStr);
		model.addAttribute("feedBackListSearch", feedBackListSearch);
		model.addAttribute("search", search);
		return "admin.feedback.index";
	}
	
	@GetMapping(URLConstant.DELETE_ID)
	public String del(@PathVariable Integer id, RedirectAttributes ra) {
		if (feedBackService.del(id) > 0) {
			ra.addFlashAttribute("msg", messageSource.getMessage("msg.success", null, Locale.getDefault()));
			return "redirect:/admin/feedback/index";
		}
		ra.addFlashAttribute("msg", messageSource.getMessage("msg.fail", null, Locale.getDefault()));
		return "redirect:/admin/feedback/index";
	}
}
