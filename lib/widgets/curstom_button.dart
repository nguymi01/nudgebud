import 'package:flutter/material.dart';
import 'package:flutterdemo/base/color.dart';
import 'package:flutterdemo/base/size.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text,  this.rightIcon, required this.onClick,  this.leftIcon});
  final String text;
  final Icon? rightIcon;
  final Icon? leftIcon;
  final void Function() onClick;

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onClick,
      child: Container(
        decoration: const BoxDecoration(
          color: AppColor.blue,
          borderRadius: BorderRadius.all(
            Radius.circular(32),
          ),
        ),
        child: SizedBox(
          width: AppSize.getWidth(context, 256),
          height: AppSize.getHeight(context, 46),
          child: Padding(
            padding: EdgeInsets.only(
                left: AppSize.getWidth(context, 16),
                right: AppSize.getWidth(context, 16)),
            child: Row(
              mainAxisAlignment: leftIcon!=null? MainAxisAlignment.spaceBetween:MainAxisAlignment.center,
              children: [
                if (leftIcon!=null) leftIcon!,
                Text(
                  text,
                  style: TextStyle(
                      fontSize:
                      AppSize.getFontSize(context, 19),
                      color: AppColor.white),
                ),
                if (rightIcon!=null) rightIcon!
              ],
            ),
          ),
        ),
      ),
    );
  }
}
