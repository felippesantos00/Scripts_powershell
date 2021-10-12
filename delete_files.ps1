#Definir os paths, quais pastas vão entrar e os arquivos que vão ser ignorados
$paths="C:\Users\Admin\Desktop\Projetos\scripts_powershell","C:\Users\Admin\Desktop\scripts_powershell - Copia"
$folders = Get-ChildItem $paths -exclude *.* | Resolve-Path #-include 
$files = Get-ChildItem $folders -exclude *.rar,*.xlsx | Resolve-Path

function verifyFiles{
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
