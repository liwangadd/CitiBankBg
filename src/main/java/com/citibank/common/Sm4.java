package com.citibank.common;

public class Sm4 extends Mem{

	static final int SMS4CROL(int uval, int bits) {
		return ((uval << bits) | (uval >>> (0x20 - bits)));
	};

	static final int SMS4MASK3 = 0xFF000000;
	static final int SMS4MASK2 = 0x00FF0000;
	static final int SMS4MASK1 = 0x0000FF00;
	static final int SMS4MASK0 = 0x000000FF;

	static byte [] SboxTable = 
	{
		(byte)0xd6,(byte)0x90,(byte)0xe9,(byte)0xfe,(byte)0xcc,(byte)0xe1,(byte)0x3d,(byte)0xb7,(byte)0x16,(byte)0xb6,(byte)0x14,(byte)0xc2,(byte)0x28,(byte)0xfb,(byte)0x2c,(byte)0x05,
		(byte)0x2b,(byte)0x67,(byte)0x9a,(byte)0x76,(byte)0x2a,(byte)0xbe,(byte)0x04,(byte)0xc3,(byte)0xaa,(byte)0x44,(byte)0x13,(byte)0x26,(byte)0x49,(byte)0x86,(byte)0x06,(byte)0x99,
		(byte)0x9c,(byte)0x42,(byte)0x50,(byte)0xf4,(byte)0x91,(byte)0xef,(byte)0x98,(byte)0x7a,(byte)0x33,(byte)0x54,(byte)0x0b,(byte)0x43,(byte)0xed,(byte)0xcf,(byte)0xac,(byte)0x62,
		(byte)0xe4,(byte)0xb3,(byte)0x1c,(byte)0xa9,(byte)0xc9,(byte)0x08,(byte)0xe8,(byte)0x95,(byte)0x80,(byte)0xdf,(byte)0x94,(byte)0xfa,(byte)0x75,(byte)0x8f,(byte)0x3f,(byte)0xa6,
		(byte)0x47,(byte)0x07,(byte)0xa7,(byte)0xfc,(byte)0xf3,(byte)0x73,(byte)0x17,(byte)0xba,(byte)0x83,(byte)0x59,(byte)0x3c,(byte)0x19,(byte)0xe6,(byte)0x85,(byte)0x4f,(byte)0xa8,
		(byte)0x68,(byte)0x6b,(byte)0x81,(byte)0xb2,(byte)0x71,(byte)0x64,(byte)0xda,(byte)0x8b,(byte)0xf8,(byte)0xeb,(byte)0x0f,(byte)0x4b,(byte)0x70,(byte)0x56,(byte)0x9d,(byte)0x35,
		(byte)0x1e,(byte)0x24,(byte)0x0e,(byte)0x5e,(byte)0x63,(byte)0x58,(byte)0xd1,(byte)0xa2,(byte)0x25,(byte)0x22,(byte)0x7c,(byte)0x3b,(byte)0x01,(byte)0x21,(byte)0x78,(byte)0x87,
		(byte)0xd4,(byte)0x00,(byte)0x46,(byte)0x57,(byte)0x9f,(byte)0xd3,(byte)0x27,(byte)0x52,(byte)0x4c,(byte)0x36,(byte)0x02,(byte)0xe7,(byte)0xa0,(byte)0xc4,(byte)0xc8,(byte)0x9e,
		(byte)0xea,(byte)0xbf,(byte)0x8a,(byte)0xd2,(byte)0x40,(byte)0xc7,(byte)0x38,(byte)0xb5,(byte)0xa3,(byte)0xf7,(byte)0xf2,(byte)0xce,(byte)0xf9,(byte)0x61,(byte)0x15,(byte)0xa1,
		(byte)0xe0,(byte)0xae,(byte)0x5d,(byte)0xa4,(byte)0x9b,(byte)0x34,(byte)0x1a,(byte)0x55,(byte)0xad,(byte)0x93,(byte)0x32,(byte)0x30,(byte)0xf5,(byte)0x8c,(byte)0xb1,(byte)0xe3,
		(byte)0x1d,(byte)0xf6,(byte)0xe2,(byte)0x2e,(byte)0x82,(byte)0x66,(byte)0xca,(byte)0x60,(byte)0xc0,(byte)0x29,(byte)0x23,(byte)0xab,(byte)0x0d,(byte)0x53,(byte)0x4e,(byte)0x6f,
		(byte)0xd5,(byte)0xdb,(byte)0x37,(byte)0x45,(byte)0xde,(byte)0xfd,(byte)0x8e,(byte)0x2f,(byte)0x03,(byte)0xff,(byte)0x6a,(byte)0x72,(byte)0x6d,(byte)0x6c,(byte)0x5b,(byte)0x51,
		(byte)0x8d,(byte)0x1b,(byte)0xaf,(byte)0x92,(byte)0xbb,(byte)0xdd,(byte)0xbc,(byte)0x7f,(byte)0x11,(byte)0xd9,(byte)0x5c,(byte)0x41,(byte)0x1f,(byte)0x10,(byte)0x5a,(byte)0xd8,
		(byte)0x0a,(byte)0xc1,(byte)0x31,(byte)0x88,(byte)0xa5,(byte)0xcd,(byte)0x7b,(byte)0xbd,(byte)0x2d,(byte)0x74,(byte)0xd0,(byte)0x12,(byte)0xb8,(byte)0xe5,(byte)0xb4,(byte)0xb0,
		(byte)0x89,(byte)0x69,(byte)0x97,(byte)0x4a,(byte)0x0c,(byte)0x96,(byte)0x77,(byte)0x7e,(byte)0x65,(byte)0xb9,(byte)0xf1,(byte)0x09,(byte)0xc5,(byte)0x6e,(byte)0xc6,(byte)0x84,
		(byte)0x18,(byte)0xf0,(byte)0x7d,(byte)0xec,(byte)0x3a,(byte)0xdc,(byte)0x4d,(byte)0x20,(byte)0x79,(byte)0xee,(byte)0x5f,(byte)0x3e,(byte)0xd7,(byte)0xcb,(byte)0x39,(byte)0x48
	};

