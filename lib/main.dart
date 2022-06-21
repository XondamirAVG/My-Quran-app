import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quranorginapp/cubit/cubit_theme/theme_cubit.dart';
import 'package:quranorginapp/screens/home_page.dart';
import 'package:quranorginapp/screens/sign_login_page.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
Future<void>main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  final storage = await HydratedStorage.build(
  storageDirectory: await getApplicationDocumentsDirectory(),

);
  HydratedBlocOverrides.runZoned(
  () => runApp(MyApp()),
  storage: storage,
);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool exp = false;
   if(GetStorage().hasData('token')){
     String youreToken = GetStorage().read('token');
     Map<String,dynamic>decodedToken = JwtDecoder.decode(youreToken);
     bool isExpired = JwtDecoder.isExpired(youreToken);
     exp = isExpired;
      print(exp);
       }else {
         exp = true;
          print(exp);
       }
    return BlocProvider<ThemeCubit>(
      create: (_) =>ThemeCubit(),
      child: BlocBuilder<ThemeCubit,bool>(
        builder: (context,state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            themeMode: state ? ThemeMode.dark : ThemeMode.light,
            darkTheme: ThemeData.dark(),
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: exp ? SingLoginPage() : HomePageView(onTab: false,),
          );
        }
      ),
    );
  }
}
