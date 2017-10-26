package com.citibank.common;


class LSW_CTX {
	int Hashblock;
	int Numbytes;
	int Numblocks[] = new int[2];
	int Mblock[] = new int[16];
	int Tailbits;
	int H[] = new int[8];
	
	public void reset()
	{
		Hashblock=Numbytes=Tailbits=0;
		java.util.Arrays.fill(Numblocks, 0);
		java.util.Arrays.fill(Mblock, 0);
		java.util.Arrays.fill(H, 0);
	}

}

public class Sm3 extends Mem {
	final static int LSWDIGITLEN = 4;
	final static int LSWBLOCKLEN = 512;
	final static int LSWBYTEBLOCKLEN = LSWBLOCKLEN / 8;

	final static int P0(int x) {
		return 0xFFFFFFFF & ((x) ^ (((x) << 9) | ((x) >>> 23)) ^ (((x) << 17) | ((x) >>> 15)));
	}

	final static int P1(int x) {
		return 0xFFFFFFFF & ((x) ^ (((x) << 15) | ((x) >>> 17)) ^ (((x) << 23) | ((x) >>> 9)));
	}
	

	final static void LSWInit(LSW_CTX lswContext) {
		int i;
		int IH[] = { 0x7380166f, 0x4914b2b9, 0x172442d7, 0xda8a0600,
				0xa96f30bc, 0x163138aa, 0xe38dee4d, 0xb0fb0e4e };
		lswContext.Numblocks[0] = 0;
		lswContext.Numblocks[1] = 0;
		for (i = 0; i < 8; i++)
			lswContext.H[i] = IH[i];
	};

	final static void LSWProcessBlock(LSW_CTX lswContext) {
		int i, j;
		int A, B, C, D, E, F, G, H, tmp;
		int SS1, SS2, TT1, TT2, T;
		int[] W0 = new int[68];

		A = lswContext.H[0];
		B = lswContext.H[1];
		C = lswContext.H[2];
		D = lswContext.H[3];
		E = lswContext.H[4];
		F = lswContext.H[5];
		G = lswContext.H[6];
		H = lswContext.H[7];

		for (i = 0; i < 16; i++)
			W0[i] = lswContext.Mblock[i];

		for (i = 16; i < 68; i++) {
			tmp = ((W0[i - 3] << 15) | (W0[i - 3] >>> 17)) ^ W0[i - 9]
					^ W0[i - 16];
			W0[i] = P1(tmp) ^ ((W0[i - 13] << 7) | (W0[i - 13] >>> 25))
					^ W0[i - 6];
		}

		T = 0x79cc4519;
		for (i = 0; i < 16; i++) {
			SS2 = (A << 12) | (A >>> 20);
			SS1 = SS2 + E + ((T << i) | (T >>> (32 - i)));
			SS1 = (SS1 << 7) | (SS1 >>> 25);
			SS2 ^= SS1;
			TT1 = (A ^ B ^ C) + D + SS2 + (W0[i] ^ W0[i + 4]);
			TT2 = (E ^ F ^ G) + H + SS1 + W0[i];
			D = C;
			C = (B << 9) | (B >>> 23);
			B = A;
			A = TT1;
			H = G;
			G = (F << 19) | (F >>> 13);
			F = E;
			E = P0(TT2);
		}

		T = 0x7a879d8a;
		for (i = 16; i < 64; i++) {
			SS2 = (A << 12) | (A >>> 20);
			j = i % 32;
			SS1 = SS2 + E + ((T << j) | (T >>> (32 - j)));
			SS1 = (SS1 << 7) | (SS1 >>> 25);
			SS2 ^= SS1;
			TT1 = ((A & B) | (A & C) | (B & C)) + D + SS2 + (W0[i] ^ W0[i + 4]);
			TT2 = ((E & F) | ((~E) & G)) + H + SS1 + W0[i];
			D = C;
			C = (B << 9) | (B >>> 23);
			B = A;
			A = TT1;
			H = G;
			G = (F << 19) | (F >>> 13);
			F = E;
			E = P0(TT2);
		}

		lswContext.H[0] ^= A;
		lswContext.H[1] ^= B;
		lswContext.H[2] ^= C;
		lswContext.H[3] ^= D;
		lswContext.H[4] ^= E;
		lswContext.H[5] ^= F;
		lswContext.H[6] ^= G;
		lswContext.H[7] ^= H;
	}

