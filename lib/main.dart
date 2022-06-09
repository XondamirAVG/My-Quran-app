import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quranorginapp/screens/home_page.dart';
import 'package:quranorginapp/screens/sign_login_page.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String youreToken = GetStorage().read('token');
     Map<String,dynamic>decodedToken = JwtDecoder.decode(youreToken);
     bool isExpired = JwtDecoder.isExpired(youreToken);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: isExpired ? SingLoginPage() : HomePageView(onTab: false,),
    );
  }
}
