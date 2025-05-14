# Crossbow_Chimera_v3 - Advanced Malicious PDF Payload

**PoC ID:** CBW-2025-CHIMERA-V3  
**Alias:** Chimera_v3  
**Author:** Crossbow Labs (ritunderitu)  
**Created:** 2025-05-14  
**Status:** Lab-Validated  
**Target Surface:** WhatsApp for Android (2024.24.x–2025.x builds)  
**Delivery Method:** Auto-download stealth PDF  
**Filename:** `M-Pesa_Salary_Inventory_2025_Q1.pdf`  
**Password:** `22166347`

---

## Summary

`Chimera_v3` is a stealth-engineered malicious PDF document that simulates an advanced persistent threat (APT)-level vector. It blends multiple corruption and evasion techniques into a single payload under the guise of an HR salary report.

This PoC is for sandbox-based testing **only** and is compliant with ethical red-team practices.

---

## Payload Features

- **Corrupted Embedded JPEGs:** Triggers inconsistencies in WhatsApp's media preview renderer.
- **Polyglot PDF+JPEG+ZIP:** Bypasses simple content sniffers and triggers alternate parsers.
- **Oversized XMP Metadata:** Confuses metadata parsers and leaks into heap.
- **Fake Signature Block:** Mimics digital signatures to appear authentic.
- **Obfuscated JavaScript Object:** Dormant by default but logs execution when rendered in vulnerable engines.
- **ZIP Disguise Footer:** Triggers alternate extractor logic in poorly configured apps.
- **Fake MIME Types:** Adjusted to suggest a benign HR document.
- **Audio Beacon Stub:** Hidden `.wav` shell triggers when extracted with misconfigured sandbox tools.
- **Stealth Loader Comment:** Begins with `%PDF-1.7\n%âãÏÓ` to simulate legitimate header.

---

## Infection Flow (Simulated)

1. **User receives PDF via WhatsApp auto-download.**
2. **WhatsApp attempts preview rendering.**
3. **Corrupted JPEG stream overflows image parser.**
4. **If triggered inside older Android builds, memory corruption path opens.**
5. **Obfuscated JS prepares delayed logging payload in vulnerable viewers (non-WhatsApp).**
6. **ZIP footer misleads dual-format sniffers.**

---

## Evasion Techniques

| Technique              | Description                                          |
|------------------------|------------------------------------------------------|
| Metadata Overload      | Floods XMP and Info dictionaries with null padding. |
| Polyglot Embedding     | Combines JPEG and ZIP content inside PDF stream.    |
| Digital Signature Fake | Simulates Adobe-style signature footer.             |
| Sandbox Check          | Embedded JS checks fonts, screen ratio, CPU cores.  |
| Timestamp Deception    | Uses 2023–2025 blend to appear recently archived.   |

---

## Testing Environment

- **Device:** Oppo Reno Z / Redmi Note 13 (rooted)  
- **App:** WhatsApp for Android  
- **Sandbox:** Termux w/ `pdfinfo`, `pdfcpu`, `qpdf`, and custom debug tools  
- **OS:** Android 11 & 13 (air-gapped)  
- **Status:** No crashes but multiple parsing anomalies detected

---

## Notes

- This payload **does not exploit** users in production; it's for **scientific and ethical testing only**.
- Further variants (`v4`, `v5`) may include:
  - Live font object corruption
  - Multi-page renderer abuse
  - Time-based JavaScript triggers
  - Deep EXIF embedding in dummy PNG streams

---

## Hash (Chimera_v3.pdf)
- **SHA256:** `TO_BE_GENERATED_AFTER_FINAL_BUILD`

---

## Disclaimer

This PoC is for authorized red-team research and is not intended for use against real systems without full legal clearance. Crossbow upholds strict ethical standards.

---

## License

MIT License — For academic, research, and responsible disclosure purposes only.
