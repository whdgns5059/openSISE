package kr.co.opensise.member.encrypt.sha;

/**
@file KISA_SHA256.java
@brief SHA256 ��ȣ �˰���
@author Copyright (c) 2013 by KISA
@remarks http://seed.kisa.or.kr/
*/

public class KISA_SHA256 {

	// DEFAULT : JAVA = BIG_ENDIAN
	private static int ENDIAN = Common.BIG_ENDIAN;

	private static final int SHA256_DIGEST_BLOCKLEN = 64;
	private static final int SHA256_DIGEST_VALUELEN = 32;

	public static String encrypt(String plainText) {
		StringBuffer encryptStringBuffer = new StringBuffer();
		byte[] encryptByte = new byte[32];	
				
		/***when***/
		KISA_SHA256.SHA256_Encrpyt(plainText.getBytes(), plainText.getBytes().length, encryptByte);
		
		/***then***/
		for (int i=0; i<32; i++)
			encryptStringBuffer.append(Integer.toHexString(0xff&encryptByte[i]));
		
		return encryptStringBuffer.toString();
	}
	
	private static final int SHA256_K[] =
	{
		0x428a2f98, 0x71374491, 0xb5c0fbcf, 0xe9b5dba5, 0x3956c25b, 0x59f111f1,
		0x923f82a4, 0xab1c5ed5, 0xd807aa98, 0x12835b01, 0x243185be, 0x550c7dc3,
		0x72be5d74, 0x80deb1fe, 0x9bdc06a7, 0xc19bf174, 0xe49b69c1, 0xefbe4786,
		0x0fc19dc6, 0x240ca1cc, 0x2de92c6f, 0x4a7484aa, 0x5cb0a9dc, 0x76f988da,
		0x983e5152, 0xa831c66d, 0xb00327c8, 0xbf597fc7, 0xc6e00bf3, 0xd5a79147,
		0x06ca6351, 0x14292967, 0x27b70a85, 0x2e1b2138, 0x4d2c6dfc, 0x53380d13,
		0x650a7354, 0x766a0abb, 0x81c2c92e, 0x92722c85, 0xa2bfe8a1, 0xa81a664b,
		0xc24b8b70, 0xc76c51a3, 0xd192e819, 0xd6990624, 0xf40e3585, 0x106aa070,
		0x19a4c116, 0x1e376c08, 0x2748774c, 0x34b0bcb5, 0x391c0cb3, 0x4ed8aa4a,
		0x5b9cca4f, 0x682e6ff3, 0x748f82ee, 0x78a5636f, 0x84c87814, 0x8cc70208,
		0x90befffa, 0xa4506ceb, 0xbef9a3f7, 0xc67178f2
	};


	private static final int ROTL_ULONG(int x, int n) {
		return (x << n) | Common.URShift(x, 32 - n);
	}

	private static final int ROTR_ULONG(int x, int n) {
		return Common.URShift(x, n) | (x << (32 - (n)));
	}

	private static final int ENDIAN_REVERSE_ULONG(int dwS) {
		return ( (ROTL_ULONG((dwS),  8) & 0x00ff00ff) | (ROTL_ULONG((dwS), 24) & 0xff00ff00) );
	}

	private static final void BIG_D2B(int D, byte[] B, int B_offset) {
		Common.int_to_byte_unit(B, B_offset, D, ENDIAN);
	}

	private static final int RR(int x, int n) { return ROTR_ULONG(x, n); }
	private static final int SS(int x, int n) { return Common.URShift(x, n); }

	private static final int Ch(int x, int y, int z) { return ((x & y) ^ ((~x) & z)); }
	private static final int Maj(int x, int y, int z) { return ((x & y) ^ (x & z) ^ (y & z)); }
	private static final int Sigma0(int x) { return (RR(x,  2) ^ RR(x, 13) ^ RR(x, 22)); }
	private static final int Sigma1(int x) { return (RR(x,  6) ^ RR(x, 11) ^ RR(x, 25)); }

