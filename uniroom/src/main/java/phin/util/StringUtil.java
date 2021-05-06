package phin.util;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.Normalizer;
import java.util.regex.Pattern;

public class StringUtil {
	public static String md5(String str) {
		MessageDigest md;
		String result = "";
		try {
			md = MessageDigest.getInstance("MD5");
			md.update(str.getBytes());
			BigInteger bi = new BigInteger(1, md.digest());
			
			result = bi.toString(16);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public static String makeSlug(String title) {
		String slug = Normalizer.normalize(title, Normalizer.Form.NFD);
		Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+");
		slug = pattern.matcher(slug).replaceAll("");
		slug = slug.toLowerCase();
		// Thay đ thành d
		slug = slug.replaceAll("đ", "d");
		// Xóa các ký tự đặt biệt
		slug = slug.replaceAll("([^0-9a-z-\\s])", "");
		// Thay space thành dấu gạch ngang
		slug = slug.replaceAll("[\\s]", "-");
		// �?ổi nhi�?u ký tự gạch ngang liên tiếp thành 1 ký tự gạch ngang
		slug = slug.replaceAll("(-+)", "-");
		// Xóa các ký tự gạch ngang ở đầu và cuối
		slug = slug.replaceAll("^-+", "");
		slug = slug.replaceAll("-+$", "");
		return slug;
	}
	
	public static String makeSearch(String searchString) {
		String search = Normalizer.normalize(searchString, Normalizer.Form.NFD);
		Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+");
		search = pattern.matcher(search).replaceAll("");
		search = search.toLowerCase();
		// Thay đ thành d
		search = search.replaceAll("đ", "d");
		// Xóa các ký tự đặt biệt
		search = search.replaceAll("([^0-9a-z-\\s])", "");
		// Thay space thành dấu gạch ngang
		search = search.replaceAll("[\\s]", "-");
		// �?ổi nhi�?u ký tự gạch ngang liên tiếp thành 1 ký tự gạch ngang
		search = search.replaceAll("(-+)", "-");
		// Xóa các ký tự gạch ngang ở đầu và cuối
		search = search.replaceAll("^-+", "");
		search = search.replaceAll("-+$", "");
		//Thay gach ngang = space
		search = search.replaceAll("-", "[\\s]");
		return search;
	}
	
	public static String removeAccent(String s) { 
		String temp = Normalizer.normalize(s, Normalizer.Form.NFD); 
		Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+"); 
		temp = pattern.matcher(temp).replaceAll(""); 
		return temp.replaceAll("đ", "d"); 
    }
}
