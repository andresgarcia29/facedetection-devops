FROM go:3.12 AS builder

RUN apt install curl -y

WORKDIR /app

RUN mkdir -p /app/models

RUN wget -O /app/models/haarcascade_frontalface_default.xml https://github.com/opencv/opencv/raw/4.x/data/haarcascades/haarcascade_frontalface_default.xml

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY main.py .
COPY uploaded_image.jpg .

EXPOSE 5001

CMD ["python", "main.py"]