	/* fixed parameter */
	static int CK[] =
	{
		0x00070e15,0x1c232a31,0x383f464d,0x545b6269,
		0x70777e85,0x8c939aa1,0xa8afb6bd,0xc4cbd2d9,
		0xe0e7eef5,0xfc030a11,0x181f262d,0x343b4249,
		0x50575e65,0x6c737a81,0x888f969d,0xa4abb2b9,
		0xc0c7ced5,0xdce3eaf1,0xf8ff060d,0x141b2229,
		0x30373e45,0x4c535a61,0x686f767d,0x848b9299,
		0xa0a7aeb5,0xbcc3cad1,0xd8dfe6ed,0xf4fb0209,
		0x10171e25,0x2c333a41,0x484f565d,0x646b7279
	};	
	/* System parameter */
	static final int FK[] = {0xa3b1bac6,0x56aa3350,0x677d9197,0xb27022dc};
	
	public int[] ENRK = null;
	public int[] DERK = null;
	
	/*
	* ulkey:   [in] 128bits password;
	* args:    [in] ulflag: if 0: not calculate DERK , else calculate;
	 * */
	public Sm4(int[] ulkey,int flag)
	{
		this.SetKey(ulkey, flag);
	}

	public Sm4(int[] ulkey)
	{
		this(ulkey,1);
	}
	/*=============================================================================
	** private function:
	**   look up in SboxTable and get the related value.
	** args:    [in] inch: 0x00~0xFF (8 bits unsigned value).
	**============================================================================*/
	final byte SMS4Sbox(int inch)
	{
		inch=0xff&inch;
		return SboxTable[inch];
	}

	/*=============================================================================
	** private function:
	**   "T algorithm" == "L algorithm" + "t algorithm".
	** args:    [in] a: a is a 32 bits unsigned value;
	** return: c: c is calculated with line algorithm "L" and nonline algorithm "t"
	**============================================================================*/
	final int SMS4Lt(int a)
	{
	    int b = 0;
	    int c = 0;
	    byte a0 = (byte)(a & SMS4MASK0);
	    byte a1 = (byte)((a & SMS4MASK1) >>> 8);
	    byte a2 = (byte)((a & SMS4MASK2) >>> 16);
	    byte a3 = (byte)((a & SMS4MASK3) >>> 24);
	    byte b0 = SMS4Sbox(a0);
	    byte b1 = SMS4Sbox(a1);
	    byte b2 = SMS4Sbox(a2);
	    byte b3 = SMS4Sbox(a3);

	    b = byte2int(b0) | (byte2int(b1) << 8) | (byte2int(b2) << 16) | (byte2int(b3) << 24);
	    c = b^(SMS4CROL(b, 2))^(SMS4CROL(b, 10))^(SMS4CROL(b, 18))^(SMS4CROL(b, 24));

	    return c;
	}

