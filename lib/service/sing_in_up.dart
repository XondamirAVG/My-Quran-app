import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:quranorginapp/components/url_adaptive.dart';
import 'package:get_storage/get_storage.dart';
class SignInUp{
  static Future singIn(String identifier,String password)async{
   try {
      Response res = await Dio().post(ipAdress,
    data: {
    "identifier":identifier,
    "password": password,
}
    );
    GetStorage().write('token', res.data['jwt']);
    if(res.statusCode == 400){
      print("Hello");
    }
     return true;
   }catch(e){
    print("Xato $e!");
     return false;
   }
  }
   static Future singUp(String identifier,String password)async{
   try {
      Response res = await Dio().post(ipAdress2,
    data: {
    "email":identifier,
    "username": identifier,
    "password": password,
}
    );
    GetStorage().write('token', res.data['jwt']);
    if(res.statusCode == 400){
      print("Hello");
    }
     return true;
   }catch(e){
    print("Xato $e!");
     return false;
   }
  }
}