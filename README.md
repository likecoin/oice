Oice-deployment README
==================

- [Intro](#intro)
- [Prerequisite](#prerequisite)
- [Setup](#setup)
- [DB Migration commans](#db-migration-commands)


Intro
-------------
Oice project consists of the open source repos under GPLv3 licence...
- [oice-server](https://github.com/likecoin/oice-server/)
- [oice-web](https://github.com/likecoin/oice-web/)

... and 2 proprietary repos avalable for development use only
- [Builder3](https://github.com/likecoin/Builder3/)
- [o2engine](https://github.com/likecoin/oice-o2engine-dist/)

Please check the respective licence files for terms and conditions

Prerequisite
-------------
- [Docker](https://www.docker.com/get-docker) and [docker-compose](https://docs.docker.com/compose/)

Setup
---------------
Remeber to init all submodules first
- `git submodule update --init --recursive`

### General development (with prebuild oice-web image)
- `docker-compose build`
- `docker-compose up -d`

The SQL dump in [database](./database) will be imported the first time you run the mysql container

### Web development (with webpack hotreload + mount volume)

For web development quick start, rename `oice-web/common/constants/key.example.js` to `key.js`, then
- `docker-compose -f docker-compose.oice-web-dev.yml build`
- `docker-compose -f docker-compose.oice-web-dev.yml up`

it will take some time for webpack to build the `oice-web` development build

DB Migration commands
---------------------
We use [Alembic](http://alembic.zzzcomputing.com/en/latest/) for oice-server database version control

In case of a database upgrade needed, just run

- `docker-compose exec oice-server alembic -c example.ini upgrade head`

while the `oice-server` and mysql container is running

For more detailed guide of creating migrations and downgrading db version, please refer to alembic documentation.
