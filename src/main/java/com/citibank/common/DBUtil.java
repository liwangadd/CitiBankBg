package com.citibank.common;

import java.io.UnsupportedEncodingException;
import java.util.Map;
import java.util.TreeMap;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;


public class DBUtil {

	private static final String desKeyHexString="0xec52d683d32afb192608b9ecc7294380914510a4e3b68ce0";
	private static byte[] 	m_comm_root_key=null;	//服务器
	private static byte[] 	m_client_key=null;//客户端
	private static Map 		g_client_key=new TreeMap();
	public static void set_root_key(String comm_root_key)
	{
		byte[] bt=null;
		try {
			bt = comm_root_key.getBytes("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return;
		}
		
		m_comm_root_key=new byte[32];
		Sm3.csum(bt, bt.length, m_comm_root_key);
	}
	public static void set_client_key(String client_key_base16)
	{
		if(client_key_base16!=null)
			set_client_key(Base16.decode(client_key_base16));
	}

	public static void set_client_key(byte[] client_key)
	{
		m_client_key=new byte[client_key.length];
		System.arraycopy(client_key, 0, m_client_key, 0, m_client_key.length);
	}
	public static String get_client_key_base16(String clientid)
	{
		return Base16.encode(get_client_key(clientid)); 
	}
	public static String Encrypt(byte[] d,String client_id)
	{
		int R=1;
		int pad_len=((d.length+16)>>4<<4);
		int pad=pad_len-d.length;
		
		d=copyOf(d, pad_len);
		for(int i=pad_len-pad;i<pad_len;i++)
			d[i]=(byte)pad;
		
		int[] comm_key=mk_comm_key(client_id,R);
//		int xor32=check_xor_32(d);
		
//		System.out.println(client_id);
//		System.out.println(R);
//		print(comm_key);
		System.out.println(comm_key.length);
		return Base16.encode(new Sm4(comm_key,0).Encrypt(d));
	}
	static private byte[] copyOf(byte[]d,int len)
	{
		byte[]ret=new byte[len];
		
		if(d!=null)
			System.arraycopy(d, 0, ret, 0, len>d.length?d.length:len);
		
		return ret;
	}
	public static int[] mk_comm_key(String clientid,int R)
	{
		byte[] client_key=get_client_key(clientid);
		byte[] bt=Mem.int2byte(new byte[4],0,R,true);
		
		byte[] digest=new byte[32];
		Sm3.csum_ex(client_key, client_key.length, bt, bt.length, digest);

		return Mem.ba2ia(digest, digest.length, true);
	}
	public static byte[] get_client_key(String clientid)
	{
		if(m_client_key!=null)
			return m_client_key;
		synchronized(g_client_key)
		{
			byte[] client_key=(byte[])g_client_key.get(clientid);
			if(client_key==null)
			{
				byte[]bt=null;
				client_key=new byte[32];
				try {
					bt=clientid.getBytes("utf-8");
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					
					return null;
				}
				
				Sm3.csum_ex(m_comm_root_key, m_comm_root_key.length, bt, bt.length, client_key);
				g_client_key.put(clientid, client_key);
			}
			return client_key;
		}
	}
	public static String Dencrypt(String buff,String client_id) throws UnsupportedEncodingException
	{
		int R = 1;
		byte[] ed;
		
		int[]comm_key=mk_comm_key(client_id,R);
		
//		print(comm_key);
		
		ed=new Sm4(comm_key).Decrypt(Base16.decode(buff));
		
		return new String(copyOf(ed, ed.length-ed[ed.length-1]),"utf-8");
	}
	static void print(int[] a)
	{
		for(int i=0;i<a.length;i++)
		{
			System.out.println(String.format("%08X", a[i]));
		}
		
	}
	public static  void CreateDES() throws Exception{
		KeyGenerator kg = KeyGenerator.getInstance("DESede");
    	
        //初始化密码生成器
    	//省略该步骤，会根据算法自动生成使用的默认的密钥长度
    	//DES算法，密钥必须是56位
    	//若是AES，可以是128,192,256位
    	//若是Blowfish，则可以是32~448之间可以被8整除的数
    	//HmacMD5和HmacSHA1默认的长度是64字节
    	kg.init(168);
    	//生成密钥
    	SecretKey k = kg.generateKey();
    	//通过对象序列化方式将密钥保存在文件中
//    	FileOutputStream f = new FileOutputStream("dbkey.dat");
//    	f.write(k.getEncoded());
    	System.out.println(HexStringUtil.getHexString(k.getEncoded()));
	}
	/**
	 * 使用对称密钥进行加密
	 * String str 需要加密的加密串
	 * @throws Exception
	 */
	public static String encoder(String str) throws Exception{
		// 从文件中获取密钥
//		FileInputStream f = new FileInputStream("dbkey.dat");
//		int len = f.available();
//		byte[] keyByte = new byte[len];
//		f.read(keyByte);
		byte[] keyByte = HexStringUtil.hexStringToByte(desKeyHexString);
		SecretKeySpec k = new SecretKeySpec(keyByte,"DESede");
		
		
		//初始化密码器
		Cipher cp = Cipher.getInstance("DESede");
		cp.init(Cipher.ENCRYPT_MODE, k);
		
		//获取等待加密的明文
		byte ptext[] = str.getBytes("UTF-8");
		
		//执行加密
		byte ctext[] = cp.doFinal(ptext);
		String ret =HexStringUtil.getHexString(ctext);
		return ret;
	}
	/**
	 * 使用对称密码解密
	 * String str 需要解密的解密串
	 * @throws Exception
	 */
	public static String decoder(String str) throws Exception{
		//获取密文
//		FileInputStream f = new FileInputStream("SEnc.dat");
//		int num = f.available();
		byte[] ctext = HexStringUtil.hexStringToByte(str);
//		f.read(ctext);
		
		//获取密钥
//		FileInputStream f2 = new FileInputStream("dbkey.dat");
//		int len = f2.available();
//		byte[] keyByte = new byte[len];
//		f2.read(keyByte);
		
		byte[] keyByte = HexStringUtil.hexStringToByte(desKeyHexString);
		
		SecretKeySpec k = new SecretKeySpec(keyByte,"DESede");
		
		//解密
		Cipher cp = Cipher.getInstance("DESede");
		cp.init(Cipher.DECRYPT_MODE, k);
		byte[] ptext = cp.doFinal(ctext);
		
		String s = new String(ptext,"UTF-8");
		return s;
	}
	public static void main(String[] args) throws Exception {
//		CreateDES();
//		String str = encoder("jdbc:oracle:thin:@10.8.1.121:1521:ORCL");
//		System.out.println(str);
//		String destr = decoder(str);
//		System.out.println(destr);
		String client_id="db";
		
//		String client_key="8BF28CDB2901223437B897643F6EB38179DBE27BC63A7203673535D2C5C5095C";
		DBUtil.set_root_key("zzj");
//		System.out.println(DBUtil.get_client_key_base16("db"));
//		DBUtil.set_client_key(DBUtil.get_client_key_base16("db"));
		String password = DBUtil.Encrypt("ess52".getBytes(), client_id);
		System.out.println(password);
//		DBUtil.set_root_key("zzj");
		System.out.println(DBUtil.Dencrypt(password, "db1"));
	}
}