	private static final int RHO0(int x) { return (RR(x,  7) ^ RR(x, 18) ^ SS(x,  3)); }
	private static final int RHO1(int x) { return (RR(x, 17) ^ RR(x, 19) ^ SS(x, 10)); }

	private static final int abcdefgh_a = 0;
	private static final int abcdefgh_b = 1;
	private static final int abcdefgh_c = 2;
	private static final int abcdefgh_d = 3;
	private static final int abcdefgh_e = 4;
	private static final int abcdefgh_f = 5;
	private static final int abcdefgh_g = 6;
	private static final int abcdefgh_h = 7;

	private static final void FF(int[] abcdefgh, int a, int b, int c, int d, int e, int f, int g, int h, int[] X, int j) {
		long T1;

		T1 = Common.intToUnsigned(abcdefgh[h]) + Common.intToUnsigned(Sigma1(abcdefgh[e])) + Common.intToUnsigned(Ch(abcdefgh[e], abcdefgh[f], abcdefgh[g])) + Common.intToUnsigned(SHA256_K[j]) + Common.intToUnsigned(X[j]);
		abcdefgh[d] += T1;
		abcdefgh[h] = (int)(T1 + Common.intToUnsigned(Sigma0(abcdefgh[a])) + Common.intToUnsigned(Maj(abcdefgh[a], abcdefgh[b], abcdefgh[c])));
	}

	private static final int GetData(byte[] x, int x_offset) {
		return Common.byte_to_int(x, x_offset, ENDIAN);
	}
	
	//*********************************************************************************************************************************
	// o SHA256_Transform() : 512 ��Ʈ ���� ����� �޽����� �Է� �޾� ���⺯���� �����ϴ� ���� �Լ��ν�
	//	                      4 ����(64 �ܰ�)�� �����Ǹ� 8���� ���⺯��(a, b, c, d, e, f, g, h)�� ���
	// o �Է�                               : Message               - �Է� �޽����� ������ ����
	//	                      ChainVar              - ���⺯���� ������ ����
	// o ���                               :
	//*********************************************************************************************************************************
	private static void SHA256_Transform(byte[] Message, int[] ChainVar) {
		int abcdefgh[] = new int[8];
		int T1[] = new int[1];
		int X[] = new int[64];
		int j;

		for (j = 0; j < 16; j++)
			X[j] = GetData(Message, j*4);

		for (j = 16; j < 64; j++)
			X[j] = (int)(Common.intToUnsigned(RHO1(X[j - 2])) + Common.intToUnsigned(X[j - 7]) + Common.intToUnsigned(RHO0(X[j - 15])) + Common.intToUnsigned(X[j - 16]));

		abcdefgh[abcdefgh_a] = ChainVar[0];
		abcdefgh[abcdefgh_b] = ChainVar[1];
		abcdefgh[abcdefgh_c] = ChainVar[2];
		abcdefgh[abcdefgh_d] = ChainVar[3];
		abcdefgh[abcdefgh_e] = ChainVar[4];
		abcdefgh[abcdefgh_f] = ChainVar[5];
		abcdefgh[abcdefgh_g] = ChainVar[6];
		abcdefgh[abcdefgh_h] = ChainVar[7];

		for (j = 0; j < 64; j += 8)
		{
			FF(abcdefgh, abcdefgh_a, abcdefgh_b, abcdefgh_c, abcdefgh_d, abcdefgh_e, abcdefgh_f, abcdefgh_g, abcdefgh_h, X, j + 0);
			FF(abcdefgh, abcdefgh_h, abcdefgh_a, abcdefgh_b, abcdefgh_c, abcdefgh_d, abcdefgh_e, abcdefgh_f, abcdefgh_g, X, j + 1);
			FF(abcdefgh, abcdefgh_g, abcdefgh_h, abcdefgh_a, abcdefgh_b, abcdefgh_c, abcdefgh_d, abcdefgh_e, abcdefgh_f, X, j + 2);
			FF(abcdefgh, abcdefgh_f, abcdefgh_g, abcdefgh_h, abcdefgh_a, abcdefgh_b, abcdefgh_c, abcdefgh_d, abcdefgh_e, X, j + 3);
			FF(abcdefgh, abcdefgh_e, abcdefgh_f, abcdefgh_g, abcdefgh_h, abcdefgh_a, abcdefgh_b, abcdefgh_c, abcdefgh_d, X, j + 4);
			FF(abcdefgh, abcdefgh_d, abcdefgh_e, abcdefgh_f, abcdefgh_g, abcdefgh_h, abcdefgh_a, abcdefgh_b, abcdefgh_c, X, j + 5);
			FF(abcdefgh, abcdefgh_c, abcdefgh_d, abcdefgh_e, abcdefgh_f, abcdefgh_g, abcdefgh_h, abcdefgh_a, abcdefgh_b, X, j + 6);
			FF(abcdefgh, abcdefgh_b, abcdefgh_c, abcdefgh_d, abcdefgh_e, abcdefgh_f, abcdefgh_g, abcdefgh_h, abcdefgh_a, X, j + 7);
		}

		ChainVar[0] += abcdefgh[abcdefgh_a];
		ChainVar[1] += abcdefgh[abcdefgh_b];
		ChainVar[2] += abcdefgh[abcdefgh_c];
		ChainVar[3] += abcdefgh[abcdefgh_d];
		ChainVar[4] += abcdefgh[abcdefgh_e];
		ChainVar[5] += abcdefgh[abcdefgh_f];
		ChainVar[6] += abcdefgh[abcdefgh_g];
		ChainVar[7] += abcdefgh[abcdefgh_h];
	}

