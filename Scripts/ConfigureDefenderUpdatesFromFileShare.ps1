<#  
    .SYNOPSIS  
        Updating Defender signatures from a FileShare

    .DESCRIPTION
        Configuring Defender updates from a file share
               
    .LINK  
        http://theitbros.com/managing-windows-defender-using-powershell/
#>





$source1 = "http://go.microsoft.com/fwlink/?LinkId=211054"
$destination1 = "C:\Users\rayarlag\Desktop\share\x64\mpam-d.exe"


$source2 = "http://go.microsoft.com/fwlink/?LinkID=121721&arch=x64"
$destination2 = "C:\Users\rayarlag\Desktop\share\x64\mpam-fe.exe"

$source3 = "http://go.microsoft.com/fwlink/?LinkId=197094"
$destination3 = "C:\Users\rayarlag\Desktop\share\x64\nis_full.exe"
 
Invoke-WebRequest $source1 -OutFile $destination1
Invoke-WebRequest $source2 -OutFile $destination2
Invoke-WebRequest $source3 -OutFile $destination3