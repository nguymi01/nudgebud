import 'package:flutter/material.dart';
import 'package:flutterdemo/base/color.dart';
import 'package:flutterdemo/base/size.dart';

class PlanCard extends StatefulWidget {
  const PlanCard({super.key});

  @override
  State<PlanCard> createState() => _PlanCardState();
}

class _PlanCardState extends State<PlanCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.darkGray,
      child: SizedBox(
        height: AppSize.getHeight(context, 395),
        width: AppSize.getWidth(context, 358),
        child: Column(
          children: [
            Text(
              'This is a Widget',
              style: TextStyle(
                  fontSize: AppSize.getFontSize(context, 30),
                  color: AppColor.white,
              fontWeight: FontWeight.w700),
            ),
            const Column(
              children: [
                Row(
                  children: [Text('Saturday'), Text('Time')],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
