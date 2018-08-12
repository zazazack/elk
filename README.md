# elk

Elasticsearch, Logstash, Kibana Stack

## Prereqs

-   Docker CE
-   Scrapy project w/ [scrapy-elasticsearch plugin](https://github.com/knockrentals/scrapy-elasticsearch) configured

## Installation

Launch Docker, open a terminal and clone this [project](https://github.com/zazazack/elk)

    $ git clone https://github.com/zazazack/elk.git

Create the file `./env`. This file will contain
This file will contain
 environment variables required for nginx and kibana to be configured for your specific host machine (default is `http://localhost`)

    $ nano `./.env`
    # ./.env

> Note the `.` in `.env`. This is important as this file should both be added to your `ignore*` files, e.g.,  `gitignore`, and be hidden from plain sight on the host\*\*. (files beggining w/ `.` are "hidden" by default on \*nix systems).

Set the following environment variables as required

    NGINX_HOST="localhost" # default
    server.name=$NGINX_HOST # default

Create two external, attachable networks on the host (default is localhost)

    $ docker network create --driver=overlay frontend
    $ docker network create --driver=overlay --attachable backend

Deploy the stack

    $ docker stack deploy -c stack.yml elk

Create cron jobs

    $ crontab -e
    # m h  dom mon dow   command
      0 *  *   *   *     docker run --rm --network backend zwilson/jobs scrapy crawl rigzone --loglevel="INFO"

Visit <http://localhost>
