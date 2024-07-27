ARG IMAGE=intersystemsdc/iris-community
ARG IMAGE=intersystems/iris-ml-community:2023.1.0.235.0
FROM $IMAGE as builder

USER root   
        
WORKDIR /opt/irisapp
RUN chown ${ISC_PACKAGE_MGRUSER}:${ISC_PACKAGE_IRISGROUP} /opt/irisapp
USER ${ISC_PACKAGE_MGRUSER}

ENV PYTHON_PATH=/usr/irissys/bin/
ENV PATH "/usr/irissys/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/irisowner/bin"

COPY  src src
COPY module.xml module.xml
COPY iris.script /tmp/iris.script
COPY iris.script /opt/irisapp/iris.script
COPY irisfirebaseexample.json /opt/irisapp/irisfirebaseexample.json
COPY irisfirebaseexample.json /usr/irissys/mgr/user/irisfirebaseexample.json

RUN pip3 install --target /usr/irissys/mgr/python/ firebase-admin

RUN iris start IRIS && \
	iris session IRIS < iris.script && \
    iris stop IRIS quietly  
