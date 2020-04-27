FROM r-base

RUN apt-get update -qq && apt-get -y --no-install-recommends install \
  libxml2-dev \ 
  libssl-dev \
  libcurl4-openssl-dev \
  zlib1g-dev \
  && . /etc/environment \
  && install2.r --error --deps TRUE \
    plumber tidyverse \ 
 && apt-get autoclean \
 && apt-get -y autoremove libssl-dev \
 && rm -rf /var/lib/apt/lists/*

EXPOSE 8080
 
COPY . /usr/local/src/myscripts
WORKDIR /usr/local/src/myscripts
CMD ["Rscript", "app.R"]
