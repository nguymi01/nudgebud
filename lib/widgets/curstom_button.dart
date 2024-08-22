import 'package:flutter/material.dart';
import 'package:flutterdemo/base/color.dart';
import 'package:flutterdemo/base/size.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text,  this.rightIcon, required this.onClick,  this.leftIcon,  this.width,  this.height, this.radius,this.color});
  final String text;
  final Icon? rightIcon;
  final Icon? leftIcon;
  final double? width;
  final double? height;
  final double? radius;
  final Color? color;
  final void Function() onClick;

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onClick,
      child: Container(
        decoration:  BoxDecoration(
          color: color??AppColor.blue,
          borderRadius: BorderRadius.all(
            Radius.circular(radius??32),
          ),
        ),
        child: SizedBox(
          width: AppSize.getWidth(context, width!=null?width!:256),
          height: AppSize.getHeight(context, height!=null?height!:46),
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
