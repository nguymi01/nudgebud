import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterdemo/base/color.dart';
import 'package:flutterdemo/base/pages/sign_up_page/sign_up_form/location/location_form_bloc.dart';
import 'package:flutterdemo/base/pages/sign_up_page/sign_up_form/phone_number/bloc/phone_number_form_bloc.dart';
import 'package:flutterdemo/base/route.dart';
import 'package:flutterdemo/base/size.dart';
import 'package:flutterdemo/base/style.dart';
import 'package:flutterdemo/widgets/curstom_button.dart';

class PhoneNumberForm extends StatefulWidget {
  const PhoneNumberForm({super.key});

  @override
  State<PhoneNumberForm> createState() => _PhoneNumberFormState();
}

class _PhoneNumberFormState extends State<PhoneNumberForm> {
  PhoneNumberFormBloc bloc = PhoneNumberFormBloc();
  TextEditingController phoneNumberController = TextEditingController();
  FocusNode phoneNumberFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhoneNumberFormBloc, PhoneNumberFormState>(
        bloc: bloc,
        builder: (BuildContext context, PhoneNumberFormState state) {
          if (state is PhoneNumberFormInitial) {
            return mainView(context, 'Select country');
          } else if (state is PhoneNumberFormStateDisplayCountry) {
            print(state.country);
            return mainView(context, state.country);
          }
          return Container();
        });
  }

  Widget mainView(BuildContext context, String country) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
            child: Form(
              key: _formKey,
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
                          'Phone Number',
                          style: TextStyle(
                              fontSize: AppSize.getFontSize(context, 40),
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: AppSize.getHeight(context, 16),
                        ),
                        Text(
                          "Confirm your phone number:",
                          style: TextStyle(
                              fontSize: AppSize.getFontSize(context, 20),
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: AppSize.getHeight(context, 16),
                        ),
                        GestureDetector(
                          onTap: () {
                            showCountryPicker(
                              showPhoneCode: false,
                              context: context,
                              onSelect: (Country country) {
                                bloc.add(PhoneNumberFormEventSelectCountry(
                                    country.name));
                              },
                              moveAlongWithKeyboard: false,
                              countryListTheme: CountryListThemeData(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(40.0),
                                  topRight: Radius.circular(40.0),
                                ),

                                // Optional. Styles the search field.
                                inputDecoration: InputDecoration(
                                  labelText: 'Search',
                                  hintText: 'Start typing to search',
                                  prefixIcon: const Icon(Icons.search),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: const Color(0xFF8C98A8)
                                          .withOpacity(0.2),
                                    ),
                                  ),
                                ),
                                // Optional. Styles the text in the search field
                                searchTextStyle: const TextStyle(
                                  color: Colors.blue,
                                  fontSize: 18,
                                ),
                              ),
                            );
                          },
                          child: SizedBox(
                            height: AppSize.getHeight(context, 64),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: AppColor.gray,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: AppSize.getWidth(context, 24),
                                    vertical: AppSize.getHeight(context, 16)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      country,
                                      style: TextStyle(
                                          fontSize:
                                              AppSize.getFontSize(context, 16)),
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_down_sharp,
                                      color: AppColor.black,
                                      size: AppSize.getWidth(context, 32),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: AppSize.getHeight(context, 16),
                        ),
                        SizedBox(
                          height: AppSize.getHeight(context, 64),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please fill this field";
                              }
                              if (!RegExp(r'^\d{3}-\d{3}-\d{4}$')
                                  .hasMatch(value)) {
                                return "Please enter a valid phone number (e.g., 717-462-7557)";
                              }
                              return null;
                            },
                            controller: phoneNumberController,
                            focusNode: phoneNumberFocusNode,
                            decoration: locationFormStyle(
                                context, "Phone Number (e.g., 717-462-7557)",
                                color: AppColor.gray),
                            keyboardType: TextInputType.phone,
                            // inputFormatters: [
                            //   FilteringTextInputFormatter.allow(RegExp(r'[\d-]')),
                            //   LengthLimitingTextInputFormatter(12),
                            // ],
                            onEditingComplete: () {
                              FocusScope.of(context).requestFocus(FocusNode());
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(bottom: AppSize.getHeight(context, 16)),
                    child: Center(
                        child: CustomButton(
                      onClick: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushNamed(
                              context, RoutesName.signupProfilePhotoForm);
                        }
                      },
                      text: 'Next',
                      width: 275,
                      height: 48,
                    )),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
