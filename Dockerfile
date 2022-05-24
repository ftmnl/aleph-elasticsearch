FROM elasticsearch:8.2.0
LABEL org.opencontainers.image.source = "https://github.com/alephdata/aleph-elasticsearch"

RUN bin/elasticsearch-plugin install --batch analysis-icu

COPY k8s-entrypoint.sh /k8s-entrypoint.sh
COPY --chown=elasticsearch synonames.txt /usr/share/elasticsearch/config/

ENTRYPOINT [ "/k8s-entrypoint.sh" ]
