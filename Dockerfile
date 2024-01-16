ARG IMAGE=intersystemsdc/iris-community
FROM $IMAGE

USER root   
        
WORKDIR /opt/irisapp
RUN chown ${ISC_PACKAGE_MGRUSER}:${ISC_PACKAGE_IRISGROUP} /opt/irisapp
USER ${ISC_PACKAGE_MGRUSER}

COPY  src src
COPY module.xml module.xml
COPY iris.script /tmp/iris.script
COPY irisfirebaseexample.json /opt/irisapp/irisfirebaseexample.json
COPY irisfirebaseexample.json /usr/irissys/mgr/user/irisfirebaseexample.json

RUN pip3 install --target /usr/irissys/mgr/python/ firebase-admin

RUN iris start IRIS \
	&& iris session IRIS < /tmp/iris.script \
    && iris stop IRIS quietly
