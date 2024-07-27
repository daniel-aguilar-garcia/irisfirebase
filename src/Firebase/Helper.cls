Class irisfirebase.src.Firebase.Helper Extends %RegisteredObject
{

ClassMethod ConfigApp(appName As %String, url As %String = "", credentialFile As %String)
{
    
    If (url '= "")
    {
        Set ^Firebase(appName,"url")=url
    }
    
    Set ^Firebase(appName,"credentialFile")=credentialFile
}

}
