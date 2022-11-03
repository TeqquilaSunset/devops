FROM ubuntu:22.04 as builder
WORKDIR /opt/app
# убирает лишний вывод
ARG DEBIAN_FRONTEND=noninteractive

RUN apt update
RUN apt install -y \
  npm \
  ruby \
  wget \
  wkhtmltopdf \
  && rm -rf /var/lib/apt/lists/*
RUN npm install -g @go-task/cli
RUN wget -qO /usr/local/bin/yq https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 \
  && chmod a+x /usr/local/bin/yq
RUN gem install yaml-cv
COPY src src
COPY scripts scripts
COPY .env .env
COPY Taskfile.yaml Taskfile.yaml
ENTRYPOINT ["task"]
CMD ["build"]

FROM builder as build
RUN task build

FROM busybox as lite
WORKDIR /opt/app/build
COPY --from=build opt/app/build/cv.html .
VOLUME /opt/app/build