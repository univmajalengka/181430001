{**************************************************
Program Scanner ini akan menerima suatu Input
File Kode Sumber dalam Pascal.
Kemudian menghasilkan suatu File Text yang berisi
daftar Token-token yang terdapat dalam Program.
**************************************************}

Program Scanner2;

Uses Crt;

TYPE
	TokenType = ( tNone, 						{ tipe-tipe Token }
		tIdentifier,
		tInteger,
		tReal,
		tCharConstant,
		tString,
		tPlus,
		tMin,
		tMult,
		tDiv,
		tAssignment,
		tTitikDua,
		tRange,
		tKoma,
		tTitik,
		tTitikKoma,
		tEqual,
		tInequal,
		tLess,
		tLessEqu,
		tGreater,
		tGreaterEqu,
		tKurungSikuBuka,
		tKurungSikuTutup,
		tKurungBuka,
		tKurungTutup,
		tKeyAND,					{ Keyword }
		tKeyARRAY,
		tKeyBEGIN,
		tKeyCASE,
		tKeyCONST,
		tKeyDIV,
		tKeyDO,
		tKeyDOWNTO,
		tKeyELSE,
		tKeyEND,
		tKeyFILE,
		tKeyFOR,
		tKeyFUNCTION,
		tKeyGOTO,
		tKeyIF,
		tKeyIN,
		tKeyLABEL,
		tKeyMOD,
		tKeyNIL,
		tKeyNOT,
		tKeyOF,
		tKeyOR,
		tKeyPACKED,
		tKeyPROCEDURE,
		tKeyPROGRAM,
		tKeyRECORD,
		tKeyREPEAT,
		tKeySET,
		tKeyTHEN,
		tKeyTO,
		tKeyTYPE,
		tKeyUNTIL,
		tKeyVAR,
		tKeyWHILE,
		tKeyWITH
	);
	
	ScanErrorType = ( errNone,
		errScanUnexpChar,
		errScanFloat,
		errScanInt,
		errScanApostExp,
		errScanUnexpEOF
	);
	
	
CONST
	EndFile = #26;
	JmlKeyword = 40;
	Keyword : ARRAY [1..JmlKeyword] OF STRING[9] = (
		'AND',
		'ARRAY',
		'BEGIN',
		'BOOLEAN',
		'CASE',
		'CONST',
		'CHAR',
		'DIV',
		'DO',
		'DOWNTO',
		'ELSE',
		'END',
		'FILE',
		'FOR',
		'FUNCTION',
		'GOTO',
		'IF',
		'IN',
		'INTEGER',
		'LABEL',
		'MOD',
		'NIL',
		'NOT',
		'OF',
		'OR',
		'PACKED',
		'PROCEDURE',
		'PROGRAM',
		'REAL',
		'RECORD',
		'REPEAT',
		'SET',
		'STRING',
		'THEN',
		'TO',
		'TYPE',
		'UNTIL',
		'VAR',
		'WHILE',
		'WITH'
	);
	
	eMax = 38; {Exponen Maksimal}
	eMin = -38; {Exponen Minimal}
	JmlSigDgt = 5; {Jumlah Digit yang Signifikan}
	ValMax = 16383; {2**14 - 1}
	MaxInfo = 128;
	
	
