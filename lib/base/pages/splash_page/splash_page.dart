import 'package:flutter/material.dart';
import 'package:flutterdemo/base/size.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
        ],
      ),
    );
  }
}
