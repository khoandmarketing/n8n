FROM n8nio/n8n:latest

RUN apk add --no-cache python3 py3-pip ffmpeg
RUN pip3 install yt-dlp pydub SpeechRecognition
COPY scripts/process_video.py /usr/local/bin/process_video.py
RUN ls -l /usr/local/bin/process_video.py || echo "ERROR: File not copied to /usr/local/bin/"

EXPOSE 5678
CMD ["n8n"]