VAR
	ScanStr : STRING;
	Token : TokenType;
	inum : LONGINT;
	rnum : REAL;
	CC : CHAR;
	
	{Nama FIle Program Sumber dan File Keterangan hasil Kompilasi}
	FileSource, FileRes : STRING;
	
	{File Program Sumber dan File Keterangan hasil Kompilasi}
	InFile, ResFile : TEXT;
	
	ErrCounter : Integer;
	LineCounter : Integer; {Baris yang sedang diproses}
	
	lokasi : ARRAY [1..MaxInfo] of STRING;
	jinfo : Integer;
	
	
	{***************PROSEDUR-PROSEDUR PENDUKUNG***************}
	
	FUNCTION OpenFile : BOOLEAN;
	{Fungsi Membuka File}
	VAR 
		i: INTEGER;
		Open1, Open2 : BOOLEAN;
	BEGIN
		WRITELN;
		WRITE('File will be Parse (.pas) : ');
		READLN(FileSource);
		i := POS('.',FileSource);
		IF i<>0 THEN FileSource := COPY(FileSource, 1, i-1);
		
		WRITE('Output File (.txt) : ');
		READLN(FileRes);
		WRITELN;
		i := POS('.', FileRes);
		IF i<>0 THEN FileRes := COPY(FileRes, 1, i-1);
		
		OpenFile := TRUE;
		
		{$I-}
		ASSIGN(InFIle, FileSource+'.pas');
		RESET(InFile);
		
		{$I+}
		IF IOResult<>0 THEN
		BEGIN
			WRITELN('File ', FileSource, '.pas Doesn''t exist...');
			OpenFile := FALSE;
		END
		ELSE
		BEGIN
			{$I-}
			ASSIGN(ResFile, FileRes+'.txt');
			REWRITE(ResFile);
			{$I+}
			IF IOResult<>0 THEN
			BEGIN
				WRITELN(FileRes, '.txt can''t be made...');
				OpenFile := FALSE;
			END
		END;
	END;
	
	FUNCTION UpperCase(Str : STRING): STRING;
	{ Fungsi untuk mengubah ke Huruf Kapital}
	VAR
		i : INTEGER;
	
	BEGIN
		FOR i := 1 TO LENGTH(Str) DO
			Str[i] := UpCase(Str[i]);
		UpperCase := Str;
	END;
	
	PROCEDURE IncLine(var LineCounter : Integer);
	{ Menampilkan nomor baris yang sedang diproses}
	BEGIN
		GOTOXY(1, WHEREY);
		LineCounter := LineCounter+1;
		WRITE('Processing Line : ', LineCounter);
	END;
	
	PROCEDURE ReadChar;
	{ Maju membaca satu karakter pada File Source}
	BEGIN
		READ(InFile, CC);
	END;
	
	PROCEDURE ProsErr(err : ScanErrorType);
	{ Prosedur penanganan kesalahan/error}
	BEGIN
		GotoXY(25,WHEREY);
		WRITE('*Error: ');
		CASE err OF errScanUnexpChar : BEGIN WRITE('Unexpected Character', CC);
			ReadChar;
			END;
			errScanApostExp : WRITE(#39, ' expected');
			errScanUnexpEOF : BEGIN WRITE('Unexpected End Of File');
				READLN;
				HALT;
			END;
			errScanFloat : WRITE('Floating Point Format Error');
			errScanInt : WRITE('Integer Value Error');
		END;
		READLN;
	END;
	
	PROCEDURE WriteFile;
	{ Penulisan Hasil Scanning ke File Keterangan}
	VAR
		i : INTEGER;
		adainfo : BOOLEAN;
	
	BEGIN
		WRITE(ResFile, '		');
		WRITE(ResFile, Ord(Token):2);
		WRITE(ResFile, '			');
		CASE Token OF
			tIdentifier:
			BEGIN
				adainfo := FALSE;
				i := 0;
				REPEAT
					i := i+1;
					IF lokasi[i] = ScanStr THEN adainfo := TRUE;
				UNTIL (adainfo) or (i>jinfo);
				IF (not adainfo) AND (jinfo<maxinfo) THEN
				BEGIN
					jinfo := jinfo+1;
					lokasi[jinfo] := ScanStr;
					WRITE(ResFile, jinfo:4);					
				END
				ELSE
					WRITE(ResFile, i:4);
				WRITE(Resfile, '	'+ScanStr);
			END;
			
			tInteger:
			BEGIN
				IF(jinfo<maxinfo) THEN
				BEGIN
					jinfo := jinfo+1;
					lokasi[jinfo] := ScanStr;
					WRITE(ResFile, jinfo:4);
				END;
				WRITE(ResFile, '		');
				WRITE(ResFile, inum);
			END;
			
			tReal:
			BEGIN
				IF(jinfo<maxinfo) THEN
				BEGIN
					jinfo := jinfo+1;
					lokasi[jinfo] := ScanStr;
					WRITE(ResFile, jinfo:4);
				END;
				WRITE(ResFile, '		');
				WRITE(ResFile, rnum);
			END;
			
			tCharConstant, tString :
			BEGIN
				IF(jinfo<maxinfo) THEN
					BEGIN
						jinfo := jinfo+1;
						lokasi[jinfo] := ScanStr;
						WRITE(ResFile, jinfo:4);
						WRITE(ResFile, '		');
						WRITE(ResFile, ScanStr);
					END;
				END;
				ELSE
				BEGIN
						WRITE(ResFile, 0:4);
						Write(ResFile, '		');
						WRITE(ResFile, ScanStr);
				END;
			END;
			WRITELN(ResFile, '');
		END;
	
	
	{ ********************PROSEDUR SCAN********************}
	
	PROCEDURE SCAN;
	CONST
		SPACE = #32;
		TAB = #9;
		CR = #13;
		LF = #10;
		
	VAR
		AdaToken : BOOLEAN;
		i,j,k,e : INTEGER;
		KeyToken : TokenType ABSOLUTE k;
		TampStr : STRING;
		Error : ScanErrorType;
		Ex, Comment : BOOLEAN;
		
		PROCEDURE GetExp;
		{ Prosedur yang memberikan Eksponen/ bilangan di belakang 'e'|'E' }
		VAR
			pangkat, sign : INTEGER;
		BEGIN
			sign := 1;
			pangkat := 0;
			
			ReadChar; { Get Char after E|e}
			IF CC IN ['+','-'] THEN
			BEGIN
				IF CC='-' THEN sign := -1;
				ReadChar;
			END;
			IF NOT (CC IN ['0'..'9']) THEN Error := errScanFloat
			ELSE { there is numeric char after E|e}
			BEGIN
				REPEAT
					pangkat := 10*pangkat+ORD(CC)-ORD('0');
					ReadChar;
				UNTIL NOT (CC IN ['0'..'9']);
				e := e+pangkat*sign; { Pangkat Desimal Total suatu bilangan Real}
			END;
		END;
		
		PROCEDURE KonverToReal;
		{ Prosedur untuk memperoleh Bilangan Real dalam Format Desimal Berkoma}
		VAR
			s : INTEGER;
			d,t : REAL;
		BEGIN
			IF k+e > eMax THEN Error := errScanFloat
			ELSE
				IF k+e < eMin THEN rnum := 0 { Bilangan terlalu kecil, jadikan nol(0) }
				ELSE
				BEGIN
					s := abs(e);
					t := 1.0;
					d := 10.0;
					REPEAT
						WHILE NOT ODD(s) DO
						BEGIN
							s := s DIV 2;
							d := sqr(d);
						END;
					UNTIL s=0;
					IF e >= 0 THEN rnum := rnum*t
					ELSE rnum := rnum/t;
				END;
		END;
		

BEGIN { Scan}
	AdaToken := FALSE;
	WHILE (Not AdaToken) DO
	BEGIN
		Error := errNone;
		Comment := FALSE;
		Token := tNone;
		WHILE CC IN [CR, LF, TAB, SPACE] DO
		BEGIN
			IF CC=LF THEN IncLine(LineCounter);
			ReadChar; { Skip Whitespace}
		END;
		
		{ CC Not in Whitespace}
		IF CC=EndFile THEN EXIT; { Ketemu EOF}
		
		{ CC Bukan EOF}
		CASE CC OF
			'a'..'z', 'A'..'Z': { Identifier}
			BEGIN
				ScanStr := '';
				REPEAT
					ScanStr := ScanStr+CC;
					ReadChar;
				UNTIL NOT (CC IN ['a'..'z', 'A'..'Z', '0'..'9', '_']);
				
				{ Test Keyword}
				TampStr := UpperCase(ScanStr);
				i := 1;
				j := JmlKeyword; { Index untuk pencarian keyword dalam tabel}
				
				REPEAT
					k := (i+j) DIV 2;
					IF TampStr <= Keyword[k] THEN j:= k-1;
					IF TampStr >= Keyword[k] THEN i := k+1;
				UNTIL i>j;
				
				IF i-j > 1 THEN
				BEGIN
					k := k+ORD(tKurungSikuTutup);
					Token := KeyToken;
				END
				ELSE
				BEGIN
					Token := tIdentifier;
					ScanStr := COPY(ScanStr, 1, 10);
				END; 
			END; { end Identofier}
			
			'0'..'9': { Konstanta Numerik}
			BEGIN
				k := 0;
				inum := 0;
				Token := tInteger;
				REPEAT
					inum := inum*10 + ORD(CC) - ORD('0');
					k := k+1;
					ReadChar;
				UNTIL NOT (CC IN ['0'..'9']);
				
				{ Uji Error Numerik}
				IF (k>JmlSigDgt) OR (inum>ValMax) THEN { Bilangan Melebihi Batas}
				BEGIN
					Error := errScanInt;
					k := 0;
					inum := 0;
				END;
				
				IF CC='.' THEN { Real atau Range}
				BEGIN
					ReadChar;
					IF CC='.' THEN { Range}
					BEGIN
						ScanStr := '..'; { CC := ';';}
					END
					ELSE { Real}
					BEGIN
						IF NOT (CC IN ['0'..'9']) THEN { Setelah Bukan Angka}
						BEGIN
							Error := errScanFloat;
							IF CC IN ['e', 'E'] THEN GetExp;
						END
						ELSE
						BEGIN
							Token := tReal;
							rnum := inum;
							e := 0;
							REPEAT
								e := e-1; { Untuk menentukan posisi titik bilangan Real}
								rnum := rnum*10 + ORD(CC) - ORD('0');
								ReadChar;
							UNTIL NOT (CC IN['0'..'9']);
							IF CC IN ['e', 'E'] THEN GetExp;
							IF (Error<>errScanFloat) AND (e<>0) THEN
								KonverToReal;
						END;
					END; { Real}
				END
				ELSE { CC <> '.'}
					IF CC IN ['e','E'] THEN { Untuk benuk seperti 1E+2}
					BEGIN
						Token := tReal;
						rnum := inum;
						e := 0;
						GetExp;
						IF ((Error<>errScanFloat) AND (e<>0)) THEN
							KonverToReal;
					END;
			END; { End Konstanta Numerik}
			
			'{': { komentar1 atau Kurung Buka}
			BEGIN
				ScanStr := CC;
				ReadChar;
				IF CC <> '*' THEN Token := tKurungBuka
				ELSE { '{*', komentar, harus dibuang }
					BEGIN
						Comment := TRUE;
						ReadChar;
						IF CC <> EndFile THEN
						BEGIN
							REPEAT
								WHILE NOT (CC IN ['*', EndFile]) DO
									BEGIN
										IF CC = LF THEN IncLine(LineCounter);
										ReadChar; { Skip}
									END;
								{ CC='*' atau CC=EOF}
								IF CC = '*' THEN ReadChar;
								IF CC = LF THEN IncLine(LineCounter);
							UNTIL CC IN [')', EndFile];
							
							IF CC = ')' THEN ReadChar
							ELSE
								Error := errScanUnexpEOF;
						END;
						ELSE
							Error := errScanUnexpEOF;
					END;
			END; { End Komentar1}
			
			'{':    {Komentar2}
			BEGIN
				Comment := TRUE;
				REPEAT
					ReadChar;
					IF CC=LF THEN IncLine(LineCounter);
				UNTIL CC IN ['}', EndFile];
				IF CC='}' THEN ReadChar ELSE Error := errScanUnexpEOF;
			END; { Komentar2}
			
			'''': { String Literal atau konstanta karakter}
			BEGIN
				ScanStr := '';
				Ex := FALSE;
				WHILE NOT Ex DO
				BEGIN
					REPEAT
						ScanStr := ScanStr+CC;
						ReadChar;
					UNTIL (CC IN ['''', LF, EndFile]);
					
					IF CCIN [LF, EndFile] THEN
					BEGIN
						Ex := TRUE;
						IF CC = LF THEN
						BEGIN
							IncLine(LineCounter);
							Error := errScanApostExp;
						END
						ELSE { '}
						BEGIN
							ScanStr := ScanStr+CC;
							ReadChar;
							IF CC <> '''' THEN
								Ex := TRUE;
						END;
					END;
					IF NOT(ErrorIN [errScanApostExp, errScanUnexpEOF]) THEN
						BEGIN { Konstanta string atau karakter }
							DELETE(ScanStr, LENGTH(ScanStr),1);
							DELETE (ScanStr, 1, 1);
							IF LENGTH(ScanStr) > 1 THEN Token :=tSring;
							ELSE
							BEGIN
								inum := ORD(ScanStr[1]);
								Token := tCharConstant;
							END;
						END;
				END; 
			END; { Sring literal atau konstanta karakter}
			
			':'; { Titik Dua}
			BEGIN
				ScanStr := CC;
				ReadChar;
				IF CC = '=' THEN { Assignment}
				BEGIN
					Token := tAssignment;
					ScanStr := ScanStr + CC;
					ReadChar;
				END
				ELSE
					IF ScanStr='..' THEN Token := tRange;
					ELSE
						Token := tTitikDua;
			END; { Titik Dua}
			
			'<': { Lebih kecil, kecil sama, Tidak Sama}
			BEGIN
				ScanStr := CC;
				ReadChar;
				IF CC = '=' THEN
				BEGIN
					Token := tLessEqu;
					ScanStr := ScanStr + CC;
					ReadChar;
				END
				ELSE
					IF CC = '>' THEN
					BEGIN
						Token := tInequal;
						ScanStr := ScanStr + CC;
					END
					ELSE
						Token := tLess;
			END; { Lebih kecil, kecil sama, tidak sama}
			
			'>': { Lebih besar, Besar sama}
			BEGIN
				ScanStr := CC;
				ReadChar;
				IF CC = '=' THEN
				BEGIN
					Token := tGreaterEqu;
					ScanStr := ScanStr + CC;
					ReadChar;
				END
				ELSE
					Token := tGreater;
			END; { Lebih Besar,Besar Sama}
			
			'.': { Titik atau Range}
			BEGIN
				ReadChar:
				IF ScanStr = '..' THEN
					Token := tRange
				ELSE
				BEGIN
					Token := tTitik;
					ScanStr := '.';
				END;
			END; { titik dua atau Range}
			
			'+', '-', '*', '/', ',', ';', '=', ')', '[', ']':
			BEGIN
				ScanStr := CC;
				CASE CC Of
					'+': Token := tPlus;
					'-': Token := tMin;
					'*': Token := tMult;
					'/': Token := tDiv;
					',': Token := tKoma;
					':': Token := tTitikKoma;
					'=': Token := tEqual;
					')': Token := tKurungTutup;
					'[': Token := tKurungSikuBuka;
					']': Token := tKurungSikuTutup;
				END;
				ReadChar;
			END;
			ELSE
				Error :=errScanUnexpChar;
		END; { End Case}
		
		IF(((NOT Comment) AND (Error<>errScanUnexpChar)) OR (CC=EndFile)) THEN
			AdaToken := TRUE;
		IF Error <> errNone THEN
			ProsErr(Error);
	END; { End While}
END; { End Scan}


{*************************PROGRAM UTAMA*************************}
BEGIN
	IF OpenFile THEN
		BEGIN
			ReadChar;
			jinfo := 0;
			WRITELN(ResFile,'Internal Number Lokasi Token');
			WRITELN(ResFile,'-----------------');
			WHILE (CC <> EndFile) DO
			BEGIN
				SCAN;
				WriteFile;
			END;
		END;
		
	Close(ResFile);
END.