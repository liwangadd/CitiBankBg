package com.citibank.common;

import java.io.ByteArrayOutputStream;
import java.util.ArrayList;
import java.util.List;

public class Base16
{
	static List g_map=new ArrayList(256);
	static
	{
		for(int i=0;i<256;i++)
			g_map.add(String.format("%02X", i));
	}

	
	final static public String encode(byte[] buff)
	{
		StringBuffer sb=new StringBuffer(buff.length*2);
		
		for(int i=0,len=buff.length;i<len;i++)
			sb.append(g_map.get(0xff&buff[i]));
		
		
		return sb.toString();
	}

	final static public byte[] decode(String buff)
	{
		ByteArrayOutputStream bo=new ByteArrayOutputStream();
		
		for(int i=0,len=buff.length();i<len;i+=2)
			bo.write(Integer.parseInt(buff.substring(i, i+2),16));
		
		return bo.toByteArray();
	}

	/**
	 * @param args
	 */
	public static void main(String[] args)
	{
		String fff="1234567890123456ABCDEF7F8081";
		
		byte[] b=decode(fff);
		
		String s=encode(b);

		
		System.out.println(s);
	}
}
