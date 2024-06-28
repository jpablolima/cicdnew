FROM python:python:alpine3.20

RUN pip install requests
COPY main.py /

CMD [ "python", "main.py" ]