	/**
	@brief ���⺯���� ���̺����� �ʱ�ȭ�ϴ� �Լ�
	@param Info : SHA256_Process ȣ�� �� ���Ǵ� ����ü
	*/
	public static void SHA256_Init( SHA256_INFO Info ) {
		Info.uChainVar[0] = 0x6a09e667;
		Info.uChainVar[1] = 0xbb67ae85;
		Info.uChainVar[2] = 0x3c6ef372;
		Info.uChainVar[3] = 0xa54ff53a;
		Info.uChainVar[4] = 0x510e527f;
		Info.uChainVar[5] = 0x9b05688c;
		Info.uChainVar[6] = 0x1f83d9ab;
		Info.uChainVar[7] = 0x5be0cd19;

		Info.uHighLength = Info.uLowLength = 0;
	}

	/**
	@brief ���⺯���� ���̺����� �ʱ�ȭ�ϴ� �Լ�
	@param Info : SHA256_Init ȣ���Ͽ� �ʱ�ȭ�� ����ü(���������� ���ȴ�.)
	@param pszMessage : ����� �Է� ��
	@param inLen : ����� �Է� �� ����
	*/
	public static void SHA256_Process( SHA256_INFO Info, byte[] pszMessage, int uDataLen ) {
		int pszMessage_offset;

		if((Info.uLowLength += (uDataLen << 3)) < 0) {
			Info.uHighLength++;
		}

		Info.uHighLength += Common.URShift(uDataLen,29);

		pszMessage_offset = 0;
		while (uDataLen >= SHA256_DIGEST_BLOCKLEN) {
			Common.arraycopy_offset(Info.szBuffer, 0, pszMessage, pszMessage_offset, SHA256_DIGEST_BLOCKLEN);
			SHA256_Transform(Info.szBuffer, Info.uChainVar);
			pszMessage_offset += SHA256_DIGEST_BLOCKLEN;
			uDataLen -= SHA256_DIGEST_BLOCKLEN;
		}

		Common.arraycopy_offset(Info.szBuffer, 0, pszMessage, pszMessage_offset, uDataLen);
	}

