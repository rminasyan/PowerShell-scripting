Param 
(
    [Parameter(Mandatory = $true, HelpMessage="Choose a folder!!")]
    [string]$sourceFolder,

    [Parameter(Mandatory = $true, HelpMessage="Add day!!")]
    [int]$adddays,

    [Parameter(Mandatory = $true, HelpMessage="New folder destination!!")]
    [string]$destinationfolder
)

$files = Get-ChildItem -path $sourceFolder | Where-Object {((Get-Date)-$_.creationTime).days -gt $adddays} 
$filesCount = $files.Length 
Write-Host "Found $filesCount files in source directory!!"

New-Item -Path $destinationfolder -ItemType Directory

Write-Output "Done!!"