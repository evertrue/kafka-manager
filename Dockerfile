FROM ubuntu:14.04

RUN echo "deb http://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list

RUN apt-get update && apt-get install -y --force-yes build-essential wget unzip git openjdk-7-jdk sbt

RUN git clone https://github.com/evertrue/kafka-manager.git \
  && cd kafka-manager \
  && sbt update \
  && sbt dist \
  && unzip target/universal/kafka-manager-1.2.5.zip

EXPOSE 9000

CMD /kafka-manager/kafka-manager-1.2.5/bin/kafka-manager -Dkafka-manager.zkhosts=${ZOOKEEPER}