FROM redhat/ubi8:8.8-854

RUN  dnf update -y  
RUN curl -s https://packagecloud.io/install/repositories/rabbitmq/rabbitmq-server/script.rpm.sh |  bash
RUN curl -s https://packagecloud.io/install/repositories/rabbitmq/erlang/script.rpm.sh |  bash
RUN dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm -y
RUN yum install erlang -y
RUN dnf install -y rabbitmq-server

EXPOSE 4369 5671 5672 15691 15692 25672
CMD ["rabbitmq-server"]

