import os
import youtube_dl

# Create a folder to store the videos
if not os.path.exists('DrLiptonVideos'):
    os.makedirs('DrLiptonVideos')

# Set the download options for youtube_dl
ydl_opts = {
    'format': 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best',
    'outtmpl': 'DrLiptonVideos/%(title)s.%(ext)s',
    'noplaylist': True,
}

# Get the list of videos from the playlist URL
with youtube_dl.YoutubeDL(ydl_opts) as ydl:
    playlist = ydl.extract_info('https://www.youtube.com/playlist?list=PLPcImQzEnTpz-5TzxyyoYSbiAa9xdd89l', download=False)['entries']
    
# Download each video in the playlist    
for video in playlist: 
    with youtube_dl.YoutubeDL(ydl_opts) as ydl: 
        ydl.download([video['webpage_url']])