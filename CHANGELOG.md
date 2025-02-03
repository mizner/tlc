# Changelog

All notable changes to this project will be documented in this file.

## [0.0.2] - Upcoming
### Add
- 🏗 **API Endpoints:**
  - Implement basic **transcript fetching API**.
  - Enable support for **`yt-dlp` processing inside the container**.
- 🔄 **Auto-scaling Configuration:**
  - Check Fly.io - wouldn't deploy on 02/03/2025.
  - Look into **auto-scaling** options for better resource management.
- 📜 **Logging & Monitoring:**
  - Implement structured logs for easier debugging.
  - Add **error handling** for failed transcript downloads.

---

## [0.0.1] - 2025-02-03
### Added
- 🎉 Initial release of `yt-transcript` service.
- 🔄 Running on **Node.js 23 + Python 3.13** (`nikolaik/python-nodejs`).
- 🔥 Simple **HTTP server** added (`server.js`) to handle root requests.
  - Set `EXPOSE 8080` to match Fly.io's expected port.
  - Ensured the service listens on `0.0.0.0:8080`.
- 🤖 Scripting
  - Added bash script to transform vtt files to json with only needed keys
  - Dockerfile Installed required dependencies (`yt-dlp`, `ffmpeg`, `jq`).
  - Runs `npm install` if `package.json` is exists.
- 🖥️ CLI Testing
  - Tested downloading transcripts (subtitles) from YouTube videos. `yt-dlp --write-auto-sub --skip-download --sub-lang en -o "./transcripts/%(id)s.%(ext)s" "https://www.youtube.com/watch?v=EehNtk4cTbo&t=12s"`
  - Tested downloading downloading metadata from YouTube videos. `yt-dlp -j "https://www.youtube.com/watch?v=EehNtk4cTbo"`



---
