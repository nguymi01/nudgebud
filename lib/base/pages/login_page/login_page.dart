import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/base/color.dart';
import 'package:flutterdemo/base/route.dart';
import 'package:flutterdemo/base/size.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: AppSize.getHeight(context, 64)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              children: [
                const Positioned(
                  top: 40,
                  left: 8,
                  child: Image(
                    image: AssetImage('assets/rainbow.png'),
                  ),
                ),
                Center(
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: AppSize.getWidth(context, 24)),
                    child: const Image(
                      image: AssetImage('assets/NudgeBudBadge 1.png'),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RoutesName.loginView);
                  },
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
                SizedBox(
                  height: AppSize.getHeight(context, 8),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RoutesName.signUpPage);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      border: Border.all(color: AppColor.blue),
                      borderRadius: const BorderRadius.all(
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
                              'Register',
                              style: TextStyle(
                                  fontSize: AppSize.getFontSize(context, 19),
                                  color: AppColor.black,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppSize.getHeight(context, 32),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