	/**
	@brief �޽��� �����̱�� ���� �����̱⸦ ������ �� ������ �޽��� ����� ������ �����Լ��� ȣ���ϴ� �Լ�
	@param Info : SHA256_Init ȣ���Ͽ� �ʱ�ȭ�� ����ü(���������� ���ȴ�.)
	@param pszDigest : ��ȣ��
	*/
	public static void SHA256_Close( SHA256_INFO Info, byte[] pszDigest ) {
		int i, Index;

		Index = Common.URShift(Info.uLowLength, 3) % SHA256_DIGEST_BLOCKLEN;
		Info.szBuffer[Index++] = (byte)0x80;

		if (Index > SHA256_DIGEST_BLOCKLEN - 8) {
			Common.arrayinit_offset(Info.szBuffer, Index, (byte)0, SHA256_DIGEST_BLOCKLEN - Index);
			SHA256_Transform(Info.szBuffer, Info.uChainVar);
			Common.arrayinit(Info.szBuffer, (byte)0, SHA256_DIGEST_BLOCKLEN - 8);
		}
		else {
			Common.arrayinit_offset(Info.szBuffer, Index, (byte)0, SHA256_DIGEST_BLOCKLEN - Index - 8);
		}

		if(ENDIAN == Common.LITTLE_ENDIAN) {
			Info.uLowLength = ENDIAN_REVERSE_ULONG(Info.uLowLength);
			Info.uHighLength = ENDIAN_REVERSE_ULONG(Info.uHighLength);
		}

		Common.int_to_byte_unit(Info.szBuffer, ((int)(SHA256_DIGEST_BLOCKLEN / 4 - 2))*4, Info.uHighLength, ENDIAN);
		Common.int_to_byte_unit(Info.szBuffer, ((int)(SHA256_DIGEST_BLOCKLEN / 4 - 1))*4, Info.uLowLength, ENDIAN);

		SHA256_Transform(Info.szBuffer, Info.uChainVar);

		for (i = 0; i < SHA256_DIGEST_VALUELEN; i += 4)
			BIG_D2B((Info.uChainVar)[i / 4], pszDigest, i);
	}

	/**
	@brief ����� �Է� ���� �ѹ��� ó��
	@param pszMessage : ����� �Է� ��
	@param pszDigest : ��ȣ��
	@remarks ���������� SHA256_Init, SHA256_Process, SHA256_Close�� ȣ���Ѵ�.
	*/
	public static void SHA256_Encrpyt( byte[] pszMessage, int uPlainTextLen, byte[] pszDigest ) {
		SHA256_INFO info = new SHA256_INFO();
		SHA256_Init( info );
		SHA256_Process( info, pszMessage, uPlainTextLen );
		SHA256_Close( info, pszDigest );
	}


	public static class SHA256_INFO {
		public int uChainVar[] = new int[SHA256_DIGEST_VALUELEN / 4];
		public int uHighLength;
		public int uLowLength;
		public byte szBuffer[] = new byte[SHA256_DIGEST_BLOCKLEN];
	}
	
	public static class Common {
		
		public static final int BIG_ENDIAN = 0;
		public static final int LITTLE_ENDIAN = 1;

		public static void arraycopy(byte[] dst, byte[] src, int length) {
			for(int i=0; i<length; i++) {
				dst[i] = src[i];
			}
		}

		public static void arraycopy_offset(byte[] dst, int dst_offset, byte[] src, int src_offset, int length) {
			for(int i=0; i<length; i++) {
				dst[dst_offset+i] = src[src_offset+i];
			}
		}

		public static void arrayinit(byte[] dst, byte value, int length) {
			for(int i=0; i<length; i++) {
				dst[i] = value;
			}
		}
		
		public static void arrayinit_offset(byte[] dst, int dst_offset, byte value, int length) {
			for(int i=0; i<length; i++) {
				dst[dst_offset+i] = value;
			}
		}

		public static void memcpy(int[] dst, byte[] src, int length, int ENDIAN) {
			int iLen = length / 4;
			for(int i=0; i<iLen; i++) {
				byte_to_int(dst, i, src, i*4, ENDIAN);
			}
		}

		public static void memcpy(int[] dst, int[] src, int src_offset, int length) {
	    	int iLen = length / 4 + ((length % 4 != 0)?1:0);
			for(int i=0; i<iLen; i++) {
				dst[i] = src[src_offset+i];
			}
		}

