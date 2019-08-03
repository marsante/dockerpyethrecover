FROM python:2.7-alpine
RUN adduser -D app
WORKDIR /home/app
COPY --chown=app:app /recovery/louskac.py /wordlistgen/generuj.py /recovery/requirements.txt /recovery/keys.py /recovery/UTC--2017-07-12T00-06-42.772050600Z--f5751c906091b98be2a6be5ce42c573d704aedab ./
RUN set -ex \
	&& apk add --no-cache --virtual .build-deps  \
		automake \
		pkgconfig \
		libtool \
		libffi-dev \
		gmp-dev \
		build-base  \ 
	&& apk add --no-cache \
		libressl-dev \
	&& pip install --upgrade pip \
	&& pip install --no-cache-dir -r requirements.txt \
	&& apk del .build-deps
USER app
COPY --chown=app:app /recovery/wordlist_01.txt /recovery/end.txt /recovery/start.txt /wordlistgen/input.txt ./
CMD [ "python", "louskac.py", "-h" ]