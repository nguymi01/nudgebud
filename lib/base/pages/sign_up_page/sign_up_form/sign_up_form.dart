import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterdemo/base/color.dart';
import 'package:flutterdemo/base/pages/sign_up_page/sign_up_form/gender_form/gender_form.dart';
import 'package:flutterdemo/base/pages/sign_up_page/sign_up_form/names/names_form.dart';
import 'package:flutterdemo/base/pages/sign_up_page/sign_up_form/sign_up_bloc.dart';
import 'package:flutterdemo/base/size.dart';
import 'package:flutterdemo/base/style.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  SignUpBloc bloc = SignUpBloc();

  // TextEditingController fNameController  = TextEditingController();
  // TextEditingController lNameController  = TextEditingController();
  // FocusNode fNameFocusNode = FocusNode();
  // FocusNode lNameFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      bloc: bloc,
      builder: (context, state) {
        return mainView(context);
      },
    );
  }

  Widget mainView(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColor.white,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: AppColor.blue,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: AppSize.getWidth(context, 16)),
            child: NamesForm(),
        ),
      ),
    );
  }
}