	/*=============================================================================
	** private function:
	**   Calculating round encryption key.
	** args:    [in] a: a is a 32 bits unsigned value;
	** return: ENRK[i]: i{0,1,2,3,...31}.
	**============================================================================*/
	final int SMS4CalciRK(int a)
	{
	    int b = 0;
	    int rk = 0;
	    byte a0 = (byte)(a & SMS4MASK0);
	    byte a1 = (byte)((a & SMS4MASK1) >>> 8);
	    byte a2 = (byte)((a & SMS4MASK2) >>> 16);
	    byte a3 = (byte)((a & SMS4MASK3) >>> 24);
	    byte b0 = SMS4Sbox(a0);
	    byte b1 = SMS4Sbox(a1);
	    byte b2 = SMS4Sbox(a2);
	    byte b3 = SMS4Sbox(a3);

	    b = byte2int(b0) | (byte2int(b1) << 8) | (byte2int(b2) << 16) | (byte2int(b3) << 24);
	    rk = b^(SMS4CROL(b, 13))^(SMS4CROL(b, 23));

	    return rk;
	}

	/*=============================================================================
	** private function:
	**   Calculating round encryption key.
	** args:    [in] ulflag: if 0: not calculate DERK , else calculate;
	** return: NONE.
	**============================================================================*/
	final void SMS4CalcRK(int[] MK,int ulflag)
	{
	    int k[]=new int[36];
	    int i = 0;

	    k[0] = MK[0]^FK[0];
	    k[1] = MK[1]^FK[1];
	    k[2] = MK[2]^FK[2];
	    k[3] = MK[3]^FK[3];
	    
	    if(ENRK==null)
	    	ENRK=new int[32];

	    for(; i<32; i++)
	    {
	        k[i+4] = k[i] ^ (SMS4CalciRK(k[i+1]^k[i+2]^k[i+3]^CK[i]));
	        ENRK[i] = k[i+4];
	    }

	    if (ulflag != 0x00) 
	    {
	    	if(DERK==null)
	    		DERK=new int[32];
	    	
	    	for (i=0; i<32; i++) 
	            DERK[i] = ENRK[31-i];
	    }
	}

	/*=============================================================================
	** private function:
	**   "T algorithm" == "L algorithm" + "t algorithm".
	** args:    [in] a: a is a 32 bits unsigned value.
	**============================================================================*/
	final int SMS4T(int a)
	{
	    return (SMS4Lt(a));
	}

	/*=============================================================================
	** private function:
	**   Calculating and getting encryption/decryption contents.
	** args:    [in] x0: original contents;
	** args:    [in] x1: original contents;
	** args:    [in] x2: original contents;
	** args:    [in] x3: original contents;
	** args:    [in] rk: encryption/decryption key;
	** return the contents of encryption/decryption contents.
	**============================================================================*/
	final int SMS4F(int x0, int x1, int x2, int x3, int rk)
	{
	    return (x0^SMS4Lt(x1^x2^x3^rk));
	}

	static final void memcpy(int[] d, int[] s, int len) {
		System.arraycopy(s, 0, d, 0, len);
	}

	static final void memcpy(int[] d, int dp, int[] s, int len) {
		System.arraycopy(s, 0, d, dp, len);
	}

	static final void memcpy(int[] d, int dp, int[] s, int sp,int len) {
		System.arraycopy(s, sp, d, dp, len);
	}
	
	static private int[] copyOf(int[]d,int len)
	{
		int[]ret=new int[d==null?len:(len<d.length?d.length:len)];
		
		System.arraycopy(d, 0, ret, 0, d==null?len:(len>d.length?d.length:len));
		
		return ret;
	}

	
	/*=============================================================================
	** public function:
	**   "T algorithm" == "L algorithm" + "t algorithm".
	** args:    [in] ulkey: password defined by user;
	** args:    [in] flag: if 0b1:  =calculate RK
	** args:    [in] flag: if 0b10: =calculate DERK
	** args:    [in] flag: if 0b11: =calculate RK and DERK
	** return ulkey: NULL for default encryption key.
	**============================================================================*/
	public final int[] SetKey(int[] ulkey, int flag)
	{
	    SMS4CalcRK(copyOf(ulkey,4),flag);

	    return ulkey;
	}

	/*=============================================================================
	** public function:
	**   sms4 encryption algorithm.
	** args:   [in/out] psrc: a pointer point to original contents;
	** args:   [in] lgsrc: the length of original contents;
	** args:   [in] derk: a pointer point to encryption/decryption key;
	** return: pRet: a pointer point to encrypted contents.
	**============================================================================*/
	
