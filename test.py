#!/usr/bin/env python

# python script which needs an environment variable and runs as a cron job
import datetime
import os

test_environ = os.environ["TEST_ENV"]
print "Cron job has run at %s with environment variable '%s'" %(datetime.datetime.now(), test_environ)