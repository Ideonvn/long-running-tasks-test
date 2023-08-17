FROM alpine:latest

COPY long_running_task.sh /app/long_running_task.sh
WORKDIR /app

RUN chmod +x long_running_task.sh

CMD ["./long_running_task.sh", "60"]
