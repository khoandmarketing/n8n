FROM n8nio/n8n:latest

# Cài đặt các gói cần thiết
RUN apk add --no-cache python3 py3-pip ffmpeg

# Cài đặt các thư viện Python
RUN pip3 install yt-dlp pydub SpeechRecognition

# Copy script Python (buộc rebuild bằng cách thêm comment khác nhau)
# Build ID: 20250225-1
COPY scripts/process_video.py /usr/local/bin/process_video.py

# Kiểm tra file
RUN ls -l /usr/local/bin/process_video.py || echo "ERROR: File not copied to /usr/local/bin/"

# Thêm quyền thực thi
RUN chmod +x /usr/local/bin/process_video.py

EXPOSE 5678
CMD ["n8n"]