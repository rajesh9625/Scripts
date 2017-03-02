﻿Function Test-XMLFile {
    <#
    .SYNOPSIS
    Test the validity of an XML file
    #>
    [CmdletBinding()]
    param (
    [parameter(mandatory=$true)][ValidateNotNullorEmpty()][string]$xmlFilePath
    )

    # Check the file exists
    if (!(Test-Path -Path $xmlFilePath)){
    throw "$xmlFilePath is not valid. Please provide a valid path to the .xml fileh"
    }
    # Check for Load or Parse errors when loading the XML file
    $xml = New-Object System.Xml.XmlDocument
    try {
    $xml.Load((Get-ChildItem -Path $xmlFilePath).FullName)
    return $true
    }
    catch [System.Xml.XmlException] {
    Write-Host "$xmlFilePath : $($_.toString())"
    return $false
    }
    }