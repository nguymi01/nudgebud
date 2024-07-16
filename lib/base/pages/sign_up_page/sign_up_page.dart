import 'package:flutter/material.dart';
import 'package:flutterdemo/base/color.dart';
import 'package:flutterdemo/base/size.dart';
import 'package:flutterdemo/widgets/curstom_button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  FocusNode firstNameFocusNode = FocusNode();
  FocusNode lastNameFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  TextEditingController fNameCon = TextEditingController();
  TextEditingController lNameCon = TextEditingController();
  TextEditingController passwordCon = TextEditingController();
  TextEditingController emailCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColor.black,
                  // Border color
                  width: 2, // Border width
                ),
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: EdgeInsets.all(AppSize.getWidth(context, 8)),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.lock_outline,
                    size: AppSize.getWidth(context, 32),
                    color: AppColor.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: AppSize.getHeight(context, 10),
            ),
            Text(
              'Sign Up',
              style: TextStyle(fontSize: AppSize.getFontSize(context, 32)),
            ),
            SizedBox(
              height: AppSize.getHeight(context, 32),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: AppSize.getWidth(context, 145),
                  child: TextFormField(
                    controller: fNameCon,
                    focusNode: firstNameFocusNode,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'First Name',
                    ),
                    onEditingComplete: () {
                      FocusScope.of(context).requestFocus(lastNameFocusNode);
                    },
                  ),
                ),
                SizedBox(
                  width: AppSize.getWidth(context, 8),
                ),
                SizedBox(
                  width: AppSize.getWidth(context, 145),
                  child: TextFormField(
                    controller: lNameCon,
                    focusNode: lastNameFocusNode,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Last Name',
                    ),
                    onEditingComplete: () {
                      FocusScope.of(context).requestFocus(emailFocusNode);
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: AppSize.getHeight(context, 16),
            ),
            Center(
              child: SizedBox(
                width: AppSize.getWidth(context, 300),
                child: TextFormField(
                  controller: emailCon,
                  focusNode: emailFocusNode,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email Address',
                  ),
                  onEditingComplete: () {
                    FocusScope.of(context).requestFocus(passwordFocusNode);
                  },
                ),
              ),
            ),
            SizedBox(
              height: AppSize.getHeight(context, 16),
            ),
            SizedBox(
              width: AppSize.getWidth(context, 300),
              child: TextFormField(
                obscureText: true,
                controller: passwordCon,
                focusNode: passwordFocusNode,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
                onEditingComplete: () {
                  FocusScope.of(context).requestFocus(emailFocusNode);
                },
              ),
            ),
            SizedBox(
              height: AppSize.getHeight(context, 16),
            ),
            GestureDetector(
              onTap: (){},
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColor.black,
                  borderRadius: BorderRadius.all(
                    Radius.circular(32),
                  ),
                ),
                child: SizedBox(
                  width: AppSize.getWidth(context, 300),
                  height: AppSize.getHeight(context, 46),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: AppSize.getWidth(context, 16),
                        right: AppSize.getWidth(context, 16)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Sign Up',
                          style: TextStyle(
                              fontSize: AppSize.getFontSize(context, 19),
                              color: AppColor.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
