FROM python:3.7-alpine
RUN adduser -D app
WORKDIR /home/app
RUN set -ex \
	&& apk add --no-cache --virtual .build-deps  \
		automake \
		pkgconfig \
		libtool \
		libffi-dev \
		gmp-dev \
		build-base  \
		git \
	&& apk add --no-cache \
		libressl-dev \
	&& git clone https://github.com/marsante/py3ethrecover.git . \
	&& chown -R app:app . \
	&& pip install --upgrade pip \
	&& pip install --no-cache-dir -r requirements.txt \
	&& apk del .build-deps
USER app
CMD [ "python", "py3ethrecover.py", "-h" ]