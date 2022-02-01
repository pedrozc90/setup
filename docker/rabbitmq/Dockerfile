FROM rabbitmq:3.9.13-management-alpine

RUN rabbitmq-plugins enable --offline \
    rabbitmq_auth_backend_cache \
    rabbitmq_auth_backend_http \
    rabbitmq_management \
    rabbitmq_mqtt \
    rabbitmq_web_mqtt \
    rabbitmq_web_mqtt_examples

COPY rabbitmq.conf /etc/rabbitmq/rabbitmq.conf

EXPOSE 15675
