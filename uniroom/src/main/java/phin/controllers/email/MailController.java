package phin.controllers.email;

import java.util.Locale;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import phin.constant.GlobalConstant;
import phin.constant.URLConstant;
import phin.models.Mail;
import phin.service.MailService;

@Controller
@RequestMapping(URLConstant.MAIL)
public class MailController {
	
	@Autowired
	public JavaMailSender emailSender;
	
	@Autowired
	private MailService mailService;
	
	@Autowired
	public MessageSource messageSource;
	
	@ResponseBody
	@GetMapping(URLConstant.SEND)
	public String sendSimpleEmail() {
		
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(GlobalConstant.MY_EMAIL);
		message.setSubject("Test!");
		message.setText("Hiiiiiiiiiiiiiiiiiiiiiiiiiiii");
		emailSender.send(message);
		return "Email Sent!";
	}
	
	@PostMapping(URLConstant.ADD)
	public String add(@Valid @ModelAttribute Mail mail, BindingResult rs, RedirectAttributes ra) {
		if (rs.hasErrors()) {
			ra.addFlashAttribute("msg", "Email hoặc quận không hợp lệ!");
			return "redirect:/index";
		}
		if (mailService.singup(mail) > 0) {
			ra.addFlashAttribute("msg", "Email đã đăng ký khu vực này rồi!");
			return "redirect:/index";
		}
		if (mailService.save(mail) > 0) {
			ra.addFlashAttribute("msg", messageSource.getMessage("msg.success", null, Locale.getDefault()));
			return "redirect:/index";
		}
		ra.addFlashAttribute("msg", messageSource.getMessage("msg.fail", null, Locale.getDefault()));
		return "redirect:/index";
	}
}
