Param 
(
    [Parameter(Mandatory = $true, HelpMessage="This is a folder!!")]
    [string]$sourceFolder,

    [Parameter(Mandatory = $true, HelpMessage="Add day!!")]
    [int]$adddays,

    [Parameter(Mandatory = $true, HelpMessage="new folder destination!!")]
    [string]$newfolder
)
Get-ChildItem -path $sourceFolder |
Where-Object {((Get-Date)-$_.creationTime).days -gt $adddays} |
Move-Item -Destination $newfolder\Filesfolder