package kr.co.opensise.member.encrypt.seed;

public class StringUtil {

	/**
	 * (length - str.length) ��ŭ �տ� 0�� �߰��Ѵ�.
	 * @param str
	 * @param length
	 * @return
	 */
	public static String addZero (String str, int length) {
		String temp = "";
		for (int i = str.length(); i < length; i++)
			temp += "0";
		temp += str;
		return temp;
	}

	public static boolean isEmpty(String str) {
		if(str == null || str.length() == 0) {
			return true;
		}else {
			return false;
		}
	}
	
}