		public static void set_byte_for_int(int[] dst, int b_offset, byte value, int ENDIAN) {
			if(ENDIAN == BIG_ENDIAN) {
				int shift_value = (3-b_offset%4)*8;
				int mask_value =  0x0ff << shift_value;
				int mask_value2 = ~mask_value;
				int value2 = (value&0x0ff) << shift_value;
				dst[b_offset/4] = (dst[b_offset/4] & mask_value2) | (value2 & mask_value);    
			} else {
				int shift_value = (b_offset%4)*8;
				int mask_value =  0x0ff << shift_value;
				int mask_value2 = ~mask_value;
				int value2 = (value&0x0ff) << shift_value;
				dst[b_offset/4] = (dst[b_offset/4] & mask_value2) | (value2 & mask_value);    
			}
		}
		
		public static byte get_byte_for_int(int[] src, int b_offset, int ENDIAN) {
			if(ENDIAN == BIG_ENDIAN) {
				int shift_value = (3-b_offset%4)*8;
				int mask_value =  0x0ff << shift_value;
				int value = (src[b_offset/4] & mask_value) >> shift_value;
				return (byte)value;
			} else {
				int shift_value = (b_offset%4)*8;
				int mask_value =  0x0ff << shift_value;
				int value = (src[b_offset/4] & mask_value) >> shift_value;
				return (byte)value;
			}
			
		}
		
		public static byte[] get_bytes_for_ints(int[] src, int offset, int ENDIAN) {
			int iLen = src.length-offset;
			byte[] result = new byte[(iLen)*4];
			for(int i=0; i<iLen; i++) {
				int_to_byte(result, i*4, src, offset+i, ENDIAN);
			}
			
			return result;
		}

		public static void byte_to_int(int[] dst, int dst_offset, byte[] src, int src_offset, int ENDIAN) {
			if(ENDIAN == BIG_ENDIAN) {
				dst[dst_offset] = ((0x0ff&src[src_offset]) << 24) | ((0x0ff&src[src_offset+1]) << 16) | ((0x0ff&src[src_offset+2]) << 8) | ((0x0ff&src[src_offset+3]));
			} else {
				dst[dst_offset] = ((0x0ff&src[src_offset])) | ((0x0ff&src[src_offset+1]) << 8) | ((0x0ff&src[src_offset+2]) << 16) | ((0x0ff&src[src_offset+3]) << 24);
			}
		}
		
		public static int byte_to_int(byte[] src, int src_offset, int ENDIAN) {
			if(ENDIAN == BIG_ENDIAN) {
				return ((0x0ff&src[src_offset]) << 24) | ((0x0ff&src[src_offset+1]) << 16) | ((0x0ff&src[src_offset+2]) << 8) | ((0x0ff&src[src_offset+3]));
			} else {
				return ((0x0ff&src[src_offset])) | ((0x0ff&src[src_offset+1]) << 8) | ((0x0ff&src[src_offset+2]) << 16) | ((0x0ff&src[src_offset+3]) << 24);
			}
		}

		public static int byte_to_int_big_endian(byte[] src, int src_offset) {
			return ((0x0ff&src[src_offset]) << 24) | ((0x0ff&src[src_offset+1]) << 16) | ((0x0ff&src[src_offset+2]) << 8) | ((0x0ff&src[src_offset+3]));
		}

		public static void int_to_byte(byte[] dst, int dst_offset, int[] src, int src_offset, int ENDIAN) {
			int_to_byte_unit(dst, dst_offset, src[src_offset], ENDIAN);
		}
		
		public static void int_to_byte_unit(byte[] dst, int dst_offset, int src, int ENDIAN) {
			if(ENDIAN == BIG_ENDIAN) {
				dst[dst_offset] = (byte)((src>> 24) & 0x0ff);
				dst[dst_offset+1] = (byte)((src >> 16) & 0x0ff);
				dst[dst_offset+2] = (byte)((src >> 8) & 0x0ff);
				dst[dst_offset+3] = (byte)((src) & 0x0ff);
			} else {
				dst[dst_offset] = (byte)((src) & 0x0ff);
				dst[dst_offset+1] = (byte)((src >> 8) & 0x0ff);
				dst[dst_offset+2] = (byte)((src >> 16) & 0x0ff);
				dst[dst_offset+3] = (byte)((src >> 24) & 0x0ff);
			}
			
		}

