$days = 30
$now = Get-Date
$restriction = $now.AddDays(-$days)
$dir = "C:\`$Recycle.Bin"
//remove files
Get-ChildItem $dir -Recurse -Force | Where-Object { !$_.PSIsContainer -and $_.CreationTime -lt $restriction } | Remove-Item -Force
//remove empty folders
Get-ChildItem $dir -Recurse -Force | Where-Object { $_.PSIsContainer -and (Get-ChildItem -Path $_.FullName -Recurse -Force | Where-Object { !$_.PSIsContainer }) -eq $null } | Remove-Item -Force -Recurse
