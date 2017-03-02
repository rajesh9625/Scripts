Function Test-XMLFile {
    <#
    .SYNOPSIS
    Test the validity of an XML file
    #>
    
    [CmdletBinding()]
    param (
    [parameter(mandatory=$true)][ValidateNotNull()][string]$XmlFilePath
    )

    # Check the file exists
    if (!(Test-Path -Path $XmlFilePath)) {
    throw "$XmlFilePath is not valid. Please provide a valid path to the .xml file"
    }
    
    # Checking for Load or Parse errors when loading the XML file
    $xml = New-Object System.Xml.XmlDocument
    try {
    $xml.Load((Get-ChildItem -Path $xmlFilePath).FullName)
    return $true
    }
    
    catch [System.Xml.XmlException] {
    Write-Error $_.Exception.Message
    return $false
    }
}