import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quranorginapp/cubit/login_cubit/login_state.dart';
import 'package:quranorginapp/screens/home_page.dart';
import 'package:quranorginapp/service/sing_in_up.dart';
class LoginCubit extends Cubit<LoginState>{
  LoginCubit():super(LoginInitial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  signIn(BuildContext context)async{
    emit(LoginLoading());
   try {
      bool isSigned =
       await SignInUp.singIn(emailController.text, passwordController.text);
      if(isSigned){
         emit(LoginComplete());
       Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => HomePageView(onTab: false,)), (route) => false);
      }else {
          emit(LoginErorr());
      }
   }catch(e){
     emit(LoginErorr());
   }
  }
  singUp(BuildContext context)async{
     emit(LoginLoading());
   try {
      bool isSigned =
       await SignInUp.singUp(emailController.text, passwordController.text);
      if(isSigned){
         emit(LoginComplete());
       Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => HomePageView(onTab: false,)), (route) => false);
      }else {
          emit(LoginErorr());
      }
   }catch(e){
     emit(LoginErorr());
   }
  }
}
