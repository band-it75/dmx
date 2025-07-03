# DMZ Project Folder

This directory contains the DMXControl project configuration.
Run `build_dmz.ps1` from the repository root to package the project:

```powershell
pwsh ./build_dmz.ps1
```

The script copies all fixture definition files into `LibDevices`, calculates CRC32
checksums for every file and writes `checksum.sfv`. Finally it packages the folder
as `dmz` archive for import into DMXControl.
