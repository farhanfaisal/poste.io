ARG UPSTREAM=2.3.6
FROM analogic/poste.io:$UPSTREAM
RUN apt-get update && apt-get install less  # 'less' is Useful for debugging

# Default to listening only on IPs bound to the container hostname
ENV LISTEN_ON=host
ENV SEND_ON=
EXPOSE 443

COPY files /
RUN /patches && rm /patches
ENTRYPOINT /init
