# BUILD-USING:        docker build -t test-cron .
# RUN-USING docker run --detach=true --volumes-from t-logs --name t-cron test-cron

FROM debian:wheezy
#
# Set correct environment variables.
ENV HOME /root
ENV TEST_ENV test-value

RUN apt-get update && apt-get install -y software-properties-common python-software-properties && apt-get update

# Install Python Setuptools
RUN apt-get install -y python cron

RUN apt-get purge -y python-software-properties software-properties-common && apt-get clean -y && apt-get autoclean -y && apt-get autoremove -y && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD cron-python /etc/cron.d/
ADD test.py /
ADD run-cron.py /

RUN chmod a+x test.py run-cron.py

# Set the time zone to the local time zone
RUN echo "America/New_York" > /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata
CMD ["/run-cron.py"]