	final static int LSWUpdate(LSW_CTX lswContext, byte[] buffer, int bitcount) {
		int i, m, nbuff = 0;

		while (bitcount >= LSWBLOCKLEN) {
			if (lswContext.Numblocks[1] == 0xffffffff) {
				lswContext.Numblocks[0]++;
				lswContext.Numblocks[1] = 0;
			} else
				lswContext.Numblocks[1]++;

			for (i = 0; i < LSWBYTEBLOCKLEN / 4; i++) {

				lswContext.Mblock[i]  = byte2int(buffer[nbuff + (i << 2)]) << 24;
				lswContext.Mblock[i] += byte2int(buffer[nbuff + (i << 2) + 1]) << 16;
				lswContext.Mblock[i] += byte2int(buffer[nbuff + (i << 2) + 2]) << 8;
				lswContext.Mblock[i] += byte2int(buffer[nbuff + (i << 2) + 3]);
			}

			LSWProcessBlock(lswContext);
			nbuff += (LSWBYTEBLOCKLEN);
			bitcount -= LSWBLOCKLEN;
		}

		for (i = 0; i < 16; i++)
			lswContext.Mblock[i] = 0;
		if (bitcount != 0) {
			m = 24;
			for (i = 0; i < (bitcount + 7) / 8; i++) {
				if (m < 0)
					m = 24;
				lswContext.Mblock[i / 4] += byte2int(buffer[nbuff + i]) << m;
				m -= 8;
			}
		}
		lswContext.Tailbits = bitcount;
		return 0;
	}

	final static int LSWFinal(LSW_CTX lswContext) {
		int i, k, numsub, ys;
		int numbits;
		int padbits = 0x80000000, padbits2 = 0xffffffff;

		numbits = lswContext.Tailbits;
		numsub = (int) numbits / 32;
		ys = numbits & 31;
		if (ys == 0) {
			padbits2 <<= 31;
			lswContext.Mblock[numsub] |= padbits;
			lswContext.Mblock[numsub] &= padbits2;
		} else {

			padbits >>>= ys;
			padbits2 <<= (31 - ys);
			lswContext.Mblock[numsub] |= padbits;
			lswContext.Mblock[numsub] &= padbits2;
		}
		for (k = numsub + 1; k < 16; k++)
			lswContext.Mblock[k] = 0;

		if (numsub > 13) {
			LSWProcessBlock(lswContext);
			for (i = 0; i < 14; i++)
				lswContext.Mblock[i] = 0;
		}

		lswContext.Mblock[14] = ((lswContext.Numblocks[0] << 9) + (lswContext.Numblocks[1] >>> 23));
		lswContext.Mblock[15] = ((lswContext.Numblocks[1] << 9) + numbits);

		LSWProcessBlock(lswContext);
		return 0;
	}

	final int LSWValue(LSW_CTX lswContext) {
		int A, B, C, D, E, F, G, H;
		A = lswContext.H[0];
		B = lswContext.H[1];
		C = lswContext.H[2];
		D = lswContext.H[3];
		E = lswContext.H[4];
		F = lswContext.H[5];
		G = lswContext.H[6];
		H = lswContext.H[7];
		switch (lswContext.Hashblock) {
		case 256:
			lswContext.H[0] = A;
			lswContext.H[1] = B;
			lswContext.H[2] = C;
			lswContext.H[3] = D;
			lswContext.H[4] = E;
			lswContext.H[5] = F;
			lswContext.H[6] = G;
			lswContext.H[7] = H;
			return 8;
		case 192:
			lswContext.H[0] = A ^ B ^ E;
			lswContext.H[1] = B ^ F;
			lswContext.H[2] = C ^ G;
			lswContext.H[3] = D ^ H;
			lswContext.H[4] = F ^ C;
			lswContext.H[5] = D ^ G;
			lswContext.H[6] = 0;
			lswContext.H[7] = 0;
			return 6;
		case 160:
			lswContext.H[0] = A ^ B ^ E;
			lswContext.H[1] = B ^ F ^ C;
			lswContext.H[2] = C ^ G;
			lswContext.H[3] = D ^ H;
			lswContext.H[4] = D ^ G;
			lswContext.H[5] = 0;
			lswContext.H[6] = 0;
			lswContext.H[7] = 0;
			return 5;
		default:
			return 0;
		}
	}


