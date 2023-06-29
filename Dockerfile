FROM alpine:latest
FROM python:3
ADD Task4.py /
CMD [ "python", "./Task4.py" ]
