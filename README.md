
Scripts for processing GoPro videos into timelapses and then uploading to YouTube.

These are the scripts that I use to generate and upload [these timelapse videos](https://www.youtube.com/playlist?list=PL1cNOU1HfaMI8ha3e3iUsocQuoXH70CvF)
of a construction site near my workplace.

I run this on Windows under MSYS bash. Requires Python.

To run:

1. Download FFMPEG and place in the `ffmpeg/` directory (or edit `gopro_timelapse_create.sh` to point to an existing copy).
2. Make a copy of `client_secrets.example.json` and call it `client_secret.json`.
3. Populate `client_secret.json` with real API key info. See [the documentation](https://developers.google.com/youtube/v3/getting-started) for details.
4. Place raw videos in one or more directories like 'YYYY-MM-DD-AM' (or PM)
5. Run `gopro_timelapse_create.sh` - this will place timelapse videos (one per directory) into the `to-upload` directory.
6. Run `upload.sh` - this will upload the timelapse videos to YouTube and move both the timelapses and the originals into the `done` directory.

To customize video encoding options, edit `gopro_timelapse_create.sh`. To customize YouTube settings, edit `upload.sh`.
