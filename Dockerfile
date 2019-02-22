FROM python:3.7
MAINTAINER wis <h835996498@qq.com>


ADD requirements.txt /requirements.txt
RUN pip install -r  /requirements.txt -i http://192.168.56.11:8081/artifactory/api/pypi/pypi/simple --trusted-host 192.168.56.11

ADD entrypoint.sh /entrypoint.sh
RUN ["chmod", "+x", "/entrypoint.sh"]
ENTRYPOINT ["/entrypoint.sh"]
