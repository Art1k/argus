FROM tomcat:8
MAINTAINER Danielk

RUN mkdir /opt/jmx_exporter

ADD https://repo1.maven.org/maven2/io/prometheus/jmx/jmx_prometheus_javaagent/0.8/jmx_prometheus_javaagent-0.8.jar /opt/jmx_exporter/
ADD prometheus-jmx-config.yaml /opt/jmx_exporter/prometheus-jmx-config.yaml
ADD https://tomcat.apache.org/tomcat-8.0-doc/appdev/sample/sample.war /usr/local/tomcat/webapps/

ENV JAVA_OPTS="-javaagent:/opt/jmx_exporter/jmx_prometheus_javaagent-0.8.jar=8088:/opt/jmx_exporter/prometheus-jmx-config.yaml $JAVA_OPTS"
