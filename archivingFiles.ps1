Param 
(
    [Parameter(Mandatory = $true, HelpMessage="Choose a folder!!")]
    [string]$sourceFolder,

    [Parameter(Mandatory = $true, HelpMessage="Add day!!")]
    [int]$fileDate,

    [Parameter(Mandatory = $true, HelpMessage="New folder destination!!")]
    [string]$destinationFolder
)

$files = Get-ChildItem -path $sourceFolder | Where-Object {((Get-Date)-$_.creationTime).days -gt $fileDate} 
$filesCount = $files.Length 
Write-Host "Found $filesCount files in source directory!!"

if (!(Test-Path -Path $destinationFolder)) 
{
   New-Item -Path $destinationFolder -ItemType Directory 
}

foreach ($object in $files)
{
    Move-Item -Path "$($object.FullName)" -Destination $destinationFolder
}

Write-Output "Done!!"