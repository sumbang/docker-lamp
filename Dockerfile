FROM mattrayner/lamp:latest-1804

LABEL maintainer="tsumbang@gmail.com"
LABEL description="LAMP for dev"

ENV TZ=Africa/Douala
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get -y update && apt-get install -y \
git \
cron \
nano \
ssh

# Environment variables to configure php
ENV PHP_UPLOAD_MAX_FILESIZE 50M
ENV PHP_POST_MAX_SIZE 80M
ENV PHP_MEMORY_LIMIT 1024M
ENV PHP_MAX_EXECUTION_TIME 180

EXPOSE 80 443 3306
CMD ["/run.sh"]