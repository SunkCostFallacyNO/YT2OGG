param(
    [string]$OutDir = "$HOME\Music\yt-audio"
)

New-Item -ItemType Directory -Force -Path $OutDir | Out-Null

Write-Host "Saving audio files to: $OutDir"
Write-Host "Enter a YouTube video or playlist URL and press Enter to download."
Write-Host "Playlists are downloaded in full and placed in their own subfolder."
Write-Host "Leave blank (just press Enter) or type 'q'/'quit' to exit."
Write-Host ""

while ($true) {
    $URL = Read-Host "YouTube URL"

    if ([string]::IsNullOrWhiteSpace($URL) -or $URL -eq "q" -or $URL -eq "quit") {
        Write-Host "Exiting."
        break
    }

    if ($URL -match "list=" -or $URL -match "/playlist") {
        Write-Host "Playlist detected -- downloading all items..."
        $OutputTemplate = Join-Path $OutDir "%(playlist_title)s\%(playlist_index)s - %(title)s.%(ext)s"
        $PlaylistFlag = "--yes-playlist"
    }
    else {
        $OutputTemplate = Join-Path $OutDir "%(title)s.%(ext)s"
        $PlaylistFlag = "--no-playlist"
    }

    yt-dlp -x --audio-format vorbis --audio-quality 0 $PlaylistFlag --ignore-errors -o "$OutputTemplate" "$URL"

    if ($LASTEXITCODE -eq 0) {
        Write-Host "Done." -ForegroundColor Green
    }
    else {
        Write-Host "Something went wrong (or some items failed) -- check above." -ForegroundColor Red
    }
    Write-Host ""
}
