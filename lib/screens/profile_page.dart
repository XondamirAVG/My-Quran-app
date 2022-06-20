import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:quranorginapp/models/size_config.dart';
import 'package:quranorginapp/screens/sign_login_page.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
class ProfilePage extends StatefulWidget {
  const ProfilePage({ Key? key }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}
 String youreToken = GetStorage().read('token');
   DateTime expirationDate = JwtDecoder.getExpirationDate(youreToken);
   String gmail = GetStorage().read('gmail');
class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
        SizedBox(height: getHeight(56.0),),
         Row(
           children: [
             SizedBox(width: getWidth(7.0),),
             InkWell(
               child: Icon(Icons.arrow_left_sharp),
             ),
             SizedBox(width: getWidth(5.0),),
             InkWell(
               child: Text("Back",style: TextStyle(fontSize: 17.0),),
             ),
             SizedBox(width: getWidth(80.0),),
             Text("Profil",style: TextStyle(fontSize: 17.0),),
             SizedBox(width: getWidth(90.0),),
             InkWell(child: Text("Log out",style: TextStyle(fontSize: 17.0),),onTap: (){
             GetStorage().remove('token',);
            Navigator.push(context, MaterialPageRoute(builder: (context)=>SingLoginPage()));
             },),
           ],
         ), 
         SizedBox(height: getHeight(38.0),),
         ListTile(
           trailing:Icon(Icons.auto_fix_high),
          title: Text('$gmail'),
           leading: CircleAvatar(child: Image.network("https://th.bing.com/th/id/R.87268fedb2e00fe4f1f86c13b85173c9?rik=iD71tTbmdyB5gw&riu=http%3a%2f%2fcdn.onlinewebfonts.com%2fsvg%2fimg_243887.png&ehk=%2bnbZwHeUR367MhgZ3EBB3OC1izT81pse1uNe%2bvi01EA%3d&risl=&pid=ImgRaw&r=0"),radius: 52),
           subtitle: Text("$expirationDate"),
         )
        ],
      )
    );
  }
}