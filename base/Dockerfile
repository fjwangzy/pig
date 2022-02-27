FROM centos:8.1.1911
MAINTAINER pader "yaogu@alibaba.com"

# set environment
ENV MODE="cluster" \
    PREFER_HOST_MODE="ip"\
    BASE_DIR="/home/nacos" \
    CLASSPATH=".:/home/nacos/conf:$CLASSPATH" \
    CLUSTER_CONF="/home/nacos/conf/cluster.conf" \
    FUNCTION_MODE="all" \
    JAVA_HOME="/usr/lib/jvm/java-1.8.0-openjdk" \
    NACOS_USER="nacos" \
    JAVA="/usr/lib/jvm/java-1.8.0-openjdk/bin/java" \
    JVM_XMS="1g" \
    JVM_XMX="1g" \
    JVM_XMN="512m" \
    JVM_MS="128m" \
    JVM_MMS="320m" \
    NACOS_DEBUG="n" \
    TOMCAT_ACCESSLOG_ENABLED="false" \
    TIME_ZONE="Asia/Shanghai"

ARG NACOS_VERSION=2.0.3
ARG HOT_FIX_FLAG=""

WORKDIR $BASE_DIR
#RUN #curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.cloud.tencent.com/repo/centos8_base.repo \
#    curl http://mirrors.cloud.tencent.com/repo/centos8_base.repo >/etc/yum.repos.d/CentOS-Base.repo \
#    && sed -i -e "s|mirrors.cloud.tencent.com|mirrors.tencent.com|g " /etc/yum.repos.d/CentOS-* \
#    && sed -i -e "s|releasever|releasever-stream|g" /etc/yum.repos.d/CentOS-*
# RUN  curl http://mirrors.cloud.tencent.com/repo/centos8_base.repo >/etc/yum.repos.d/CentOS-Base.repo
COPY ./CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo
COPY ./CentOS-AppStream.repo /etc/yum.repos.d/CentOS-AppStream.repo

# RUN   sed -i -e "s|mirrors.cloud.tencent.com|mirrors.tencent.com|g " /etc/yum.repos.d/CentOS-* \
#       && sed -i -e "s|releasever|releasever-stream|g" /etc/yum.repos.d/CentOS-*

#RUN sed -i -e "s|mirrorlist=|#mirrorlist=|g" /etc/yum.repos.d/CentOS-Base.repo \
#    && sed -i -e "s|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g" /etc/yum.repos.d/CentOS--Base.repo \
#    && sed -i -e "s|mirrorlist=|#mirrorlist=|g" /etc/yum.repos.d/CentOS-AppStream.repo \
#    && sed -i -e "s|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g" /etc/yum.repos.d/CentOS-AppStream.repo


RUN  yum clean all \
     &&yum makecache \
     && yum update -y

RUN set -x \
    && yum install -y java-1.8.0-openjdk java-1.8.0-openjdk-devel wget iputils nc vim libcurl-minimal \
    &&yum autoremove -y wget \
    && ln -snf /usr/share/zoneinfo/$TIME_ZONE /etc/localtime && echo $TIME_ZONE > /etc/timezone \
