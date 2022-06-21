import 'package:flutter/material.dart';
import 'package:quranorginapp/components/showsnackbar.dart';
import 'package:quranorginapp/cubit/login_cubit/login_cubit.dart';
import 'package:quranorginapp/cubit/login_cubit/login_state.dart';
import 'package:quranorginapp/models/size_config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
        create: (_) => LoginCubit(),
        child: BlocConsumer<LoginCubit, LoginState>(listener: (context, state) {
          if (state is LoginErorr) {
            showMySnackBar(
                context: context, content: "Login Xato", color: Colors.red);
          } else if (state is LoginComplete) {
            showMySnackBar(
                context: context,
                content: "Login Muvaffaqiyatli !",
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
              padding: EdgeInsets.only(top: getHeight(493.0)),
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
                          "Login",
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
                              decoration: InputDecoration(
                                focusColor: Colors.blue,
                               hintText: "Email",
                                hintStyle: TextStyle(color: Colors.black),
                              ),
                              controller:
                                  context.watch<LoginCubit>().emailController,
                            ),
                            TextFormField(    
                               style: TextStyle(color: Colors.black),   
                               decoration: InputDecoration(
                                 focusColor: Colors.blue,
                               hintText: "Password",
                                hintStyle: TextStyle(color: Colors.black),
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
                              child: Text("Sing In"),
                              onPressed: () {
                                context.read<LoginCubit>().signIn(context);
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
