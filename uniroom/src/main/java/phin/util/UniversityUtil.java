package phin.util;

import java.util.HashMap;
import java.util.Map;

public class UniversityUtil {
	
	public static Map<Integer, Integer> setDistrict(int uid) {
		Map<Integer, Integer> map = new HashMap<Integer, Integer>();
		switch (uid) {
		case 1:
			map.put(0, 5);
			map.put(1, 6);
			break;
		case 2:
			map.put(0, 1);
			map.put(1, 3);
			break;
		case 3:
			map.put(0, 3);
			map.put(1, 4);
			break;
		case 4:
			map.put(0, 1);
			map.put(1, 2);
			break;
		case 5:
			map.put(0, 1);
			map.put(1, 2);
			break;
		case 6:
			map.put(0, 3);
			map.put(1, 4);
			break;
		case 7:
			map.put(0, 1);
			map.put(1, 3);
			break;
		case 8:
			map.put(0, 1);
			map.put(1, 3);
			break;
		default:
			break;
		}
		return map;
	}
}
