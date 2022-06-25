import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:quranorginapp/cubit/cubit_theme/theme_cubit.dart';
import 'package:quranorginapp/models/size_config.dart';
import 'package:quranorginapp/screens/sign_login_page.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

String youreToken = GetStorage().read('token');
DateTime expirationDate = JwtDecoder.getExpirationDate(youreToken);
String gmail = GetStorage().read('gmail');
int? group ;
bool _value2 = false;
class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: getHeight(56.0),
        ),
        Row(
          children: [
            SizedBox(
              width: getWidth(7.0),
            ),
            InkWell(
              child: Icon(Icons.arrow_left_sharp,color: Colors.blue.shade400),
              onTap:(){
                Navigator.pop(context);
              }
            ),
            SizedBox(
              width: getWidth(5.0),
            ),
            InkWell(
              child: Text(
                LocaleKeys.bc_text.tr(),
                style: TextStyle(fontSize: 14.0,color: Colors.blue.shade400),
              ),
                onTap:(){
                Navigator.pop(context);
              }
            ),
            SizedBox(
              width: getWidth(80.0),
            ),
            Text(
              LocaleKeys.profil_text.tr(),
              style: TextStyle(fontSize: 17.0),
            ),
            SizedBox(
              width: getWidth(70.0),
            ),
            InkWell(
              child: Text(
                LocaleKeys.log_out_text.tr(),
                style: TextStyle(fontSize: 13.0,color: Colors.blue.shade400),
              ),
              onTap: () {
                setState(() {
                    GetStorage().remove(
                  'token',
                );
                 GetStorage().remove(
                  'gmail',
                );
                });
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SingLoginPage()));
              },
            ),
          ],
        ),
        SizedBox(
          height: getHeight(38.0),
        ),
        ListTile(
          trailing: Icon(Icons.auto_fix_high),
          title: Text('$gmail'),
          leading: CircleAvatar(
              child: Image.network(
                  "https://th.bing.com/th/id/R.87268fedb2e00fe4f1f86c13b85173c9?rik=iD71tTbmdyB5gw&riu=http%3a%2f%2fcdn.onlinewebfonts.com%2fsvg%2fimg_243887.png&ehk=%2bnbZwHeUR367MhgZ3EBB3OC1izT81pse1uNe%2bvi01EA%3d&risl=&pid=ImgRaw&r=0"),
              radius: 52),
          subtitle: Text("$expirationDate"),
        ),
        SizedBox(
          height: getHeight(36.0),
        ),
        Row(
          children: [
            SizedBox(
              width: getWidth(16.0),
            ),
            Text(
              LocaleKeys.edit_text.tr(),
              style: TextStyle(fontSize: 13.0, color: Colors.grey.shade300),
            ),
          ],
        ),
        SizedBox(
          height: getHeight(14.67),
        ),
        Row(
          children: [
            SizedBox(
              width: getWidth(17.67),
            ),
            Radio(
                value: 1,
                groupValue: group,
                onChanged: (int? T) {
                  setState(() async{
                   group = T!;
                   await context.setLocale(Locale('en'));
                   if(LocaleKeys.bc_text.tr() == "Back"){
                    group = 1;
                   }else if (group == null){
                     group = 1;
                   }
                   else {
                     print("ohsamadi:(1");
                   }
                  });
                }),
                SizedBox(width: getWidth(7.67),),
                Text("English",style: TextStyle(fontSize: 17.0),),
                SizedBox(width: getWidth(86.67),),
                 Radio(
                value: 2,
                groupValue: group,
                onChanged: (int? T) {
                  setState(()async {
                       group = T!;
                     await context.setLocale(Locale('tr'));
                        if(LocaleKeys.bc_text.tr() == "Geri"){
                    group = 2;
                   }
                   else if (group == null){
                     group = 1;
                   }else {
                     print("ohsamadi:(2");
                   }
                  });
                }),
                SizedBox(width: getWidth(7.67),),
                Text("Turkish",style: TextStyle(fontSize: 17.0),),
          ],
        ),
        SizedBox(height: getHeight(16.33),),
          Row(
          children: [
            SizedBox(
              width: getWidth(17.67),
            ),
            Radio(
                value: 3,
                groupValue: group,
                onChanged: (int? T) {
                  setState(()async {
                        group = T!;
                     await context.setLocale(Locale('ru'));
                      if(LocaleKeys.bc_text.tr() == "Назад"){
                    group = 3;
                   }else if (group == null){
                     group = 1;
                   }else {
                     print("ohsamadi:(3");
                   }
                  });
                }),
                SizedBox(width: getWidth(7.67),),
                Text("Russian",style: TextStyle(fontSize: 17.0),),
                SizedBox(width: getWidth(81.67),),
                 Radio(
                value: 4,
                groupValue: group,
                onChanged: (int? T) {
                   setState(()async {
                       group = T!;
                     await context.setLocale(Locale('uz'));
                         if(LocaleKeys.bc_text.tr() == "Orqaga"){
                    group = 4;
                   }else if (group == null){
                     group = 1;
                   }else {
                     print("ohsamadi:(4");
                   }
                  });
                }),
                SizedBox(width: getWidth(7.67),),
                Text("Uzbek",style: TextStyle(fontSize: 17.0),),
          ],
        ),
        Divider(indent: 10,endIndent: 10),
        SizedBox(height: getHeight(25.0),),
        Row(
          children: [
            SizedBox(width: getWidth(16.0),),
            Text(LocaleKeys.dark_text.tr(),style: TextStyle(fontSize: 17.0),),
            SizedBox(width: getWidth(170.0),),
            BlocBuilder<ThemeCubit,bool>(
              builder: ((context, state){
                return Switch.adaptive(
                  value: state,
                  onChanged: (value11) {
                  BlocProvider.of<ThemeCubit>(context).toggleTheme(value: value11); 
                  },
                );
              }),
            ),
          ],
        ),
            Divider(indent: 10,endIndent: 10),
               SizedBox(height: getHeight(20.0),),
               Row(
                 children: [
                   SizedBox(width: getWidth(16.0),),
                   Text("Support",style: TextStyle(fontSize: 13),),
                 ],
               ),
               SizedBox(height: getHeight(13.5),),
               Row(
                 children: [
                   SizedBox(width: getWidth(18.5),),
                   Icon(Icons.phone),
                   SizedBox(width: getWidth(12.5),),
                   Text("+998 71 221-20-20",style: TextStyle(fontSize: 17.0),)
                 ],
               ),
      ],
    ));
  }
}