		public static void int_to_byte_unit_big_endian(byte[] dst, int dst_offset, int src) {
			dst[dst_offset] = (byte)((src>> 24) & 0x0ff);
			dst[dst_offset+1] = (byte)((src >> 16) & 0x0ff);
			dst[dst_offset+2] = (byte)((src >> 8) & 0x0ff);
			dst[dst_offset+3] = (byte)((src) & 0x0ff);
		}

		public static int URShift(int x, int n) {
			if(n == 0)
				return x;
			if(n >= 32)
				return 0;
			int v = x >> n;
			int v_mask = ~(0x80000000 >> (n-1));
			return v & v_mask;
		}
		
		public static final long INT_RANGE_MAX = (long)Math.pow(2, 32);

		public static long intToUnsigned(int x) {
			if(x >= 0)
				return x;
			return x + INT_RANGE_MAX;
		}
	}
	
	public static void main(String[] args)
	{
		byte pbData[]     = {(byte)0x00, (byte)0x01, (byte)0x02, (byte)0x03, (byte)0x04, (byte)0x05, (byte)0x06, (byte)0x07,
							(byte)0x08, (byte)0x09, (byte)0x0A, (byte)0x0B, (byte)0x0C, (byte)0x0D, (byte)0x0E, (byte)0x0F,
							(byte)0x08, (byte)0x09, (byte)0x0A, (byte)0x0B, (byte)0x0C, (byte)0x0D, (byte)0x0E, (byte)0x0F,
							(byte)0x00, (byte)0x01, (byte)0x02, (byte)0x03, (byte)0x04, (byte)0x05, (byte)0x06, (byte)0x07,
							(byte)0x08, (byte)0x09, (byte)0x0A, (byte)0x0B, (byte)0x0C, (byte)0x0D, (byte)0x0E, (byte)0x0F,
							(byte)0x08, (byte)0x09, (byte)0x0A, (byte)0x0B, (byte)0x0C, (byte)0x0D, (byte)0x0E, (byte)0x0F};
		byte pbData1[] = {(byte)0x61};
		
		byte pbCipher[]   = new byte[32];
		byte pbPlain[]    = new byte[16];
			
		System.out.print("[ Test SHA256 reference code ]"+"\n");
		System.out.print("\n\n");
		System.out.print("[ Test HASH mode ]"+"\n");
	    System.out.print("\n");
	    
	    int Plaintext_length = 1;
	    
	    for(int k=0; k<30; k++)
	    {
	    
			System.out.print("Plaintext\t: ");
		    for (int i=0; i<Plaintext_length; i++)	System.out.print(Integer.toHexString(0xff&pbData[i])+" ");
		    System.out.print("\n");
		  
		// Encryption		
		   SHA256_Encrpyt( pbData, Plaintext_length, pbCipher );
	
			System.out.print("Ciphertext\t: ");
		    for (int i=0; i<32; i++)	System.out.print(Integer.toHexString(0xff&pbCipher[i])+" ");
		    System.out.print("\n\n");
		    
		    Plaintext_length++;
		    
	    }
	    
	    
		System.out.print("Plaintext\t: ");
	    for (int i=0; i<1; i++)	System.out.print(Integer.toHexString(0xff&pbData1[i])+" ");
	    System.out.print("\n");	  
	// Encryption			    
	    SHA256_Encrpyt( pbData1, 1, pbCipher );
		System.out.print("Ciphertext\t: ");
	    for (int i=0; i<32; i++)	System.out.print(Integer.toHexString(0xff&pbCipher[i])+" ");
	    System.out.print("\n\n");
	    
	    
	    
	}

}
