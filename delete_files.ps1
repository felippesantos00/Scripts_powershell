#Definir os paths, quais pastas v�o entrar e os arquivos que v�o ser ignorados
$paths="C:\Users\Admin\Desktop\Projetos\scripts_powershell","C:\Users\Admin\Desktop\scripts_powershell - Copia"
$folders = Get-ChildItem $paths -exclude *.* | Resolve-Path #-include 
$files = Get-ChildItem $folders -exclude *.rar,*.xlsx | Resolve-Path

function verifyFiles{
<<<<<<< HEAD:delete_files.ps1
=======
	#echo $files.name
	#echo $folder
>>>>>>> 170332d160e9c800620f860c24371a09af926951:script.ps1
	$verifyResults = New-Object System.Collections.Generic.List[System.Object]
	foreach ($file in $files){		
		if(Test-Path -Path $files){
			$verifyResults.Add($file)
		}
	}
	return $verifyResults
}

function deleteFiles{
	$deleteResults = New-Object System.Collections.Generic.List[System.Object]
	foreach ($file in $files){		
	    Remove-Item -Path $file
		$deleteResults.Add($file)
	}
	return $deleteResults
}

if($args[0] -eq 'verifyFiles'){
    verifyFiles
}
if($args[0] -eq 'deleteFiles'){
    deleteFiles
}
