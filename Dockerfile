FROM python:alpine3.20

RUN pip install requests

COPY . /

CMD [ "python", "main.py" ]