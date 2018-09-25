export ANDROID_HOME="$(first_dir /opt/android-sdk /Applications/android-sdk-macosx)"

type archlinux-java > /dev/null 2>&1
if [ $? -eq 0 ]; then
	export JAVA_HOME="/usr/lib/jvm/$(archlinux-java get)/"
fi
