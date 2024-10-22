#Map USA Network Printers
#Version 1.0 sbarboza@cgf.com 8/2/2023
#Version 1.0.1 sbarboza@cgf.com 2/13/2024 - added new name for BOS printer "BankingHuddle"
#Version 1.0.3 sbarboza@cgf.com 10/22/2024 - updated SF shares, removed MIA shares

Start-Transcript -Path $(Join-Path $env:temp "PrinterMapping.log")

write-host "Current Mapped Printers"
get-printer | fl name

#Remove printers that are mapped without FQDN or via an old server
write-host "Removing network printers so they can be re-mapped..."

get-printer | where {$_.name -like '*us1-print1\' -or $_.name -like '*sf-fs1\' -or $_.name -like '*nsh-print1*' -or $_.name -like '*bos-print1*'} | remove-printer

write-host "Verifying removal of old printers:"

get-printer | fl name

## Define shared printer names on US Print Servers
########################################################


$printers = @()
$printers += [pscustomobject]@{PrinterName="nsh_research_1_b&w";PrintServer="\\nsh-print1.canaccord.com\nsh_research_1_b&w";ADGroup="SG-US-Printer-NSH-Research";Default="0"}
$printers += [pscustomobject]@{PrinterName="nsh_research_1_color";PrintServer="\\nsh-print1.canaccord.com\nsh_research_1_color";ADGroup="SG-US-Printer-NSH-Research";Default="0"}
$printers += [pscustomobject]@{PrinterName="nsh_banking_1_b&w";PrintServer="\\us1-print1.canaccord.com\nsh_banking_1_b&w";ADGroup="SG-US-Printer-NSH-Banking";Default="0"}
$printers += [pscustomobject]@{PrinterName="nsh_banking_1_color";PrintServer="\\us1-print1.canaccord.com\nsh_banking_1_color";ADGroup="SG-US-Printer-NSH-Banking";Default="0"}
$printers += [pscustomobject]@{PrinterName="cha_banking_1_bw";PrintServer="\\us1-print1.canaccord.com\cha_banking_1_bw";ADGroup="SG-US-Printer-CHA-Banking";Default="0"}
$printers += [pscustomobject]@{PrinterName="cha_banking_1_color";PrintServer="\\us1-print1.canaccord.com\cha_banking_1_color";ADGroup="SG-US-Printer-CHA-Banking";Default="0"}
$printers += [pscustomobject]@{PrinterName="mn_equities";PrintServer="\\us1-print1.canaccord.com\mn_equities";ADGroup="SG-US-Printer-MN-Equities";Default="0"}
$printers += [pscustomobject]@{PrinterName="ny888_bullpen_1";PrintServer="\\us1-print1.canaccord.com\ny888_bullpen_1";ADGroup="SG-US-Printer-NY888-Bullpen";Default="0"}
$printers += [pscustomobject]@{PrinterName="ny888_bullpen_2";PrintServer="\\us1-print1.canaccord.com\ny888_bullpen_2";ADGroup="SG-US-Printer-NY888-Bullpen";Default="0"}
$printers += [pscustomobject]@{PrinterName="ny888_prod_1";PrintServer="\\us1-print1.canaccord.com\ny888_prod_1";ADGroup="SG-US-Printer-NY888-Prod";Default="0"}
$printers += [pscustomobject]@{PrinterName="ny888_prod_2";PrintServer="\\us1-print1.canaccord.com\ny888_prod_2";ADGroup="SG-US-Printer-NY888-Prod";Default="0"}
$printers += [pscustomobject]@{PrinterName="nydt_canon_1";PrintServer="\\us1-print1.canaccord.com\nydt_canon_1";ADGroup="SG-US-Printer-NYDT-Banking";Default="0"}
$printers += [pscustomobject]@{PrinterName="nydt_canon_2";PrintServer="\\us1-print1.canaccord.com\nydt_canon_2";ADGroup="SG-US-Printer-NYDT-Banking";Default="0"}
$printers += [pscustomobject]@{PrinterName="ny535_it_1";PrintServer="\\us1-print1.canaccord.com\ny535_it_1";ADGroup="SG-US-Printer-NY535-IT";Default="0"}
$printers += [pscustomobject]@{PrinterName="ny535_banking_1_b&w";PrintServer="\\us1-print1.canaccord.com\ny535_banking_1_b&w";ADGroup="SG-US-Printer-NY535-Banking";Default="0"}
$printers += [pscustomobject]@{PrinterName="ny535_banking_1_color";PrintServer="\\us1-print1.canaccord.com\ny535_banking_1_color";ADGroup="SG-US-Printer-NY535-Banking";Default="0"}
$printers += [pscustomobject]@{PrinterName="ny535_banking_2_b&w";PrintServer="\\us1-print1.canaccord.com\ny535_banking_2_b&w";ADGroup="SG-US-Printer-NY535-Banking";Default="0"}
$printers += [pscustomobject]@{PrinterName="ny535_banking_2_color";PrintServer="\\us1-print1.canaccord.com\ny535_banking_2_color";ADGroup="SG-US-Printer-NY535-Banking";Default="0"}
$printers += [pscustomobject]@{PrinterName="ny535_finance_1_b&w";PrintServer="\\us1-print1.canaccord.com\ny535_finance_1_b&w";ADGroup="SG-US-Printer-NY535-Finance";Default="0"}
$printers += [pscustomobject]@{PrinterName="ny535_finance_1_color";PrintServer="\\us1-print1.canaccord.com\ny535_finance_1_color";ADGroup="SG-US-Printer-NY535-Finance";Default="0"}
$printers += [pscustomobject]@{PrinterName="ny535_research_1_b&w";PrintServer="\\us1-print1.canaccord.com\ny535_research_1_b&w";ADGroup="SG-US-Printer-NY535-Research";Default="0"}
$printers += [pscustomobject]@{PrinterName="ny535_research_1_color";PrintServer="\\us1-print1.canaccord.com\ny535_research_1_color";ADGroup="SG-US-Printer-NY535-Research";Default="0"}
$printers += [pscustomobject]@{PrinterName="ny535_trading_1_b&w";PrintServer="\\us1-print1.canaccord.com\ny535_trading_1_b&w";ADGroup="SG-US-Printer-NY535-Trading";Default="0"}
$printers += [pscustomobject]@{PrinterName="ny535_trading_1_color";PrintServer="\\us1-print1.canaccord.com\ny535_trading_1_color";ADGroup="SG-US-Printer-NY535-Trading";Default="0"}
$printers += [pscustomobject]@{PrinterName="ny535_trading_2_b&w";PrintServer="\\us1-print1.canaccord.com\ny535_trading_2_b&w";ADGroup="SG-US-Printer-NY535-Trading";Default="0"}
$printers += [pscustomobject]@{PrinterName="ny535_trading_2_color";PrintServer="\\us1-print1.canaccord.com\ny535_trading_2_color";ADGroup="SG-US-Printer-NY535-Trading";Default="0"}
$printers += [pscustomobject]@{PrinterName="bos_banking_1_b&w";PrintServer="\\us1-print1.canaccord.com\bos_banking_1_b&w";ADGroup="SG-US-Printer-BOS-Banking";Default="0"}
$printers += [pscustomobject]@{PrinterName="bos_banking_1_color";PrintServer="\\us1-print1.canaccord.com\bos_banking_1_color";ADGroup="SG-US-Printer-BOS-Banking";Default="0"}
$printers += [pscustomobject]@{PrinterName="bos_banking_2_b&w";PrintServer="\\us1-print1.canaccord.com\bos_banking_2_b&w";ADGroup="SG-US-Printer-BOS-Banking";Default="0"}
$printers += [pscustomobject]@{PrinterName="bos_banking_2_color";PrintServer="\\us1-print1.canaccord.com\bos_banking_2_color";ADGroup="SG-US-Printer-BOS-Banking";Default="0"}
$printers += [pscustomobject]@{PrinterName="bos_bankinghuddle_1_b&w";PrintServer="\\us1-print1.canaccord.com\bos_bankinghuddle_1_b&w";ADGroup="SG-US-Printer-BOS-Banking";Default="0"}
$printers += [pscustomobject]@{PrinterName="bos_bankinghuddle_1_color";PrintServer="\\us1-print1.canaccord.com\bos_bankinghuddle_1_color";ADGroup="SG-US-Printer-BOS-Banking";Default="0"}
$printers += [pscustomobject]@{PrinterName="bos_compliance_1_b&w";PrintServer="\\us1-print1.canaccord.com\bos_compliance_1_b&w";ADGroup="SG-US-Printer-BOS-Compliance";Default="0"}
$printers += [pscustomobject]@{PrinterName="bos_compliance_1_color";PrintServer="\\us1-print1.canaccord.com\bos_compliance_1_color";ADGroup="SG-US-Printer-BOS-Compliance";Default="0"}
$printers += [pscustomobject]@{PrinterName="bos_equities_1_b&w";PrintServer="\\us1-print1.canaccord.com\bos_equities_1_b&w";ADGroup="SG-US-Printer-BOS-Equities";Default="0"}
$printers += [pscustomobject]@{PrinterName="bos_equities_1_color";PrintServer="\\us1-print1.canaccord.com\bos_equities_1_color";ADGroup="SG-US-Printer-BOS-Equities";Default="0"}
$printers += [pscustomobject]@{PrinterName="bos_research_1_b&w";PrintServer="\\us1-print1.canaccord.com\bos_research_1_b&w";ADGroup="SG-US-Printer-BOS-Research";Default="0"}
$printers += [pscustomobject]@{PrinterName="bos_research_1_color";PrintServer="\\us1-print1.canaccord.com\bos_research_1_color";ADGroup="SG-US-Printer-BOS-Research";Default="0"}
$printers += [pscustomobject]@{PrinterName="sf_banking_marketing";PrintServer="\\us1-print1.canaccord.com\sf_banking_marketing";ADGroup="SG-US-Printer-SF-Marketing";Default="0"}
$printers += [pscustomobject]@{PrinterName="SF_banking_Color";PrintServer="\\us1-print1.canaccord.com\sf_banking_color";ADGroup="SG-US-Printer-SF-Banking";Default="0"}
$printers += [pscustomobject]@{PrinterName="SF_banking_B&W";PrintServer="\\us1-print1.canaccord.com\sf_banking_b&w";ADGroup="SG-US-Printer-SF-Banking";Default="0"}
$printers += [pscustomobject]@{PrinterName="SF_equities_B&W";PrintServer="\\us1-print1.canaccord.com\sf_equities_b&w";ADGroup="SG-US-Printer-SF-Equities";Default="0"}
$printers += [pscustomobject]@{PrinterName="SF_equities_Color";PrintServer="\\us1-print1.canaccord.com\sf_equities_color";ADGroup="SG-US-Printer-SF-Equities";Default="0"}




$searchRoot = "canaccord.com"


#Determine AD Group Membership


function Get-ADGroupMembership {
	param(
		[parameter(Mandatory = $true)]
		[string]$UserPrincipalName
	)

	process {

		try {

			if ([string]::IsNullOrEmpty($env:USERDNSDOMAIN) -and [string]::IsNullOrEmpty($searchRoot)) {
				Write-Error "Security group filtering won't work because `$env:USERDNSDOMAIN is not available!"
				Write-Warning "You can override your AD Domain in the `$overrideUserDnsDomain variable"
			}
			else {

				# if no domain specified fallback to PowerShell environment variable
				if ([string]::IsNullOrEmpty($searchRoot)) {
					$searchRoot = $env:USERDNSDOMAIN
				}

				$searcher = New-Object -TypeName System.DirectoryServices.DirectorySearcher
				$searcher.Filter = "(&(userprincipalname=$UserPrincipalName))"
				$searcher.SearchRoot = "LDAP://$searchRoot"
				$distinguishedName = $searcher.FindOne().Properties.distinguishedname
				$searcher.Filter = "(member:1.2.840.113556.1.4.1941:=$distinguishedName)"

				[void]$searcher.PropertiesToLoad.Add("name")

				$list = [System.Collections.Generic.List[String]]@()

				$results = $searcher.FindAll()

				foreach ($result in $results) {
					$resultItem = $result.Properties
					[void]$List.add($resultItem.name)
				}

				$list
			}
		}
		catch {
			#nothing can be done
			Write-Warning $_.Exception.Message
		}
	}
}

#check if running as system
function Test-RunningAsSystem {
	[CmdletBinding()]
	param()
	process {
		return [bool]($(whoami -user) -match "S-1-5-18")
	}
}

#Get current group membership to filter

Write-Output "Running as SYSTEM: $(Test-RunningAsSystem)"
try {
	#check if running as user and not system
	if (-not (Test-RunningAsSystem)) {

		$groupMemberships = Get-ADGroupMembership -UserPrincipalName $(whoami -upn)
	} else {
		# No remediation required as executed as System
		
	}
}
catch {
	#nothing we can do
}


#Map Printers


# Add printer only when executed as user
if (-not (Test-RunningAsSystem)) {
    $PrintersForUser = @()
    foreach ($printer in $Printers) { 
        if($printer.ADGroup -ne $null -and $printer.ADGroup.Contains(",")) { 
            $Agroups = $printer.ADGroup.Split(",") 
            foreach ($Agroup in $Agroups) { 
                if ($groupMemberships -contains $Agroup) {  
                    $PrintersForUser += $printer
                    break 
                } 
            } 
        } else { 
            if ($groupMemberships -contains $printer.ADGroup -or [String]::IsNullOrWhiteSpace($printer.ADGroup)) { 
                $PrintersForUser += $printer
            } 
        }
    } 
    Write-Output "Found the following printers to map:"
	Write-Output $PrintersForUser
    
	Foreach ($Printer in $PrintersForUser){
		Try {
			Write-Output "Get the status of the printer '$($Printer.PrintServer)' on the print server"
			$PrinterServerStatus = (Get-Printer -ComputerName (([URI]($Printer.PrintServer)).host) -Name $Printer.PrinterName).PrinterStatus
			# Only perform check if the printer on the print server is not offline
			If ($PrinterServerStatus -ne "Offline") {
				# Throw error is printer doesn't exist
				#If (!(Get-Printer -Name $Printer.PrintServer -ErrorAction SilentlyContinue)){
				#	Write-Output "Printer not mapped, adding '$($Printer.PrintServer)'"
					Add-Printer -ConnectionName $Printer.PrintServer
					if($Printer.Default -eq 1){
						$printer = Get-CimInstance -Class Win32_Printer -Filter "Name='$($Printer.PrinterServer)'"
						Invoke-CimMethod -InputObject $printer -MethodName SetDefaultPrinter
					}
				}
			#} 
                else {
				Write-Output "Printer is offline or Spooler not running"
				$Printer
			}
		} Catch {
			Write-Output "Failed to map the printer"
			$Printer
			$_
		}
			
	}
    
}
#end 

Stop-transcript
Exit 0
