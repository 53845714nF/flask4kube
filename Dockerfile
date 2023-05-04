FROM alpine
RUN mkdir /opt/app
WORKDIR /opt/app
ADD app.py /opt/app/app.py
ADD requirements.txt /opt/app/requirements.txt
RUN apk update
RUN apk add py-pip
RUN pip3 install -r /opt/app/requirements.txt

EXPOSE 8000
CMD ["gunicorn", "-b", "0.0.0.0:8000", "app:app"]