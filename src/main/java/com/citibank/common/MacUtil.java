package com.citibank.common;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;

/**
 * 摘要计算工具类
 * 
 * @author zmy
 * @version 2014-07-02
 */
public class MacUtil {
	
	/**
	 * 十六进制ASCII大写字符转化表
	 */
	private static final char[] HEX = { 
		'0', '1', '2', '3', '4', '5', '6', '7',
		'8', '9', 'A', 'B', 'C', 'D', 'E', 'F' };
	
	/**
	 * 16进制字符转化为字节
	 * @param c 字符
	 * @return 字节
	 */
	private static byte c2b(char c){
		return (byte) Arrays.binarySearch(HEX, c);
	}
	
	/**
	 * 字节转化为16进制字符串(大写)
	 * @param b 字节数组
	 * @param offset 起始偏移
	 * @param len 长度
	 * @return 字符串
	 */
	public static String b2hex(byte[] b, int offset, int len) {
		StringBuffer sb = new StringBuffer();
        for(int i = 0; i < len; i++){
        	byte bb = b[offset+i];
        	sb.append(HEX[(bb & 0xf0)>>4]).append(HEX[bb & 0x0f]);
        }
		return sb.toString();
	}
	/**
	 * 字节转化为16进制字符串(大写)
	 * @param b 字节数组
	 * @return 字符串
	 */
	public static String b2hex(byte[] b){
		StringBuffer sb = new StringBuffer();
        for(int i = 0; i < b.length; i++){
        	sb.append(HEX[(b[i] & 0xf0)>>4]).append(HEX[b[i] & 0x0f]);
        }
		return sb.toString();
	}
	/**
	 * 16进制字符串转化为字节
	 * @param s 字符串
	 * @return 字节数组
	 */
	public static byte[] hex2b(String s) {
		char[] c = s.toUpperCase().toCharArray();
		int len = c.length / 2 ;
		byte[] b = new byte[len];
		for(int i = 0 ; i < len; i++){
			b[i] = (byte)(c2b(c[i*2]) << 4 | c2b(c[i*2+1]));
		}
		return b;
	}


	/**
	 * MD5摘要
	 * @param s 字符串
	 * @return 返回16进制字符串(大写)
	 * @throws java.security.NoSuchAlgorithmException
	 */
	public static String md5(String s) throws NoSuchAlgorithmException{
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(s.getBytes());
			byte[] b = md.digest();
			return b2hex(b);
	}
	
	/**
	 * SHA-1摘要
	 * @param s 字符串
	 * @return 返回大写16进制字符串(大写)
	 * @throws java.security.NoSuchAlgorithmException
	 */
	public static String sha1(String s) throws NoSuchAlgorithmException{
		MessageDigest md = MessageDigest.getInstance("SHA-1");
		md.update(s.getBytes());
		byte[] b = md.digest();
		return b2hex(b);
	}
	
}
