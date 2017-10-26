package com.citibank.common;

import java.util.Arrays;


public class Mem {
	final static boolean BIG_INDIAN=true;
	
	public final static byte[] memset(byte[] ptr, int d, int len) {
		return memset(ptr, (byte) d, len);
	}

	final static byte[] memset(byte[] ptr, byte d, int len) {
		Arrays.fill(ptr, 0, len, d);
		return ptr;
	}

	final static int[] memset(int[] ptr, int d, int len) {
		Arrays.fill(ptr, 0, len, d);
		return ptr;
	}
	
	final static byte[] memcpy(byte[] d, byte[] s, int len) {
		return memcpy(d,0,s,0,len);
	}

	final static byte[] memcpy(byte[] d, int dp, byte[] s, int sp,int len) {
		System.arraycopy(s, sp, d, dp, len);
		return d;
	}
	
	final static int memcmp(byte[] d, byte[] s, int len)
	{
		return memcmp(d,d.length,s,s.length,len);
	}
	
	final static int memcmp(byte[] d, int dp, byte[] s, int sp,int len)
	{
		for(int i=0;i<len && dp<d.length && sp<s.length;dp++,sp++,i++)
		{
			if(d[dp]<s[sp])
				return -1;
			else if(d[dp]>s[sp])
				return 1;
		}
		
		return 0;
	}
	
	final static byte[] sub_array(byte[]src,int start,int len)
	{
		return memcpy(new byte[len],0,src,start,len);
	}
	
	final static int byte2int(byte b)
	{
		return ((int)b)&0xff;
	}

	final static long int2long(int b)
	{
		return (((long)(b>>>1))<<1)|(b&1);
	}

	/*
	 * 用作java本地数据类型的转换
	 * */
	public final static void int2byte(byte[]dst,int pos,int src)
	{
		int2byte(dst,pos,src,true);
	}
	
	public final static byte[] int2byte(byte[]dst,int pos,int src,boolean big_endian)
	{
		if(big_endian)
		{
			dst[pos+3] = (byte) ((src>>>0) & 0xff);
			dst[pos+2] = (byte) ((src>>>8) & 0xff);
			dst[pos+1] = (byte) ((src>>>16) & 0xff);
			dst[pos+0] = (byte) ((src>>>24) & 0xff);
		}
		else
		{
			dst[pos+0] = (byte) ((src>>>0) & 0xff);
			dst[pos+1] = (byte) ((src>>>8) & 0xff);
			dst[pos+2] = (byte) ((src>>>16) & 0xff);
			dst[pos+3] = (byte) ((src>>>24) & 0xff);
		}
		
		return dst;
	}
	/*
	 * 用作java本地数据类型的转换
	 * */
	final static void long2byte(byte[]dst,int pos,long src)
	{
		long2byte(dst,pos,src,true);
	}
	
	final static void long2byte(byte[]dst,int pos,long src,boolean big_endian)
	{
		if(big_endian)
		{
			int2byte(dst,4+pos,(int)(src&0xffffffff));
			int2byte(dst,0+pos,(int)((src>>>32)&0xffffffff));
		}
		else
		{
			int2byte(dst,0+pos,(int)(src&0xffffffff));
			int2byte(dst,4+pos,(int)((src>>>32)&0xffffffff));
		}
	}
	
	
	
	

	final static int byte2int(byte[]src,int pos)
	{
		return byte2int(src,pos,true);
	}
	
	public final static int byte2int(byte[]src,int pos,boolean big_endian)
	{
		int ret;
		if(big_endian)
		{
			ret =byte2int(src[0+pos]);ret<<=8;
			ret|=byte2int(src[1+pos]);ret<<=8;
			ret|=byte2int(src[2+pos]);ret<<=8;
			ret|=byte2int(src[3+pos]);
		}
		else
		{
			ret =byte2int(src[3+pos]);ret<<=8;
			ret|=byte2int(src[2+pos]);ret<<=8;
			ret|=byte2int(src[1+pos]);ret<<=8;
			ret|=byte2int(src[0+pos]);
		}
		
		return ret;
	}
	
	final static long byte2long(byte[]src,int pos)
	{
		return byte2long(src,pos,true);
	}
	
	final static long byte2long(byte[]src,int pos,boolean big_endian)
	{
		long ret=0;
		if(big_endian)
		{
			ret|=int2long(byte2int(src,pos+0,big_endian));ret<<=32;
			ret|=int2long(byte2int(src,pos+4,big_endian));
		}
		else
		{
			ret|=int2long(byte2int(src,pos+4,big_endian));ret<<=32;
			ret|=int2long(byte2int(src,pos+0,big_endian));
		}
		
		return ret;
	}
	
	
	final static byte[] ia2ba(int[] src,int slen,boolean big_endian)
	{
		byte[] dst=new byte[slen<<2];
		return ia2ba(dst,src,slen,big_endian);
	}
	
	final static byte[] ia2ba(byte[] dst,int[] src,int slen,boolean big_endian)
	{
		for(int i=0,len=slen;i<len;i++)
			int2byte(dst,i<<2,src[i],big_endian);

		return dst;
	}
	
	public final static int[] ba2ia(byte[] src,int slen,boolean big_endian)
	{
		int[] dst=new int[slen>>2];
		return ba2ia(dst,src,slen,big_endian);
	}
	
	final static int[] ba2ia(int[] dst,byte[] src,int slen,boolean big_endian)
	{
		if(slen%4!=0)//byte数组长度只能是4的整数倍
			return null;
		
		for(int i=0;i<slen;i+=4)
			dst[i/4]=byte2int(src,i,big_endian);
		
		return dst;
	}
	
	final static void printf(String format,Object... args)
	{
		System.out.printf(format, args);
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		boolean debug[]={
				false,	//byte2int
				false,	//int2long
				true,	//int2byte
				
				true,	//int2byte
				true,	//int2byte
				true,	//int2byte
				true,	//int2byte
				true,	//int2byte
				true,	//int2byte
				true,	//int2byte
				true,	//int2byte
				true,	//int2byte
				true	//int2byte
		};
		
		if(debug[0])
		for(int i=0;i<256;i++)
		{
			printf("%1$02X  ",byte2int((byte)(i&0xff)));
			if((i+1)%16==0)
				printf("\n");
		}
		
		if(debug[1])
		for(int i=-7;i<7;i++)
		{
			printf("%1$d[%1$X]  ",(int2long(i)));
			if((i+1+7)%3==0)
				printf("\n");
		}
		
		printf("\n");
		
		if(debug[3])
		{
			int x=0x12345678;
			byte[]b=new byte[4];
			int2byte(b,0,x,true);
			printf("byte2int bigorder:0x%x-->[0x%x,0x%x,0x%x,0x%x]\n",x,b[0],b[1],b[2],b[3]);
			if(!Arrays.toString(new byte[]{0x12, 0x34, 0x56, 0x78}).equals(Arrays.toString(b)))
				printf("int2byte 测试错误！");
				
			int2byte(b,0,x,false);
			printf("byte2int litorder:0x%x-->[0x%x,0x%x,0x%x,0x%x]\n",x,b[0],b[1],b[2],b[3]);
			if(!Arrays.toString(new byte[]{0x78, 0x56, 0x34, 0x12}).equals(Arrays.toString(b)))
				printf("int2byte 测试错误！");
		}
	}
}
