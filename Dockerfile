FROM n8nio/n8n:latest

# Cài đặt các gói cần thiết
RUN apk add --no-cache python3 py3-pip ffmpeg

# Cài đặt các thư viện Python
RUN pip3 install yt-dlp pydub SpeechRecognition

# Copy script Python
COPY scripts/process_video.py /usr/local/bin/process_video.py

# Mở cổng n8n
EXPOSE 5678

# Chạy n8n
CMD ["n8n"]
