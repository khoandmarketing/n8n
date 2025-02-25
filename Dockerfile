FROM n8nio/n8n:latest

# Chuyển sang user root để có quyền
USER root

# Cập nhật và cài đặt gói
RUN apk update && apk add --no-cache python3 py3-pip ffmpeg

# Cài thư viện Python
RUN pip3 install yt-dlp pydub SpeechRecognition

# Copy script
COPY scripts/process_video.py /usr/local/bin/process_video.py
RUN ls -l /usr/local/bin/process_video.py || echo "ERROR: File not copied"
RUN chmod +x /usr/local/bin/process_video.py

EXPOSE 5678
CMD ["n8n"]