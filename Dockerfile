FROM redhat/ubi8:8.8-854

RUN  dnf update -y  
RUN curl -s https://packagecloud.io/install/repositories/rabbitmq/rabbitmq-server/script.rpm.sh |  bash
RUN curl -s https://packagecloud.io/install/repositories/rabbitmq/erlang/script.rpm.sh |  bash
RUN dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm -y
RUN yum install erlang -y
RUN dnf install -y rabbitmq-server python3
RUN set eux; \
	rabbitmq-plugins enable --offline rabbitmq_management; \
	rm -f /etc/rabbitmq/conf.d/20-management_agent.disable_metrics_collector.conf; \
	cp /usr/lib/rabbitmq/lib/rabbitmq_server-3.12.4/plugins/rabbitmq_management-*/priv/www/cli/rabbitmqadmin /usr/local/bin/rabbitmqadmin; \
	[ -s /usr/local/bin/rabbitmqadmin ]; \
	chmod +x /usr/local/bin/rabbitmqadmin; \
	rabbitmqadmin --version && \
        rabbitmq-plugins enable   rabbitmq_prometheus
RUN echo "ETOBVBEFXUPGETFECHSQ" >/var/lib/rabbitmq/.erlang.cookie
RUN chown rabbitmq:rabbitmq -R  /var/lib/rabbitmq/
RUN chmod 0700 -R  /var/lib/rabbitmq/
VOLUME /var/lib/rabbitmq/
EXPOSE 4369 5671 5672 15691 15692 25672 15671 15672

CMD ["rabbitmq-server"]

