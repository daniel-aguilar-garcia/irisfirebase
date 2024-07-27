Class irisfirebase.src.Firebase.FCM Extends %RegisteredObject
{

ClassMethod SaveToken(appName As %String, token As %String, id As %String)
{
    Set ^Firebase(appName,"FCM",id)=token
}

ClassMethod Send(appName As %String, token As %String, title As %String = "", body As %String = "", image As %String = "", data As %DynamicObject) As %Integer
{
    Set credentialFile = $G(^Firebase(appName,"credentialFile"))
    Q:(credentialFile="") 0
    
    Set dataString = data.%ToJSON()

    Set result =  ..SendMessage(token, credentialFile, title, body, image, dataString)
    Quit result
}

ClassMethod SendMessageToId(appName As %String, id As %String, title As %String = "", body As %String = "", image As %String = "", data As %DynamicObject)
{
    Set result = 0
    
    Set token = $G(^Firebase(appName,"FCM",id))
    
    Quit:(token = "") result
    
    Set result = ..Send(appName, token, title, body, image, data)

    Quit result
}

ClassMethod SendMessage(token As %String, credentialFile As %String, title As %String = "", body As %String = "", image As %String = "", data As %String = "") As %Integer [ Language = python ]
{
        import json
        import firebase_admin
        from firebase_admin import credentials, auth, messaging
        from firebase_admin import db

        try:
            if not firebase_admin._apps:
                cred = credentials.Certificate(credentialFile)
                firebase_admin.initialize_app(cred)
            
            dataJson = json.loads(data)
    
            message = messaging.Message(
                        notification = messaging.Notification(
                            title = title,
                            body  = body,
                            image = image
                        ),
                        data = dataJson,
                        token = token
            )

            response = messaging.send(message)
            return 1

        except Exception as error:
            print(f"Error: {error}")
            return 0
}

}
