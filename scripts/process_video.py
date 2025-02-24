import yt_dlp
import speech_recognition as sr
from pydub import AudioSegment
import sys

# Tải video và trích xuất MP3
def download_audio(url):
    ydl_opts = {
        'format': 'bestaudio/best',
        'outtmpl': 'output.mp3',
        'postprocessors': [{
            'key': 'FFmpegExtractAudio',
            'preferredcodec': 'mp3',
        }],
    }
    with yt_dlp.YoutubeDL(ydl_opts) as ydl:
        ydl.download([url])
    return "output.mp3"

# Chuyển MP3 thành văn bản
def audio_to_text(mp3_file):
    recognizer = sr.Recognizer()
    audio = AudioSegment.from_mp3(mp3_file)
    audio.export("temp.wav", format="wav")
    with sr.AudioFile("temp.wav") as source:
        audio_data = recognizer.record(source)
        text = recognizer.recognize_google(audio_data, language="vi-VN")
    return text

# Nhận URL từ argument
url = sys.argv[1]  # Lấy URL từ tham số dòng lệnh
mp3_file = download_audio(url)
text = audio_to_text(mp3_file)
print(f"{mp3_file}|{text}")  # Trả về đường dẫn MP3 và văn bản
