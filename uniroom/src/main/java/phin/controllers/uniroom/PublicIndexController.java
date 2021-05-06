package phin.controllers.uniroom;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import phin.constant.GlobalConstant;
import phin.constant.URLConstant;
import phin.models.District;
import phin.models.FeedBack;
import phin.models.Guide;
import phin.models.Post;
import phin.models.University;
import phin.models.Ward;
import phin.service.DistrictWardService;
import phin.service.FeedBackService;
import phin.service.GuideService;
import phin.service.PostService;
import phin.util.FileUtil;
import phin.util.PageUtil;
import phin.util.PriceUtil;
import phin.util.UniversityUtil;

@Controller
public class PublicIndexController {
	
	@Resource
	MessageSource messageSource;
	
	@Autowired
	private GuideService guideService;
	
	@Autowired
	private DistrictWardService districtWardService;
	
	@Autowired
	private FeedBackService feedBackService;
	
	@Autowired
	private PostService postService;
	
	@GetMapping({URLConstant.INDEX, URLConstant.INDEX_PAGE})
	public String index(Model model, @PathVariable(required = false) Integer page) {
		if (page == null || page < 1) {
			page = 1;
		}
		int offset = PageUtil.getOffset(page);
		List<District> districtList = districtWardService.getDistrictList();
		List<Post> postList = postService.getAllPublic(offset, GlobalConstant.TOTAL_ROW);
		List<University> uniList = districtWardService.getUniList();
		model.addAttribute("uniList", uniList);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPage", PageUtil.getTotalPage(postService.totalRowPublic()));
		model.addAttribute("postList", postList);
		model.addAttribute("districtList", districtList);
		return "uniroom.index";
	}
	
	@PostMapping(URLConstant.SEARCH)
	public String search(Model model, @RequestParam int wid, @RequestParam int priceId, 
			RedirectAttributes ra) {
		List<Post> postListSearch = null;
		if (priceId == 0 && wid == 0) {
			ra.addFlashAttribute("msg", messageSource.getMessage("msg.searchfail", null, Locale.getDefault()));
			return "redirect:/index";
		} else if (priceId == 0) {
			postListSearch = postService.search(wid);
		} else if (wid == 0) {
			Map<Integer, Integer> map = PriceUtil.setPrice(priceId);
			postListSearch = postService.search(map);
		} else {
			Map<Integer, Integer> map = PriceUtil.setPrice(priceId);
			postListSearch = postService.search(wid, map);
		}
		List<District> districtList = districtWardService.getDistrictList();
		List<University> uniList = districtWardService.getUniList();
		model.addAttribute("uniList", uniList);
		model.addAttribute("districtList", districtList);
		model.addAttribute("postListSearch", postListSearch);
		return "uniroom.index";
	}
	
	@GetMapping({URLConstant.DISTRICT_ID, URLConstant.DISTRICT_ID_PAGE})
	public String cat(Model model, @PathVariable(required = true) Integer did,
						@PathVariable(required = false) Integer page) {
		if (page == null || page > 1 ) {
			page = 1;
		}
		int offset = PageUtil.getOffset(page);
		List<Post> postDistrictList = postService.getPostDistrict(did, offset, GlobalConstant.TOTAL_ROW);
		District district = districtWardService.findDistrictById(did);
		List<District> districtList = districtWardService.getDistrictList();
		List<University> uniList = districtWardService.getUniList();
		model.addAttribute("uniList", uniList);
		model.addAttribute("districtList", districtList);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPage", PageUtil.getTotalPage(postService.totalRowDistrict(did)));
		model.addAttribute("district", district);
		model.addAttribute("postDistrictList", postDistrictList);
		return "uniroom.index";
	}
	
	@GetMapping(URLConstant.DETAIL_ID)
	public String detail(Model model, @PathVariable(required = true) Integer pid) {
		Post post = postService.findByIdPublic(pid);
		List<District> districtList = districtWardService.getDistrictList();
		model.addAttribute("districtList", districtList);
		model.addAttribute("post", post);
		return "uniroom.detail";
	}
	
	@GetMapping(URLConstant.GUIDE)
	public String detail(Model model) {
		List<Guide> guideList = guideService.getAll();
		List<District> districtList = districtWardService.getDistrictList();
		model.addAttribute("districtList", districtList);
		model.addAttribute("guideList", guideList);
		return "uniroom.guide";
	}
	
