Class Test.TestRTDB Extends %RegisteredObject
{

ClassMethod init()
{
 
    Do ##class(Firebase.RTDB).ConfigApp("appNotas","https://irisfirebaseexample-default-rtdb.firebaseio.com/","irisfirebaseexample.json")
}

ClassMethod TestRead()
{
    Set id = "00001" //..TestCreate()
    
    Set response=##class(Firebase.RTDB).Read("appNotas","notes",id)
    U 0 w response.title,!
    U 0 w response.detail,!
}

ClassMethod TestReadFullTable()
{
    
    Set response = {}
    Set response=##class(Firebase.RTDB).ReadTable("appNotas","notes")
    U 0 w response.%ToJSON(),!
}

ClassMethod TestCreate()
{
    Set objTest = {}
    Set objTest.title = "The first title"
    Set objTest.detail = "The first dummy message"
    Set id = "00001"
    
    Set id=##class(Firebase.RTDB).Create("appNotas",objTest,"notes",id)
    U 0 w id,!
    Q id
}

ClassMethod TestCreateAutoId()
{
    Set objTest = {}
    Set objTest.titulo = "prueba2222"
    Set objTest.detalle = "esto es una prueba2222"
    
    Set id=##class(Firebase.RTDB).Create("appNotas",objTest,"notes")
    U 0 w id,!
    Q id
}

ClassMethod TestUpdate()
{
    Set id = "00002" //..TestCreate()
    Set objTest = {}
    Set objTest.title = "Title updated"
    Set objTest.detail = "Text message updated"
    Set id=##class(Firebase.RTDB).Update("appNotas","notes",id,.objTest)
    U 0 w id,!
}

ClassMethod TestDelete()
{
    Set id = "00002" //..TestCreate()
    Set res=##class(Firebase.RTDB).Delete("appNotas","notes",id)
    U 0 w res,!
}

ClassMethod TestDeleteNode()
{
    Set res=##class(Firebase.RTDB).Delete("appNotas","notes")
    U 0 w res,!
}

ClassMethod TestListen()
{
    Do ##class(Firebase.RTDB).ListenTable("appNotas","notes")
}

}
