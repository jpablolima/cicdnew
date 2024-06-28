FROM python:python:alpine3.20

COPY main.py /

CMD [ "python", "main.py" ]