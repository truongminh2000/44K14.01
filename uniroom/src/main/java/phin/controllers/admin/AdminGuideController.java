package phin.controllers.admin;

import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
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
import phin.models.Guide;
import phin.service.GuideService;
import phin.util.PageUtil;
import phin.util.StringUtil;

@Controller
@RequestMapping(value=URLConstant.URL_ADMIN_GUIDE)
public class AdminGuideController {
	
	@Resource
	MessageSource messageSource;
	
	@Autowired
	private GuideService guideService;
	
	@GetMapping({URLConstant.INDEX, URLConstant.INDEX_PAGE})
	public String index(Model model, @PathVariable(required = false) Integer page) {
		if (page == null || page < 1) {
			page = 1;
		}
		int offset = PageUtil.getOffset(page);
		List<Guide> guideList = guideService.getAll(offset, GlobalConstant.TOTAL_ROW);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPage", PageUtil.getTotalPage(guideService.totalRow()));
		model.addAttribute("guideList", guideList);
		return "admin.guide.index";
	}
	
	@PostMapping(URLConstant.SEARCH)
	public String search(Model model, @RequestParam("search") String search, RedirectAttributes ra) {
		String searchStr = StringUtil.makeSearch(search);
		if ("".equals(searchStr)) {
			ra.addFlashAttribute("msg", messageSource.getMessage("msg.searchnull", null, Locale.getDefault()));
			return "redirect:/admin/guide/index";
		}
		List<Guide> guideListSearch = guideService.findByName(searchStr);
		model.addAttribute("guideListSearch", guideListSearch);
		model.addAttribute("search", search);
		return "admin.guide.index";
	}
	
	@GetMapping(URLConstant.ADD)
	public String add() {
		return "admin.guide.add";
	}
	
	@PostMapping(URLConstant.ADD)
	public String add(@Valid @ModelAttribute("guide") Guide guide, BindingResult rs, 
			RedirectAttributes ra, Model model) {
		if (rs.hasErrors()) {
			model.addAttribute("guide", guide);
			return "admin.guide.add";
		}
		//trungten
		List<Guide> guideByName = guideService.getByName(guide.getGname());
		if (guideByName.size() > 0) {
			model.addAttribute("guide", guide);
			model.addAttribute("msg", messageSource.getMessage("msg.trungten", null, Locale.getDefault()));
			return "admin.guide.add";
		}
		if (guideService.save(guide) > 0) {
			ra.addFlashAttribute("msg", messageSource.getMessage("msg.success", null, Locale.getDefault()));
			return "redirect:/admin/guide/index";
		}
		ra.addFlashAttribute("msg", messageSource.getMessage("msg.fail", null, Locale.getDefault()));
		return "admin.guide.add";
	}
	
	@GetMapping(URLConstant.DELETE_ID)
	public String del(@PathVariable Integer id, RedirectAttributes ra) {
		if (guideService.del(id) > 0) {
			ra.addFlashAttribute("msg", messageSource.getMessage("msg.success", null, Locale.getDefault()));
			return "redirect:/admin/guide/index";
		}
		ra.addFlashAttribute("msg", messageSource.getMessage("msg.fail", null, Locale.getDefault()));
		return "redirect:/admin/guide/index";
	}
	
	@GetMapping(URLConstant.EDIT_ID)
	public String edit(@PathVariable Integer id, Model model) {
		model.addAttribute("guide", guideService.findById(id));
		return "admin.guide.edit";
	}
	
	@PostMapping(URLConstant.EDIT)
	public String edit(@Valid @ModelAttribute("guide") Guide guide, BindingResult rs, 
			RedirectAttributes ra, Model model) {
		if (rs.hasErrors()) {
			model.addAttribute("guide", guide);
			return "admin.guide.edit";
		}
		//trungten
		List<Guide> guideByName = guideService.getByName(guide.getGname());
		Guide guideById = guideService.findById(guide.getGid());
		if (guideByName.size() > 0 && !guide.getGname().equals(guideById.getGname())) {
			model.addAttribute("guide", guide);
			model.addAttribute("msg", messageSource.getMessage("msg.trungten", null, Locale.getDefault()));
			return "admin.guide.edit";
		}
		if (guideService.update(guide) > 0) {
			ra.addFlashAttribute("msg", messageSource.getMessage("msg.success", null, Locale.getDefault()));
			return "redirect:/admin/guide/index";
		}
		model.addAttribute("guide", guide);
		ra.addFlashAttribute("msg", messageSource.getMessage("msg.fail", null, Locale.getDefault()));
		return "admin.guide.edit";
	}
}
