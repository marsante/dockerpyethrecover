FROM python:2.7-alpine
RUN adduser -D app
USER app
WORKDIR /home/app
COPY --chown=app:app generuj.py input.txt ./
CMD [ "python", "generuj.py", "-h" ]