	public final int[] Encrypt(int[] psrc, int[] pdst, int[] rk)
	{
		int lgsrc=psrc.length<<2;
	    int[] pRet = null;
	    int i = 0;
	    
	    int ulbuf[]=new int[36];

	    int ulCnter = 0;
	    int ulTotal = (lgsrc >>> 4);
	    int uleft = lgsrc;
	    
	    int pdst_pos=0,psrc_pos=0;
	    
	    if(pdst != null)
	    {
	        pRet = pdst;
//	printf("%p, %p, %p \n", psrc, pdst, pRet);
	        
	        /* !!!It's a temporary scheme: start!!! */
	        /*========================================
	        ** 16 bytes(128 bits) is deemed as an unit.
	        **======================================*/
	        while (ulCnter<ulTotal) 
	        {
	            /* reset number counter */
	            i = 0;

	            /* filled up with 0*/
	            memset(ulbuf, 0, ulbuf.length);
	            memcpy(ulbuf,0, psrc, psrc_pos, 4);

//	#ifdef SMS4DBG0
//	            printf("0x%08x, 0x%08x, 0x%08x, 0x%08x, \n", 
//	                   ulbuf[0], ulbuf[1], ulbuf[2], ulbuf[3]);
//	#endif /* SMS4DBG0 */
	            
	            while(i<32)
	            {
	                ulbuf[i+4] = SMS4F(ulbuf[i], ulbuf[i+1], 
	                                   ulbuf[i+2], ulbuf[i+3], rk[i]);
//	#ifdef SMS4DBG0
//	                printf("0x%08x, \n", ulbuf[i+4]);
//	#endif /* SMS4DBG0 */
	                i++;
	            }

	            /* save encrypted contents to original area */
	            pdst[0+pdst_pos] = ulbuf[35];
	            pdst[1+pdst_pos] = ulbuf[34];
	            pdst[2+pdst_pos] = ulbuf[33];
	            pdst[3+pdst_pos] = ulbuf[32];

	            ulCnter++;
	            psrc_pos += 4;

	            uleft -= 4;
//	            printf("0x%08x, 0x%08x, 0x%08x, 0x%08x, \n", 
//	               pdst[0], pdst[1], pdst[2], pdst[3]);
	            pdst_pos += 4;
	        }

	        /* !!!It's a temporary scheme: end!!! */
	        
	    }
//	printf("%p, %p, %p \n", psrc, pdst, pRet);

	    return pRet;
	}
	
	public final int[] Encrypt(int[] psrc, int[] pdst)
	{
		return Encrypt(psrc,pdst,this.ENRK);
	}

	public final int[] Encrypt(int[] psrc)
	{
		return Encrypt(psrc,psrc);
	}

	public final byte[] Encrypt(byte[] bufIn, byte[] out) {
		int[] tmp=ba2ia(bufIn,bufIn.length,false);
		int[] ret=Encrypt(tmp,tmp);
		return ia2ba(out,ret,ret.length,false);
	}

	public final byte[] Encrypt(byte[] psrc)
	{
		return Encrypt(psrc,psrc);
	}

	public final int[] Decrypt(int[] psrc, int[] out, int[] derk)
	{
		return Encrypt(psrc,out,derk);
	}
	
	public final int[] Decrypt(int[] psrc, int[] out)
	{
		return Encrypt(psrc,out,this.DERK);
	}
	
	public final int[] Decrypt(int[] psrc)
	{
		return Decrypt(psrc,psrc);
	}
	
	public final byte[] Decrypt(byte[] bufIn, byte[] out) {
		int[] tmp=ba2ia(bufIn,bufIn.length,false);
		int[] ret=Decrypt(tmp,tmp,this.DERK);
		return ia2ba(out,ret,ret.length,false);
	}
	
	public final byte[] Decrypt(byte[] psrc)
	{
		return Decrypt(psrc,psrc);
	}

	static void print(int[] a)
	{
		for(int i=0;i<a.length;i++)
		{
			System.out.println(String.format("%08X", a[i]));
		}
		
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		
	    /* original contents for debugging */
	    int pData[] = 
	    {
	    0x01234567,
	    0x89abcdef,
	    0xfedcba98,
	    0x76543210
	    };

	    /* original contents for debugging */
	    int pData2[] = 
	    {
		    0x01234567,
		    0x89abcdef,
		    0xfedcba98,
		    0x76543210,
		    
		    0x12121212,
		    0x34343434,
		    0x56565656,
		    0x78787878,
		    
		    0x12341234
	    };
	    
	    int o1[]=new int[4],o2[]=new int[9];

	    Sm4 sm4=new Sm4(new int[]{0x01234567,0x89abcdef,0xfedcba98,0x76543210});
	    sm4=new Sm4(new int[]{0x01234567,0x89abcdef,0xfedcba98,0x76543210},0);
	    /* cycle1: common test */
	    sm4.Encrypt(pData);
	    sm4.Decrypt(pData);
	    
	    print(pData);
	    
	    /* cycle2: encrypted 1000000 times */
//	    SMS4Encrypt1M();

	    /* cycle3: longer contents */
	    sm4.Encrypt(pData2);
	    sm4.Decrypt(pData2);
	    print(pData2);
		
	}


}
