# Docker cron
Example of a crontab runing in docker.

You need docker installed and the daemon running.

You can run it using

    $ docker build -t cron-example .

    $ docker run -v /path/to/cron_docker/logs:/var/log cron-example

And check the logs.

From [stackoverflow](http://stackoverflow.com/questions/26822067/running-cron-python-jobs-within-docker).
