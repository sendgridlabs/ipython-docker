#################################################################
#
#                    ##        .
#              ## ## ##       ==
#           ## ## ## ##      ===
#       /""""""""""""""""\___/ ===
#  ~~~ {~~ ~~~~ ~~~ ~~~~ ~~ ~ /  ===- ~~~
#       \______ o          __/
#         \    \        __/
#          \____\______/
#
#################################################################

FROM ubuntu:trusty
MAINTAINER Lorin Hochstein <lorin.hochstein@sendgrid.com>

RUN apt-get update && apt-get install -y \
    ipython-notebook \
    pandoc \
    pkg-config \
    python-pandas \
    python-pip \
    python-psycopg2 \
    python-statsmodels \
    python2.7-dev

RUN pip install ggplot

VOLUME /notebooks
WORKDIR /notebooks

EXPOSE 8888

ADD notebook.sh /
RUN chmod u+x /notebook.sh
CMD ["/notebook.sh"]
