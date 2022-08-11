cd $(dirname $0)
rm -r -f publish
dotnet publish -c Release -r win-x64 -o publish/win-x64 --no-self-contained --nologo -p:PublishReadyToRun=true
dotnet publish -c Release -r win-arm64 -o publish/win-arm64 --no-self-contained --nologo -p:PublishReadyToRun=true
dotnet publish -c Release -r linux-x64 -o publish/linux-x64 --no-self-contained --nologo -p:PublishReadyToRun=true
dotnet publish -c Release -r linux-arm64 -o publish/linux-arm64 --no-self-contained --nologo -p:PublishReadyToRun=true
dotnet publish -c Release -r osx-x64 -o publish/osx-x64 --no-self-contained --nologo -p:PublishReadyToRun=true
dotnet publish -c Release -r osx-arm64 -o publish/osx-arm64 --no-self-contained --nologo -p:PublishReadyToRun=true
rm -r -f publish/osx*/Eto.*
rm -r -f publish/osx*/MonoMac.dll
rm -r -f publish/osx*/VisualGGPK3.*
rm -r -f publish/osx*/VPatchGGPK3.*
dotnet publish Examples/VisualGGPK3 -c Release -r osx-x64 -o publish/osx-x64/VisualGGPK3.app/Contents/MacOS --no-self-contained --nologo -p:PublishReadyToRun=true
dotnet publish Examples/VisualGGPK3 -c Release -r osx-arm64 -o publish/osx-arm64/VisualGGPK3.app/Contents/MacOS --no-self-contained --nologo -p:PublishReadyToRun=true
dotnet publish Examples/VPatchGGPK3 -c Release -r osx-x64 -o publish/osx-x64/VPatchGGPK3.app/Contents/MacOS --no-self-contained --nologo -p:PublishReadyToRun=true
dotnet publish Examples/VPatchGGPK3 -c Release -r osx-arm64 -o publish/osx-arm64/VPatchGGPK3.app/Contents/MacOS --no-self-contained --nologo -p:PublishReadyToRun=true
rm -r -f publish/osx*/*.app/Contents/MacOS/*.app
cp -r -f Mac/Resources publish/osx-x64/VisualGGPK3.app/Contents
cp -r -f Mac/Resources publish/osx-x64/VPatchGGPK3.app/Contents
cp -r -f Mac/Resources publish/osx-arm64/VisualGGPK3.app/Contents
cp -r -f Mac/Resources publish/osx-arm64/VPatchGGPK3.app/Contents
cp -f -T Mac/VisualGGPK3_Info.plist publish/osx-x64/VisualGGPK3.app/Contents/Info.plist
cp -f -T Mac/VPatchGGPK3_Info.plist publish/osx-x64/VPatchGGPK3.app/Contents/Info.plist
cp -f -T Mac/VisualGGPK3_Info.plist publish/osx-arm64/VisualGGPK3.app/Contents/Info.plist
cp -f -T Mac/VPatchGGPK3_Info.plist publish/osx-arm64/VPatchGGPK3.app/Contents/Info.plist
(echo "chmod -R +x *" && echo "xattr -c -r .") > publish/osx-x64/FirstRun.sh
(echo "chmod -R +x *" && echo "xattr -c -r .") > publish/osx-arm64/FirstRun.sh