FROM python:3.9

RUN pip install prometheus_client

COPY monitor_file.py  /app/monitor_file.py

WORKDIR /app

CMD [ "python", "monitor_file.py" ]
