# build
[.NET 6 SDK](https://dotnet.microsoft.com/en-us/download/dotnet/6.0) is required.

```
cd Examples/ExtractBundledGGPK3
dotnet build -c Release
```

`oo2core.dll` is required for running exe. You can download it from [LibGGPK2](https://github.com/aianlinb/LibGGPK2/releases), rename `oo2core_9_win64.dll` to `oo2core.dll`.

# usage

```
Usage: ExtractBundledGGPK3 <PathToGGPK> <PathToExtract> <PathToSave>
```

like:
```
ExtractBundledGGPK3 "D:\WeGameApps\流放之路\Content.ggpk" "Metadata/StatDescriptions/gem_stat_descriptions.txt" "F:\stat_descriptions.txt"
```
