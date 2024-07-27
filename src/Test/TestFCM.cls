Class irisfirebase.src.Test.TestFCM Extends %RegisteredObject
{

ClassMethod init()
{
        
    Do ##class(irisfirebase.src.Firebase.Helper).ConfigApp("appNotas",,"irisfirebaseexample.json")
}

ClassMethod TestSendMessage()
{
        Set appName     = "appNotas"
        Set title       = "IrisFirebase FCM"
        Set body        = "Now you can send messages from Iris using IrisFirebase!!!"
        Set image       = "https://openexchange.intersystems.com/mp/img/packages/3553/vaeo3isvwgubxb2ya7vb0c9edgs.jpeg"
        Set token       = "fErQlmmjTsq2E2-p7RN6zD:APA91bFhdeCGit17QSIXrlbfovr59BgviGIDHI0nnp7t9i_YFKAPSACkTvP_iKOV-b3Xaj73uhl7Z0S41vfmH_YVV8Ep9Evad69-s1Hkt9pu3VrkeZQGTc8vAJgKSY1qkhuP7HU6t7FD"
        Set data        = {}
        Set data.param1 = "param1 value"
        Set data.param2 = "param2 value"

        Set result = ##class(irisfirebase.src.Firebase.FCM).Send(appName, token, title, body, image, data)
        
        If (result = 1)
        {
                U 0 W "Message sended OK"
        }Else{
                U 0 W "Error sending message"

        }
}

ClassMethod TestSaveToken()
{
        Set token   = "fErQlmmjTsq2E2-p7RN6zD:APA91bFhdeCGit17QSIXrlbfovr59BgviGIDHI0nnp7t9i_YFKAPSACkTvP_iKOV-b3Xaj73uhl7Z0S41vfmH_YVV8Ep9Evad69-s1Hkt9pu3VrkeZQGTc8vAJgKSY1qkhuP7HU6t7FD"
        Set appName = "appNotas"
        Set id      = 123456

        Do ##class(irisfirebase.src.Firebase.FCM).SaveToken(appName, token, id)
}

ClassMethod TestSendMessageToId()
{
        Set appName     = "appNotas"
        Set id          = 123456
        Set title       = "título"
        Set body        = "Cuerpo Mensaje"
        Set image       = "https://openexchange.intersystems.com/mp/img/packages/3553/vaeo3isvwgubxb2ya7vb0c9edgs.jpeg"
        Set data        = {}
        Set data.param1 = "param1 value"
        Set data.param2 = "param2 value"

        Set result = ##class(irisfirebase.src.Firebase.FCM).SendMessageToId(appName, id, title, body, image, data)

        If (result = 1)
        {
                U 0 W "Message sended OK"
        }Else{
                U 0 W "Error sending message"

        }
}

}
