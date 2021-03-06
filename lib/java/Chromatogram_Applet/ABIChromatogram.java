package Chromatogram_Applet;

import java.io.*;import java.util.*;
import Chromatogram_Applet.Chromatogram;
import Chromatogram_Applet.TaggedRecord;
public class ABIChromatogram extends Chromatogram {private int[] basePosition, A, C, G, T;private int traceLength;private char[] base;private String baseSequence;public static final int MagicNum = (((((int)'A'<<8)+(int)'B'<<8)+(int)'I'<<8)+(int)'F');	public ABIChromatogram(InputStream IN) throws IOException {		read(IN);	}
	
	public ABIChromatogram(InputStream IN, int available) throws IOException {
		read(IN, available);
	}		public void read(InputStream IN)  throws IOException{		DataInputStream dataIN = new DataInputStream(IN);		byte[] fileHeader = new byte[30];		dataIN.readFully(fileHeader);		ByteArrayInputStream hIN = new ByteArrayInputStream(fileHeader);		DataInputStream headerIN = new DataInputStream(hIN);		headerIN.skip(18);		int recordNum = headerIN.readInt();		//headerIN.skip(4);
		int itemBytes = headerIN.readInt();		int recordOffset = headerIN.readInt();		headerIN.reset();		byte[] fileBytes = new byte[recordOffset + recordNum * 28];
		// read from file to fill fileBytes		headerIN.readFully(fileBytes,0,30);		dataIN.readFully(fileBytes,30,fileBytes.length - 30);		ByteArrayInputStream plainbyteIN = new ByteArrayInputStream(fileBytes);		DataInputStream byteIN = new DataInputStream(plainbyteIN);		byteIN.skip(recordOffset);
		// starts from recordOffset: directory		// read tagged records into hash table		TaggedRecord[] records = new TaggedRecord[recordNum];		Hashtable rHash = new Hashtable(recordNum);		int i;		for (i=0;i<recordNum;i++) {			records[i] = new TaggedRecord(byteIN);			rHash.put(records[i].getTagName() + records[i].getTagNum(),records[i]);			}		// get base calls		TaggedRecord PBAS1 = (TaggedRecord) (rHash.get("PBAS1"));		int Offset = PBAS1.getDataRecord();		int elementNum = PBAS1.getElementNumber();		byteIN.reset();		byteIN.skip(Offset);		base = new char[elementNum];		for (i=0;i<elementNum;i++) {			base[i] = (char) byteIN.readUnsignedByte();		}		baseSequence = new String(base);
		//System.out.println("Base sequence: " + baseSequence);		// get base locations		TaggedRecord PLOC1 = (TaggedRecord) (rHash.get("PLOC1"));		Offset = PLOC1.getDataRecord();		elementNum = PLOC1.getElementNumber();		byteIN.reset();		byteIN.skip(Offset);		basePosition = new int[elementNum];		for (i=0;i<elementNum;i++) {			basePosition[i] = (char) byteIN.readUnsignedShort();		}		// get FWO (tells which trace is which)		TaggedRecord FWO1 = (TaggedRecord) (rHash.get("FWO_1"));		int packedChar = FWO1.getDataRecord();		char[] baseOrder = new char[4];		baseOrder[0] = (char) ((byte)(packedChar >> 24));		baseOrder[1] = (char) ((byte)(packedChar >> 16));		baseOrder[2] = (char) ((byte)(packedChar >> 8));		baseOrder[3] = (char) ((byte)(packedChar));
				// get data records for traces		TaggedRecord[] Trace = new TaggedRecord[4];		traceLength = 1000000;		int dataNum;		for (i=0;i<4;i++) {			dataNum = 9 + i;			Trace[i] = (TaggedRecord) (rHash.get("DATA" + dataNum));			if (Trace[i].getElementNumber() < traceLength)				traceLength = Trace[i].getElementNumber();		}		// using FWO record data as guide, input Trace data		A = new int[traceLength];		C = new int[traceLength];		G = new int[traceLength];		T = new int[traceLength];
				for (i=0;i<4;i++) {			byteIN.reset();						byteIN.skip(Trace[i].getDataRecord());									switch (baseOrder[i]) {				case 'A':				readUSArray(A,byteIN);				break;				case 'C':				readUSArray(C,byteIN);				break;				case 'G':				readUSArray(G,byteIN);				break;				case 'T':				readUSArray(T,byteIN);				break;			}		}			}
	
	
	public void read(InputStream IN, int available)  throws IOException{
		DataInputStream dataIN = new DataInputStream(IN);
		byte[] fileHeader = new byte[30];
		dataIN.readFully(fileHeader);
		ByteArrayInputStream hIN = new ByteArrayInputStream(fileHeader);
		DataInputStream headerIN = new DataInputStream(hIN);
		headerIN.skip(18);
		int recordNum = headerIN.readInt();
		//headerIN.skip(4);
		int itemBytes = headerIN.readInt();
		int recordOffset = headerIN.readInt();
		headerIN.reset();
		byte[] fileBytes = new byte[available];
		// read from file to fill fileBytes
		headerIN.readFully(fileBytes,0,30);
		dataIN.readFully(fileBytes,30,fileBytes.length - 30);
		ByteArrayInputStream plainbyteIN = new ByteArrayInputStream(fileBytes);
		DataInputStream byteIN = new DataInputStream(plainbyteIN);
		byteIN.skip(recordOffset);
		// starts from recordOffset: directory
		// read tagged records into hash table
		TaggedRecord[] records = new TaggedRecord[recordNum];
		Hashtable rHash = new Hashtable(recordNum);
		int i;
		for (i=0;i<recordNum;i++) {
			records[i] = new TaggedRecord(byteIN);
			rHash.put(records[i].getTagName() + records[i].getTagNum(),records[i]);
			}
		// get base calls
		TaggedRecord PBAS1 = (TaggedRecord) (rHash.get("PBAS1"));
		int Offset = PBAS1.getDataRecord();
		int elementNum = PBAS1.getElementNumber();
		byteIN.reset();
		byteIN.skip(Offset);
		base = new char[elementNum];
		for (i=0;i<elementNum;i++) {
			base[i] = (char) byteIN.readUnsignedByte();
		}
		baseSequence = new String(base);
		// get base locations
		TaggedRecord PLOC1 = (TaggedRecord) (rHash.get("PLOC1"));
		Offset = PLOC1.getDataRecord();
		elementNum = PLOC1.getElementNumber();
		byteIN.reset();
		byteIN.skip(Offset);
		basePosition = new int[elementNum];
		for (i=0;i<elementNum;i++) {
			basePosition[i] = (char) byteIN.readUnsignedShort();
		}
		// get FWO (tells which trace is which)
		TaggedRecord FWO1 = (TaggedRecord) (rHash.get("FWO_1"));
		int packedChar = FWO1.getDataRecord();
		char[] baseOrder = new char[4];
		baseOrder[0] = (char) ((byte)(packedChar >> 24));
		baseOrder[1] = (char) ((byte)(packedChar >> 16));
		baseOrder[2] = (char) ((byte)(packedChar >> 8));
		baseOrder[3] = (char) ((byte)(packedChar));		
		// get data records for traces
		TaggedRecord[] Trace = new TaggedRecord[4];
		traceLength = 1000000;
		int dataNum;
		for (i=0;i<4;i++) {
			dataNum = 9 + i;
			Trace[i] = (TaggedRecord) (rHash.get("DATA" + dataNum));
			if (Trace[i].getElementNumber() < traceLength)
				traceLength = Trace[i].getElementNumber();
		}
		// using FWO record data as guide, input Trace data
		A = new int[traceLength];
		C = new int[traceLength];
		G = new int[traceLength];
		T = new int[traceLength];		
		for (i=0;i<4;i++) {
			byteIN.reset();			
			byteIN.skip(Trace[i].getDataRecord());						
			switch (baseOrder[i]) {
				case 'A':
				readUSArray(A,byteIN);
				break;
				case 'C':
				readUSArray(C,byteIN);
				break;
				case 'G':
				readUSArray(G,byteIN);
				break;
				case 'T':
				readUSArray(T,byteIN);
				break;
			}
		}
		
	}
	
		private static void readUSArray(int[] intArray,DataInputStream IN) throws IOException {		int i;		for (i=0;i<intArray.length;i++) {			intArray[i] = IN.readUnsignedShort();		}	}	public void write(OutputStream OUT) {		// writing ABI files more trouble than its worth?		};			public int getATrace(int x) {		return A[x];	}		public int getCTrace(int x) {		return C[x];	}		public int getGTrace(int x) {		return G[x];	}		public int getTTrace(int x) {		return T[x];	}
			public int getTraceLength() {		return traceLength;	}		public int[] getATrace() {		return A;	}		public int[] getCTrace() {		return C;	}		public int[] getGTrace() {		return G;	}		public int[] getTTrace() {		return T;	}
			public char getBase(int x) {		return base[x];	}		public int getBasePosition(int x) {		return basePosition[x];	}		public String getSequence() {		return baseSequence;	}		public String getComments() {		// work on this later		return "";	}		public int getBaseNumber() {		return (int) base.length;	}}