	@GetMapping(URLConstant.GUIDE_ID)
	public String guide(@PathVariable(required = true) Integer gid, Model model) {
		Guide guide = guideService.findById(gid);
		List<District> districtList = districtWardService.getDistrictList();
		model.addAttribute("districtList", districtList);
		model.addAttribute("guide", guide);
		return "uniroom.guide";
	}
	
	@GetMapping(URLConstant.FEEDBACK)
	public String feedback(Model model) {
		List<District> districtList = districtWardService.getDistrictList();
		model.addAttribute("districtList", districtList);
		return "uniroom.feedback";
	}
	
	@PostMapping(URLConstant.FEEDBACK)
	public String add(@Valid @ModelAttribute("feedback") FeedBack feedback, BindingResult rs, 
			RedirectAttributes ra, Model model) {
		if (rs.hasErrors()) {
			List<District> districtList = districtWardService.getDistrictList();
			model.addAttribute("districtList", districtList);
			model.addAttribute("feedback", feedback);
			return "uniroom.feedback";
		}
		if (feedBackService.save(feedback) > 0) {
			ra.addFlashAttribute("msg", messageSource.getMessage("msg.success", null, Locale.getDefault()));
			return "redirect:/index";
		}
		ra.addAttribute("msg", messageSource.getMessage("msg.fail", null, Locale.getDefault()));
		return "redirect:/index";
	}
	
	@GetMapping(URLConstant.ADD)
	public String add(Model model) {
		List<District> districtList = districtWardService.getDistrictList();
		model.addAttribute("districtList", districtList);
		return "uniroom.add";
	}
	
	@PostMapping(URLConstant.ADD)
	public String add(@Valid @ModelAttribute("post") Post post, BindingResult rs, @RequestParam("file") MultipartFile file, 
			RedirectAttributes ra, HttpServletRequest request, Model model) {
		if (rs.hasErrors()) {
			List<District> districtList = districtWardService.getDistrictList();
			model.addAttribute("districtList", districtList);
			model.addAttribute("post", post);
			return "uniroom.add";
		}
		//trungten
		List<Post> postByName = postService.getByName(post.getPname());
		if (postByName.size() > 0) {
			List<District> districtList = districtWardService.getDistrictList();
			model.addAttribute("districtList", districtList);
			model.addAttribute("post", post);
			model.addAttribute("msg", messageSource.getMessage("msg.trungten", null, Locale.getDefault()));
			return "uniroom.add";
		}
		String fileName = FileUtil.upload(file, request);
		post.setPicture(fileName);
		if (postService.save(post) > 0) {
			ra.addFlashAttribute("msg", messageSource.getMessage("msg.success", null, Locale.getDefault()));
			return "redirect:/index";
		}
		ra.addFlashAttribute("msg", messageSource.getMessage("msg.fail", null, Locale.getDefault()));
		return "redirect:/index";
	}
	
	@PostMapping(URLConstant.WARD)
	public @ResponseBody void addNew(@RequestParam int did, 
			HttpServletRequest request, HttpServletResponse response) {
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		if (did == 0) {
			out.print("<option class=\"areas--list__item hover--box__item\" value=\"0\">Chưa có phường!</option>");
		} else {
			List<Ward> wardList = districtWardService.getWardList(did);
			for (Ward ward : wardList) {
				out.print("<option class=\"areas--list__item hover--box__item\" value=\""+ward.getWid()+"\">"+ward.getWname()+"</option>");
			}
		}
	}
	
	@GetMapping(URLConstant.UNIVERSITY_ID)
	public String cat(Model model, @PathVariable(required = true) Integer uid) {
		Map<Integer, Integer> map = UniversityUtil.setDistrict(uid);
		List<Post> postUniversityList = postService.getPostUniversity(map);
		List<University> uniList = districtWardService.getUniList();
		University uni = districtWardService.findUniversityById(uid);
		List<District> districtList = districtWardService.getDistrictList();
		model.addAttribute("uniList", uniList);
		model.addAttribute("districtList", districtList);
		model.addAttribute("uni", uni);
		model.addAttribute("postUniversityList", postUniversityList);
		return "uniroom.index";
	}
}
