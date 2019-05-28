FROM python

RUN useradd gunicorn -r 
RUN pip install gunicorn flask requests redis

WORKDIR /app

COPY app /app
COPY cmd.sh /
RUN chown -R gunicorn:gunicorn /app

EXPOSE 8000

USER gunicorn
CMD ["/cmd.sh"]
