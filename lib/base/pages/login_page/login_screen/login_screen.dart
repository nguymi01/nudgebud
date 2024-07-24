import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterdemo/base/color.dart';
import 'package:flutterdemo/base/pages/login_page/login_screen/login_bloc.dart';
import 'package:flutterdemo/base/size.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginBloc bloc = LoginBloc();
  TextEditingController emailCon = TextEditingController();
  TextEditingController passwordCon = TextEditingController();
  FocusNode emailNode = FocusNode();
  FocusNode passNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
          if (state is LoginInitial) {
            return mainView(context);
          }
          return Container();
        });
  }

  Widget mainView(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios,
                size: AppSize.getWidth(context, 32), color: AppColor.lightBlue),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(
            top: AppSize.getHeight(context, 24),
            left: AppSize.getWidth(context, 16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome back!',
                style: TextStyle(
                    fontSize: AppSize.getFontSize(context, 22),
                    fontWeight: FontWeight.w500),
              ),
              Text(
                'Glad to see you again!',
                style: TextStyle(
                    fontSize: AppSize.getFontSize(context, 22),
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: AppSize.getHeight(context, 56),
              ),
              SizedBox(
                width: AppSize.getWidth(context, 331),
                child: TextFormField(
                  controller: emailCon,
                  focusNode: emailNode,
                  decoration: InputDecoration(
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: AppColor.buttonBlue, width: 2.0),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    fillColor: AppColor.grayTextField,
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: AppColor.gray, width: 2.0),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    labelText: 'Enter your email',
                  ),
                  onEditingComplete: () {
                    FocusScope.of(context).requestFocus(passNode);
                  },
                ),
              ),
              SizedBox(
                height: AppSize.getHeight(context, 16),
              ),
              SizedBox(
                width: AppSize.getWidth(context, 331),
                child: TextFormField(
                  controller: passwordCon,
                  obscureText: true,
                  focusNode: passNode,
                  decoration: InputDecoration(
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: AppColor.buttonBlue, width: 2.0),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    fillColor: AppColor.grayTextField,
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: AppColor.gray, width: 2.0),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    labelText: 'Enter your password',
                  ),
                  onEditingComplete: () {
                    FocusScope.of(context).requestFocus(passNode);
                  },
                ),
              ),
              SizedBox(
                height: AppSize.getHeight(context, 8),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        right: AppSize.getWidth(context, 24),
                        bottom: AppSize.getHeight(context, 48)),
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                          color: AppColor.grayFont,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
              Text(
                "By selecting \"Login\" below, I agree to the",
                style: TextStyle(fontSize: AppSize.getFontSize(context, 16)),
              ),
              Row(
                children: [
                  Text(
                    "safety guidelines ",
                    style: TextStyle(
                        fontSize: AppSize.getFontSize(context, 16),
                        color: AppColor.buttonBlue,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "and ",
                    style:
                        TextStyle(fontSize: AppSize.getFontSize(context, 16)),
                  ),
                  Text(
                    "terms and conditions",
                    style: TextStyle(
                        fontSize: AppSize.getFontSize(context, 16),
                        color: AppColor.buttonBlue,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(
                height: AppSize.getHeight(context, 32),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppColor.buttonBlue,
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  child: SizedBox(
                    width: AppSize.getWidth(context, 331),
                    height: AppSize.getHeight(context, 56),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: AppSize.getWidth(context, 16),
                          right: AppSize.getWidth(context, 16)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Login',
                            style: TextStyle(
                                fontSize: AppSize.getFontSize(context, 19),
                                color: AppColor.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
