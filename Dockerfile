FROM ubuntu
WORKDIR /tmp

RUN apt-get update && apt-get install -y curl
RUN curl --proto '=https' --tlsv1.2 -sSf https://tiup-mirrors.pingcap.com/install.sh | sh

EXPOSE 2379 4000 9090 3000

ENTRYPOINT ["/root/.tiup/bin/tiup","playground","--db.Host","0.0.0.0","--pd.Host","0.0.0.0"]
