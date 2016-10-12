
Scripts for processing GoPro videos into timelapses and then uploading to YouTube.

To set up:

1. Download FFMPEG and place in the ffmpeg/ directory
2. Remove '.example' from any files
3. Populate client_secret.json with real API key info
4. Place raw videos one or more directories like 'YYYY-MM-DD-AM' (or PM)
5. Run gopro\_timelapse\_create.sh
6. Run upload.sh

upload_video.py has a playlist ID hardcoded in it.