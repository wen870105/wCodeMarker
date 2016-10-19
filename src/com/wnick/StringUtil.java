package com.wnick;

import org.apache.commons.lang.StringUtils;

/**
 * 
 * @author wsy
 * 
 */
public class StringUtil {
	private static final String SPLIT_MARK = "_";

	public static boolean isEmpty(String param) {
		return param == null || param.length() == 0;
	}

	/**
	 * 参数是否不为空
	 * 
	 * @param param
	 * @return
	 */
	public static boolean isNotEmpty(String param) {
		return !isEmpty(param);
	}

	public static String format(String target, String[] vals) {
		int vlength = (vals == null) ? 0 : vals.length;

		for (int i = 0; i < vlength; i++)
			target = target.replaceFirst("\\{\\d+\\}", vals[i]);

		return target;
	}

	/**
	 * 首字母小写
	 * 
	 * @param filed
	 * @return
	 */
	public static String getLowerFirstName(String name) {
		String str = getUpperFirstName(name);
		if ((str == null) || ((str.length()) == 0))
			return str;
		return Character.toLowerCase(str.charAt(0)) + str.substring(1);
	}

	/**
	 * 首字母大写
	 * 
	 * @param filed
	 * @return
	 */
	public static String getUpperFirstName(String name) {
		StringBuffer sb = new StringBuffer();
		if (StringUtils.isNotBlank(name)) {
			String[] str = name.toLowerCase().split(SPLIT_MARK);
			for (int i = 0; i < str.length; i++) {
				if (StringUtil.isEmpty(str[i])) {
					continue;
				}
				sb.append(str[i].substring(0, 1).toUpperCase());
				sb.append(str[i].substring(1));
			}

		}
		return sb.toString();
	}

}
