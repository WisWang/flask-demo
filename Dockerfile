FROM python:3.7
MAINTAINER wis <h835996498@qq.com>


ADD ./ /
RUN pip install -r  /requirements.txt -i http://192.168.56.11:8081/artifactory/api/pypi/pypi/simple --trusted-host 192.168.56.11

RUN ["chmod", "+x", "/entrypoint.sh"]
ENTRYPOINT ["/entrypoint.sh"]
