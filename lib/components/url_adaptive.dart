import 'dart:io';
String ipAdress =
    Platform.isAndroid ? "http://10.0.2.2:1337/api/auth/local/" : "http://localhost:1337/api/auth/local/";
    String ipAdress2 =
    Platform.isAndroid ? "http://10.0.2.2:1337/api/auth/local/register" : "http://localhost:1337/api/auth/local/register";
      String ipAdress3 =
    Platform.isAndroid ? "http://10.0.2.2:1337/api/quransdata2?populate=*" : "http://localhost:1337/api/quransdata2?populate=*";
  String ipAdress4 =
    Platform.isAndroid ? "http://10.0.2.2:1337" : "http://localhost:1337";