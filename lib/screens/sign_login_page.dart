import 'package:flutter/material.dart';
import 'package:quranorginapp/models/size_config.dart';
import 'package:quranorginapp/screens/login_page.dart';
import 'package:quranorginapp/screens/sign_up.dart';
import '../translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
class SingLoginPage extends StatelessWidget {
  const SingLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                width: getWidth(375.0),
                height: getHeight(586.0),
                child:
                    Image.asset("assets/images/masjid1.png", fit: BoxFit.fill),
              ),
              Padding(
                padding: EdgeInsets.only(top: getHeight(497.0)),
                child: Container(
                  height: getHeight(315.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Column(
                    children: [
                      SizedBox(
                        height: getHeight(28.0),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: getWidth(16.0),
                          ),
                          Text(
                                  LocaleKeys.log_text.tr(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16.0),
                          ),
                        ],
                      ),
                      Form(
                          child: Column(
                        children: [
                          SizedBox(
                            height: getHeight(40.0),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              maximumSize:
                                  Size(getWidth(343.0), getHeight(50.0)),
                              primary: Color(0xFFBB9D3E),
                              minimumSize:
                                  Size(getWidth(343.0), getHeight(50.0)),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0)),
                            ),
                            child: Text("Sing In"),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()));
                            },
                          ),
                          SizedBox(
                            height: getHeight(40.0),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              maximumSize:
                                  Size(getWidth(343.0), getHeight(50.0)),
                              primary: Color(0xFFBB9D3E),
                              minimumSize:
                                  Size(getWidth(343.0), getHeight(50.0)),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0)),
                            ),
                            child: Text("Sing Up"),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SingUpPage()));
                            },
                          ),
                        ],
                      ))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