	public final static void hmac_sm3(byte[] key, int keylen, byte[] buf, int buflen,
			byte digest[]) {
		int i;
		byte[] k_ipad = new byte[64];
		byte[] k_opad = new byte[64];
		byte[] tmp = new byte[256];
		byte[] tmpbuf = new byte[32];
		int tmpbuflen;
		LSW_CTX lswContext = new LSW_CTX();

		memset(k_ipad, 0, 64);
		memset(k_opad, 0, 64);
		memset(tmpbuf, 0, 32);
		memcpy(k_ipad, key, keylen);
		memcpy(k_opad, key, keylen);

		for (i = 0; i < 64; i++) {
			k_ipad[i] ^= 0x36;
			k_opad[i] ^= 0x5c;
		}

		memset(tmp, 0, tmp.length);
		memcpy(tmp, k_ipad, 64);
		memcpy(tmp, 64, buf, 0,buflen);
		lswContext.reset();

		lswContext.Hashblock = 256;
		LSWInit(lswContext);
		LSWUpdate(lswContext, tmp, (64 + buflen) * 8);
		LSWFinal(lswContext);
		for (i = 0; i < 8; i++) {
			int2byte(tmpbuf, i * 4,lswContext.H[i],Mem.BIG_INDIAN);
		}
		tmpbuflen = i * 4;

		memset(tmp, 0, tmp.length);
		memcpy(tmp, k_opad, 64);
		memcpy(tmp, 64, tmpbuf, 0,tmpbuflen);
		lswContext.reset();
		lswContext.Hashblock = 256;
		LSWInit(lswContext);
		LSWUpdate(lswContext, tmp, (64 + tmpbuflen) * 8);
		LSWFinal(lswContext);
		for (i = 0; i < 8; i++) {
			int2byte(digest, i * 4,lswContext.H[i],Mem.BIG_INDIAN);
		}

		memset(k_ipad, 0, 64);
		memset(k_opad, 0, 64);
		memset(tmpbuf, 0, 32);
	}

	static final public void  csum_ex(byte[] key, int keylen, byte[] buf, int buflen,
			byte digest[]) {
		LSW_CTX lswContext = new LSW_CTX();
		byte[] tmp = new byte[256];

		memset(tmp, 0, tmp.length);
		memcpy(tmp, key, keylen);
		memcpy(tmp, keylen, buf, 0,buflen);

		lswContext.reset();

		lswContext.Hashblock = 256;
		LSWInit(lswContext);
		LSWUpdate(lswContext, tmp, (keylen + buflen) * 8);
		LSWFinal(lswContext);
		for (int i = 0; i < 8; i++) {
			int2byte(digest, i * 4,lswContext.H[i],Mem.BIG_INDIAN);
		}
	}

	static final public void csum(byte[] buf, int buflen, byte digest[]) {

		LSW_CTX lswContext = new LSW_CTX();

		lswContext.reset();
		lswContext.Hashblock = 256;
		LSWInit(lswContext);
		LSWUpdate(lswContext, buf, buflen * 8);
		LSWFinal(lswContext);

		for (int i = 0; i < 8; i++) {
			int2byte(digest, i * 4,lswContext.H[i],Mem.BIG_INDIAN);
		}
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		byte[] d={'a','b','c'};
		byte[] dst=new byte[256/8];
		Sm3.csum(d,d.length,dst);
		
		System.out.println(dst);
	}

}
