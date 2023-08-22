#----Remediate Misisng Reg Keys---#
#SBarboza 8-16-2023


if((Test-Path -LiteralPath "HKLM:\SOFTWARE\WOW6432Node\royalblue technologies\Fidessa\Default\Configuration") -ne $true) {  New-Item "HKLM:\SOFTWARE\WOW6432Node\royalblue technologies\Fidessa\Default\Configuration" -force -ea SilentlyContinue };
New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\WOW6432Node\royalblue technologies\Fidessa\Default\Configuration' -Name 'DesktopApiPort' -Value 80 -PropertyType DWord -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\WOW6432Node\royalblue technologies\Fidessa\Default\Configuration' -Name 'DesktopApiPath' -Value '/ITP/' -PropertyType String -Force -ea SilentlyContinue;

#---Add URL to ACL Reservations---#

try {

	if(-NOT (Test-Path -LiteralPath "HKLM:\SYSTEM\CurrentControlSet\Services\HTTP\Parameters\UrlAclInfo")){ return $false };


	if((Get-ItemPropertyValue -LiteralPath 'HKLM:\SYSTEM\CurrentControlSet\Services\HTTP\Parameters\UrlAclInfo' -Name 'http://localhost:80/ITP/' -ea SilentlyContinue) -join ',' -eq (([byte[]](0x01,0x00,0x04,0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x14,0x00,0x00,0x00,0x02,0x00,0x1c,0x00,0x01,0x00,0x00,0x00,0x00,0x00,0x14,0x00,0x00,0x00,0x00,0x20,0x01,0x01,0x00,0x00,0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x00)) -join ',')) 

        { write-host "ITP URL Reservation in place"  } 
        
    else {};
}
catch { netsh http add urlacl url=http://localhost:80/ITP/ user=Everyone }
return $true