FROM python

RUN useradd gunicorn -r && rm -rf /etc/localtime && ln -s /usr/share/zoneinfo/Europe/Moscow /etc/localtime
RUN pip install gunicorn flask requests redis

WORKDIR /app

COPY app /app
COPY cmd.sh /
RUN chown -R gunicorn:gunicorn /app

EXPOSE 8000

USER gunicorn
CMD ["/cmd.sh"]
