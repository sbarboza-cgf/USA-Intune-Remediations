#Detection script runs to determine if a US Print Server is available and user is not on VPN; if so, run remediation
#Version 1.0 - 8/2/2023 SBarboza@cgf.com

Start-Transcript -Path $(Join-Path $env:temp "PrinterMapDetect.log")


$printServer = "US1-PRINT1"

#Determine if workstation is connected via USAccess

if (get-netipaddress -IPAddress 10.40.59.*) 


    {write-host "on us1vpn; no remediation"
        exit 0}

#Determine if workstation is connected via US2Access

elseif (get-netipaddress -ipaddress 10.12.59.*)

    {write-host "on us2vpn; no remediation"
        exit 0}

elseif (get-netipaddress -ipaddress 10.0.0.*)

    {write-host "home IP; no remediation"
        exit 0}

elseif (get-netipaddress -ipaddress 192.168.*)

    {write-host "home IP; no remediation"
        exit 0}

#Make sure workstation has connectivity to print server

    (Test-Connection -cn $printServer -BufferSize 16 -Count 1 -ea 0 -quiet)
       {write-host "$printserver detected and workstation is not on vpn, map printers"
             exit 1}

Stop-Transcript