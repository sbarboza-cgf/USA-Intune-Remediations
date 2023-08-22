#---Detection Script for IEG Custom Settings---#
#---SBarboza 8/16/2023---#


Start-Transcript -Path $("c:\scripts\IEGITPConfig-Detect.log")

try {
	if(-NOT (Test-Path -LiteralPath "HKLM:\SOFTWARE\WOW6432Node\royalblue technologies\Fidessa\Default\Configuration")){ return $false };
	if((Get-ItemPropertyValue -LiteralPath 'HKLM:\SOFTWARE\WOW6432Node\royalblue technologies\Fidessa\Default\Configuration' -Name 'DesktopApiPort' -ea SilentlyContinue) -eq 80) {  } else { return $false };
	if((Get-ItemPropertyValue -LiteralPath 'HKLM:\SOFTWARE\WOW6432Node\royalblue technologies\Fidessa\Default\Configuration' -Name 'DesktopApiPath' -ea SilentlyContinue) -eq '/ITP/') {   } else { return $false };
}
catch { write-host "Key not found, remediate"
        exit 1 }
write-host "Keys found, do not remediate"
exit 0

Stop-Transcript
