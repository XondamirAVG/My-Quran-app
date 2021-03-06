import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:quranorginapp/components/showsnackbar.dart';
import 'package:quranorginapp/cubit/login_cubit/login_cubit.dart';
import 'package:quranorginapp/cubit/login_cubit/login_state.dart';
import 'package:quranorginapp/models/size_config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
class SingUpPage extends StatelessWidget {
  const SingUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
        create: (_) => LoginCubit(),
        child: BlocConsumer<LoginCubit, LoginState>(listener: (context, state) {
          if (state is LoginErorr) {
            showMySnackBar(
                context: context, content: "SignUp Xato", color: Colors.red);
          } else if (state is LoginComplete) {
            showMySnackBar(
                context: context,
                content: "SignUp Muvaffaqiyatli !",
                color: Colors.green);
          }
        }, builder: (context, state) {
          if (state is LoginLoading) {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            );
          } else if (state is LoginInitial) {
            return myScaffold(context);
          } else if (state is LoginComplete) {
            return Scaffold();
          } else {
            return myScaffold(context);
          }
        }));
  }
}

Scaffold myScaffold(BuildContext context) {
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
              child: Image.asset("assets/images/masjid1.png", fit: BoxFit.fill),
            ),
            Padding(
              padding: EdgeInsets.only(top: getHeight(522.0)),
              child: Container(
                height: getHeight(290.0),
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
                          LocaleKeys.reg_text.tr(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24.0),
                        ),
                      ],
                    ),
                    Form(
                        key: context.watch<LoginCubit>().formkey,
                        child: Column(
                          children: [
                            TextFormField(
                             style: TextStyle(color: Colors.black),
                              cursorColor: Colors.black,
                               decoration: InputDecoration(
                               hintText: LocaleKeys.em_text.tr(),
                               focusColor: Colors.blue,
                             hintStyle: TextStyle(color: Colors.black),
                              ),
                              controller:
                                  context.watch<LoginCubit>().emailController,
                            ),
                            TextFormField(
                               style: TextStyle(color: Colors.black),
                              cursorColor: Colors.black,
                               decoration: InputDecoration(
                                 focusColor: Colors.blue,
                                  hintStyle: TextStyle(color: Colors.black),
                               hintText: LocaleKeys.pass_text.tr(),
                              ),
                              controller: context
                                  .watch<LoginCubit>()
                                  .passwordController,
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
                              child: Text("Sign Up",style: TextStyle(color: Colors.black),),
                              onPressed: () {
                                context.read<LoginCubit>().singUp(context);
                              },
                            )
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
