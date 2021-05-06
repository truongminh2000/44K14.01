package phin.util;

import java.util.HashMap;
import java.util.Map;

public class PriceUtil {
	
	public static Map<Integer, Integer> setPrice(int priceId) {
		Map<Integer, Integer> map = new HashMap<Integer, Integer>();
		switch (priceId) {
		case 1:
			map.put(0, 3000000);
			map.put(1, 50000000);
			break;
		case 2:
			map.put(0, 2000000);
			map.put(1, 3000000);
			break;
		case 3:
			map.put(0, 1500000);
			map.put(1, 2000000);
			break;
		case 4:
			map.put(0, 0);
			map.put(1, 1500000);
			break;
		default:
			break;
		}
		return map;
	}
}
