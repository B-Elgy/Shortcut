cd ~/desktop
2=“$1”
1=“/Applications/$1.app”
appName="$2.app"
mkdir $appName
cd $appName
mkdir Contents
cd Contents
touch Info.plist
mkdir MacOS
mkdir Resources
cd MacOS
touch executable.sh
applicationPath=$1
executableText=$'#!/bin/bash\n open '"$applicationPath" 
echo "$executableText" > executable.sh
chmod +x executable.sh
cd ..
cp $1/Contents/Resources/* Resources
cd Resources
arr=( $(find . -type f) )
curIconName=${arr[0]}
mv $curIconName icon.icns
cd ..
info=$'<?xml version="1.0" encoding="UTF-8"?>\n
	<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">\n
	<plist version="1.0">\n
	<dict>\n
		<key>CFBundleExecutable</key>\n
		<string>executable.sh</string>\n
		<key>CFBundleIconFile</key>\n
		<string>icon.icns</string>\n
		<key>CFBundleInfoDictionaryVersion</key>\n
		<string>1.0</string>\n
		<key>CFBundlePackageType</key>\n
		<string>APPL</string>\n
		<key>CFBundleSignature</key>\n
		<string>????</string>\n
		<key>CFBundleVersion</key>\n
		<string>1.0</string>\n
	</dict>\n
	</plist>' 
echo "$info" > Info.plist
