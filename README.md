
## IrisFirebase module


## Use

Clone/git pull the repo into any local directory e.g. like it is shown below 
(here I show all the examples related to this repository, but I assume you have your own derived from the template):

```
$ git clone https://github.com/daniel-aguilar-garcia/irisfirebase
```

Open the terminal in this directory and run:

```
$ docker-compose up -d --build
```


## How to Work With it

# Initialization

Follow the steps of this tutorial to configure your instance:

https://community.intersystems.com/post/firebase-module-unleashing-power-firebase-realtime-database-intersystems-iris



# Useful commands

# Create register:
 

##class(Firebase.RTDB).Create("appName",objData,"tableName",id)

 

# Update register:
 

##class(Firebase.RTDB).Update("appName","tableName",id,.objTest)


 

# Read a single register:
 

##class(Firebase.RTDB).Read("appName","tableName",id)

 

# Read the whole node:
 

##class(Firebase.RTDB).ReadTable("appName","tableName")

 

# Delete a single register:
 

##class(Firebase.RTDB).Delete("appName","tableName",id)

 

# Delete the whole node:
 

##class(Firebase.RTDB).Delete("appName","tableName")


