Function Test-JSONFile {
    <#
    .SYNOPSIS
    Test the validity of an JSON file
    #>
    
    [CmdletBinding()]
    param (
    [parameter(mandatory=$true)][ValidateNotNull()][string]$JsonFilePath
    )

    # Check the file exists
    if (!(Test-Path -Path $JsonFilePath)) {
    throw "$JsonFilePath is not valid. Please provide a valid path to the .json file"
    }
    
    # Checking for Load or Parse errors when loading the JSON file
    try {
    $text = Get-Content $JsonFilePath -Raw 
    $JSONRepresentation = ConvertFrom-Json $text -ErrorAction Stop;
    return $true
    }
    
    catch {
    Write-Error $error[0]
    return $false 
    }
}