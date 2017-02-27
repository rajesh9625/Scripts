Function Configure-WSUS {
    <#  
    .SYNOPSIS  
        Sets the WSUS settings on AzureStack.

    .DESCRIPTION
        Sets the WSUS settings on AzureStack.
         
    .PARAMETER UpdateServer
        URL of the WSUS server. Must use Https:// or Http://
               
    .LINK  
        https://technet.microsoft.com/en-us/library/ee461034.aspx
        https://msdn.microsoft.com/en-us/library/dd939844(v=ws.10).aspx
        
    .EXAMPLE
    Configure-WSUS -UpdateServer "http://testwsus.com"

    Description
    -----------
    Configures the settings to enable automatic updates and use testwsus.com as the update server.
    #>
    [cmdletbinding()] 
    Param (
        [parameter(Position=0, Mandatory=$true)]
        [string]$UpdateServer                                           
    )
    Begin {
        write-host "Changing WSUS configuration..."
        $key = "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate"
        $val1 = "UseWUServer" 
        $val2 = "WUServer"
        $val3 = "WUStatusServer"
        $DisplayName = "Member Server Security Baseline"
        $Enabled = 1 
    }
    Process {
           try {
                Set-GPRegistryValue -Name $DisplayName -Key $key -ValueName $val1 -Type DWord -Value $Enabled
                Set-GPRegistryValue -Name $DisplayName -Key $key -ValueName $val2 -Type String -Value $UpdateServer
                Set-GPRegistryValue -Name $DisplayName -Key $key -ValueName $val3 -Type String -Value $UpdateServer
           }
           catch {
                   Write-Error $error[0]
                   return
           }
    }  
}