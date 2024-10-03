import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterdemo/base/color.dart';
import 'package:flutterdemo/base/constant.dart';
import 'package:flutterdemo/base/pages/sign_up_page/sign_up_form/location/location_form_bloc.dart';
import 'package:flutterdemo/base/route.dart';
import 'package:flutterdemo/base/size.dart';
import 'package:flutterdemo/base/style.dart';
import 'package:flutterdemo/main.dart';
import 'package:flutterdemo/widgets/curstom_button.dart';

class LocationForm extends StatefulWidget {
  const LocationForm({super.key});

  @override
  State<LocationForm> createState() => _LocationFormState();
}

class _LocationFormState extends State<LocationForm> {
  LocationFormBloc bloc = LocationFormBloc();
  TextEditingController codeController = TextEditingController();
  FocusNode codeFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationFormBloc, LocationFormState>(
        bloc: bloc,
        builder: (BuildContext context, LocationFormState state) {
          if (state is LocationFormInitial) {
            return mainView(context, 'Select country');
          } else if (state is LocationFormStateDisplayCountry) {
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
                          'Location',
                          style: TextStyle(
                              fontSize: AppSize.getFontSize(context, 40),
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: AppSize.getHeight(context, 16),
                        ),
                        Text(
                          "Enter your Location:",
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
                                bloc.add(
                                    LocationFormEventSelectDate(country.name));
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
                              return null;
                            },
                            controller: codeController,
                            focusNode: codeFocusNode,
                            decoration: locationFormStyle(
                                context, "City or Zip Code",
                                color: AppColor.gray),
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
                          prefs.setString(Constant.location, country);
                          prefs.setString(Constant.city, codeController.text);
                          Navigator.pushNamed(
                              context, RoutesName.phonenNumberForm);
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
