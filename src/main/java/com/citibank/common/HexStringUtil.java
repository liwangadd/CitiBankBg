package com.citibank.common;

public class HexStringUtil {
	/**
	 * Returns the byte array as a hex string in the format "0x1234".
	 * 
	 * @param data
	 *            byte array
	 * @return hex string
	 * 
     * @author zmy
     * @version 2014-07-01
	 */
	public static String getHexString(byte[] data) {
		StringBuffer hex = new StringBuffer("0x");
		if (data != null)
			for (int i = 0; i < data.length; i++) {
				String digit = Integer.toString(data[i] & 0x0ff, 16);
				if (digit.length() < 2)
					hex.append('0');
				hex.append(digit);
			}
		return hex.toString();
	}
	/**
	 * Returns the hex string as a byte array in the format "0x1234".
	 * 
	 * @param data
	 *            byte array
	 * @return hex string
	 */
	public static byte[] hexStringToByte(String hex) {
		hex = hex.substring(2);
		int len = (hex.length() / 2);
		byte[] result = new byte[len];
		char[] achar = hex.toCharArray();
		for (int i = 0; i < len; i++) {
			int pos = i * 2;
			byte b = (byte) (toByte(achar[pos])*16+toByte(achar[pos+1]));
			b = (byte) (b>127?b-256:b);
			result[i] = b;
		}
		return result;
	}

	private static int toByte(char c) {
		c = (char) (((c+"").toUpperCase()).charAt(0));
		int b = (int) "0123456789ABCDEF".indexOf(c);
		return b;
	}
}
