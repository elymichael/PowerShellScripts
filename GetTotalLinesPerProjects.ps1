# Set Project Main Repositories...
$path = "E:\ERC\Projects\DT20R3\";
# Get All folders.
$folders = Get-ChildItem -Path $path -Directory -Force -ErrorAction SilentlyContinue | Select-Object FullName

foreach($folder in $folders) {
    # Get folder full directory path.
    $folderName = $folder.FullName;
    # Move to the other folder.
    Set-Location $folderName;

    # Get total lines inside project.
    $lines = (Get-ChildItem -include *.cs,*.json,*.xml -Exclude *vs -recurse | select-string .).Count;    

    # Get path name.
    $directoryPath = [System.IO.Path]::GetDirectoryName($folderName);
    # Get directory name.
    $directoryName = [System.IO.Path]::GetFileName($folderName);

    if($lines -gt 0) {
        Write-Host("$directoryPath | $directoryName | $lines");    
    }
}
