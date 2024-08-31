import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:flutterdemo/base/color.dart';
import 'package:flutterdemo/base/pages/sign_up_page/sign_up_form/birthday/birthday_form_bloc.dart';
import 'package:flutterdemo/base/route.dart';
import 'package:flutterdemo/base/size.dart';
import 'package:flutterdemo/widgets/curstom_button.dart';

class BirthdayForm extends StatefulWidget {
  const BirthdayForm({super.key});

  @override
  State<BirthdayForm> createState() => _BirthdayFormState();
}

class _BirthdayFormState extends State<BirthdayForm> {
  BirthdayFormBloc bloc = BirthdayFormBloc();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BirthdayFormBloc, BirthdayFormState>(
        bloc: bloc,
        builder: (BuildContext context, BirthdayFormState state) {
          if (state is BirthdayFormInitial) {
            return mainView(context, DateTime.now());
          } else if (state is BirthdayFormStateDisplayDate) {
            return mainView(context, state.date);
          }
          return Container();
        });
  }

  Widget mainView(BuildContext context, DateTime selectedDate) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        surfaceTintColor: AppColor.white,
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
          padding: EdgeInsets.symmetric(
              horizontal: AppSize.getWidth(context, 16),
              vertical: AppSize.getHeight(context, 16)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppSize.getWidth(context, 8)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Birthday',
                      style: TextStyle(
                          fontSize: AppSize.getFontSize(context, 40),
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: AppSize.getHeight(context, 16),
                    ),
                    Center(
                      child: Text(
                        "Please select your birthday. You must be over 18 years old to use this app:",
                        style: TextStyle(
                            fontSize: AppSize.getFontSize(context, 16)),
                      ),
                    ),
                    SizedBox(
                      height: AppSize.getHeight(context, 16),
                    ),
                    Center(
                      child: DatePickerWidget(
                        looping: false,
                        // default is not looping
                        firstDate: DateTime.utc(1900),

                        initialDate: DateTime.now(),
                        dateFormat: "dd/MMMM/yyyy",
                        locale: DatePicker.localeFromString('en'),
                        onChange: (DateTime newDate, _) {
                          setState(() {
                            bloc.add(BirthdayFormEventSelectDate(newDate));
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(bottom: AppSize.getHeight(context, 16)),
                child: Center(
                    child: CustomButton(
                  onClick: () {
                    Navigator.pushNamed(context, RoutesName.signupLocationForm);
                  },
                  text: 'Next',
                  width: 275,
                  height: 48,
                )),
              )
            ],
          )),
    );
  }
}
