# YT2OGG
Simple scripts for both Windows and Linux to download YT Audio and convert it to OGG

I made it for downloading "public domain" music from youtube to use in My Summer Car & My Winter Car.

It should work under any Linux Distro as long as ffmpeg and yt-dlp are installed, but I only use Arch so please raise an issue if it does not work under your distro.



# Prerequisites:
yt-dlp & ffmpeg

# WINDOWS

I used Winget to install these
```
winget install yt-dlp.yt-dlp
winget install Gyan.FFmpeg
```
if there's issues with Powershell execution not being permitted
```
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
```
# Usage
```
.\yt2ogg.ps1 (-OutDir [Path])
q or empty line to exit
```
# LINUX

Prerequisites:
yt-dlp & ffmpeg

# Arch Linux
```
sudo pacman -S yt-dlp ffmpeg
```
# Ubuntu/Debian
```
sudo apt install yt-dlp ffmpeg
```
# Fedora
```
sudo dnf install yt-dlp ffmpeg
```
# OpenSUSE
```
sudo zypper install yt-dlp ffmpeg
```
# Alpine
```
sudo apk add yt-dlp ffmpeg
```
# Void Linux
```
sudo xbps-install -S yt-dlp ffmpeg
```

# USAGE

```
chmod +x ./yt2ogg.sh
./yt2ogg.sh [directory to save in (not required)]
Paste in your YouTube link or playlist link
q or empty line to exit
```



