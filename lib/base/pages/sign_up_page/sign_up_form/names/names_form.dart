import 'package:flutter/material.dart';
import 'package:flutterdemo/base/color.dart';
import 'package:flutterdemo/base/route.dart';
import 'package:flutterdemo/base/size.dart';
import 'package:flutterdemo/base/style.dart';
import 'package:flutterdemo/widgets/curstom_button.dart';

class NamesForm extends StatefulWidget {
  const NamesForm({super.key});

  @override
  State<NamesForm> createState() => _NamesFormState();
}

class _NamesFormState extends State<NamesForm> {
  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  FocusNode fNameFocusNode = FocusNode();
  FocusNode lNameFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: AppSize.getWidth(context, 8)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome!',
                style: TextStyle(
                    fontSize: AppSize.getFontSize(context, 40),
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: AppSize.getHeight(context, 16),
              ),
              Text(
                "Let's take a few moments to set up your profile",
                style: TextStyle(fontSize: AppSize.getFontSize(context, 16)),
              ),
              SizedBox(
                height: AppSize.getHeight(context, 16),
              ),
              Text(
                "Enter your first and last name:",
                style: TextStyle(
                    fontSize: AppSize.getFontSize(context, 21),
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: AppSize.getHeight(context, 16),
              ),
              SizedBox(
                width: AppSize.getWidth(context, 300),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value != fNameController.text) {
                      return "Please confirm your password";
                    }
                    return null;
                  },
                  controller: fNameController,
                  focusNode: fNameFocusNode,
                  decoration:
                      textFieldStyle("First name...", color: AppColor.gray),
                  onEditingComplete: () {
                    FocusScope.of(context).requestFocus(lNameFocusNode);
                  },
                ),
              ),
              SizedBox(
                height: AppSize.getHeight(context, 16),
              ),
              SizedBox(
                width: AppSize.getWidth(context, 300),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value != lNameController.text) {
                      return "Please confirm your password";
                    }
                    return null;
                  },
                  controller: lNameController,
                  focusNode: lNameFocusNode,
                  decoration:
                      textFieldStyle("Last name...", color: AppColor.gray),
                  onEditingComplete: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: AppSize.getHeight(context, 16)),
          child: CustomButton(
            onClick: () {
              if (lNameController.text.length > 0 &&
                  fNameController.text.length > 0) {
                print('Hello Cruise');
                Navigator.pushNamed(context, RoutesName.signupProfilePhotoForm);
              }
            },
            text: 'Next',
            width: 275,
            height: 48,
            color: (lNameController.text.length > 0 &&
                    fNameController.text.length > 0)
                ? AppColor.buttonBlue
                : AppColor.gray,
          ),
        )
      ],
    );
  }
}
