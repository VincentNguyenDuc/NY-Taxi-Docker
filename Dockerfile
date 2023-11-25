FROM python:3.9.1

RUN apt-get update \
    && apt-get -y install wget \
    && apt-get clean
RUN pip install pandas sqlalchemy psycopg2-binary

WORKDIR /app
COPY ingest_data.py ingest_data.py

ENTRYPOINT [ "python", "ingest_data.py" ]