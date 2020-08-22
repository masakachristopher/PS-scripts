
$dir = "c:\Boots"

   if((get-process "Syswin" -ea SilentlyContinue) -eq $Null -or ![System.IO.File]::Exists($dir)) 
  
       { 
         try 
          {
         Stop-Process -processname "Syswin" -force -ErrorAction SilentlyContinue
         Remove-Item $Boots -Recurse -force -ErrorAction SilentlyContinue

	//save the computername into the log
         hostname > $env:userprofile\SyswinReport\SyswinFoundCleaned.log
         Exit
          }
         Catch
          {
	//save the computername into the log
         hostname > $env:userprofile\SyswinReport\FailedtoRemove.log
          Exit
          }
        }
         
  else {
         Exit
       }

          