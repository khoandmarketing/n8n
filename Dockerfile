FROM n8nio/n8n:latest

# Chỉ định mirror và cài đặt gói
RUN echo "http://dl-cdn.alpinelinux.org/alpine/v3.19/main" > /etc/apk/repositories && \
    echo "http://dl-cdn.alpinelinux.org/alpine/v3.19/community" >> /etc/apk/repositories && \
    apk update && apk add --no-cache python3 py3-pip ffmpeg

RUN pip3 install yt-dlp pydub SpeechRecognition
COPY scripts/process_video.py /usr/local/bin/process_video.py
RUN ls -l /usr/local/bin/process_video.py || echo "ERROR: File not copied to /usr/local/bin/"
RUN chmod +x /usr/local/bin/process_video.py

EXPOSE 5678
CMD ["n8n"]