Get-ChildItem -path C:\Users\User\Downloads -Recurse | 
Where lastwritetime -LT $(Get-Date).AddDays(-1) | 
Move-Item -Destination C:\Users\User\Desktop\folder