import 'package:flutter/material.dart';
import 'package:flutterdemo/base/route.dart';
import 'package:flutterdemo/base/size.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    _navigateToHome(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                  padding: EdgeInsets.only(left: AppSize.getWidth(context, 24)),
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

  Future<void> _navigateToHome(BuildContext context) async {
    await Future<void>.delayed(const Duration(seconds: 3));
    Navigator.pushReplacementNamed(context, RoutesName.homePage);
  }
}
