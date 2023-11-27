FROM python:3.9.1

RUN apt-get update \
    && apt-get -y install wget \
    && apt-get clean

WORKDIR /app
COPY ingest_data.py ingest_data.py
COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt

ENTRYPOINT [ "python", "ingest_data.py" ]