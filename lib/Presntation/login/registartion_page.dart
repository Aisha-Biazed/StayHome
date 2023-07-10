import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stay_home/Presntation/login/cubit/cubit.dart';
import 'package:stay_home/Presntation/login/cubit/states.dart';
import 'package:stay_home/Presntation/login/widgets/header_widget.dart';
import 'package:stay_home/core/widgets/custom_buttons.dart';

import '../../common/theme_helper.dart';
import '../../core/widgets/custom_text.dart';
import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';
import '../resources/strings_manager.dart';

class RegistrationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegistrationPageState();
  }
}

class _RegistrationPageState extends State<RegistrationPage> {
  String? gender;
  // bool? check1 = false, check2 = true, check3 = false;
  final _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool checkboxValue = false;
  TextEditingController controllerDilocode = TextEditingController();
  TextEditingController controllerPhoneNumber = TextEditingController();
  final DilocodeFoucs = FocusNode();
  final PhoneNumberFoucs = FocusNode();
  @override
  Widget build(BuildContext context) {
    var fullNameController = TextEditingController(text: "");
    var emailController = TextEditingController(text: "");
    var imageUrlController = TextEditingController(text: "");
    var passwordController = TextEditingController(text: "");
    var phoneNumberController = TextEditingController(text: "");
    var birthdateController = TextEditingController(text: "");
    var deviceTokenController = TextEditingController(text: "");
    var cityIdController = TextEditingController(text: "");

    return BlocBuilder<InitialCubit, InitialStates>(
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 150,
                        child: const HeaderWidget(
                            150, false, Icons.person_add_alt_1_rounded),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(25, 50, 25, 0),
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            GestureDetector(
                              child: Stack(
                                children: [
                                  Container(
                                    padding: REdgeInsetsDirectional.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      border: Border.all(
                                          width: 5, color: Colors.white),
                                      color: Colors.white,
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 20,
                                          offset: Offset(5, 5),
                                        ),
                                      ],
                                    ),
                                    child: Icon(
                                      Icons.person,
                                      color: Colors.grey.shade300,
                                      size: 80.0,
                                    ),
                                  ),
                                  Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(80, 80, 0, 0),
                                    child: Icon(
                                      Icons.add_circle,
                                      color: Colors.grey.shade700,
                                      size: 25.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    alignment: Alignment.center,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Container(
                              margin: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              alignment: Alignment.center,
                              child: CustomText(
                                txt: AppStrings.registerText,
                                fontSize: 25,
                                txtColor: ColorManager.primary,
                                fontWeight: FontWeight.w600,
                              )),
                          Container(
                            child: TextFormField(
                              controller: fullNameController,
                              decoration: ThemeHelper().textInputDecoration(
                                AppStrings.firstname,
                              ),
                            ),
                            decoration:
                                ThemeHelper().inputBoxDecorationShadow(),
                          ),
                          30.verticalSpace,
                          Container(
                            child: TextFormField(
                              controller: birthdateController,
                              decoration: ThemeHelper().textInputDecoration(
                                AppStrings.bairthdate,
                              ),
                            ),
                            decoration:
                                ThemeHelper().inputBoxDecorationShadow(),
                          ),
                          20.verticalSpace,
                          Container(
                            child: TextFormField(
                              controller: emailController,
                              decoration: ThemeHelper().textInputDecoration(
                                AppStrings.usernameHint,
                              ),
                              keyboardType: TextInputType.emailAddress,
                              validator: (val) {
                                if (!(val!.isEmpty) &&
                                    !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                                        .hasMatch(val)) {
                                  return "Enter a valid email address";
                                }
                                return null;
                              },
                            ),
                            decoration:
                                ThemeHelper().inputBoxDecorationShadow(),
                          ),
                          20.verticalSpace,
                          Container(
                            child: TextFormField(
                              controller: phoneNumberController,
                              decoration: ThemeHelper().textInputDecoration(
                                  AppStrings.mobileNumber,
                                  AppStrings.mobileNumber),
                              keyboardType: TextInputType.phone,
                              validator: (val) {
                                if (!(val!.isEmpty) &&
                                    !RegExp(r"^(\d+)*$").hasMatch(val)) {
                                  return "Enter a valid phone number";
                                }
                                return null;
                              },
                            ),
                            decoration:
                                ThemeHelper().inputBoxDecorationShadow(),
                          ),
                          20.verticalSpace,
                          Container(
                            child: TextFormField(
                              controller: passwordController,
                              obscureText: true,
                              decoration: ThemeHelper().textInputDecoration(
                                AppStrings.passwordHint,
                              ),
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "يرجى إدخال كلمة المرور";
                                }
                                return null;
                              },
                            ),
                            decoration:
                                ThemeHelper().inputBoxDecorationShadow(),
                          ),
                          20.verticalSpace,
                          Row(
                            children: [
                              Expanded(
                                child: RadioListTile(
                                  activeColor: ColorManager.primary,
                                  title: const CustomText(
                                    txt: AppStrings.male,
                                    fontSize: 17,
                                  ),
                                  value: "male",
                                  groupValue: gender,
                                  onChanged: (value) {
                                    setState(() {
                                      gender = value.toString();
                                    });
                                  },
                                ),
                              ),
                              Expanded(
                                child: RadioListTile(
                                  activeColor: ColorManager.primary,
                                  title: const CustomText(
                                    txt: AppStrings.female,
                                    fontSize: 17,
                                  ),
                                  value: "female",
                                  groupValue: gender,
                                  onChanged: (value) {
                                    setState(() {
                                      gender = value.toString();
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            decoration:
                                ThemeHelper().buttonBoxDecoration(context),
                            child: CustomGeneralButton(
                              text: AppStrings.registerBtn,
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  print("ddddddddddddd");
                                  print(phoneNumberController.text);
                                  InitialCubit.get(context).createUser(
                                    context: context,
                                    email: emailController.text.toString(),
                                    password:
                                        passwordController.text.toString(),
                                    fullName:
                                        fullNameController.text.toString(),
                                    phoneNumber:
                                        phoneNumberController.text.toString(),
                                    birthdate:
                                        birthdateController.text.toString(),
                                    deviceToken:
                                        deviceTokenController.text.toString(),
                                    cityId: cityIdController.text.toString(),
                                    // gender: null,
                                  );
                                }
                                Navigator.pushNamed(
                                    context, Routes.profilesRoute);
                              },
                            ),
                          ),
                          Container(
                            margin: REdgeInsetsDirectional.only(
                                end: 10, top: 5, start: 10, bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomText(
                                  txt: AppStrings.emailHint,
                                  txtColor: ColorManager.dark,
                                  fontWeight: FontWeight.w500,
                                ),
                                10.horizontalSpace,
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, Routes.loginRoute);
                                  },
                                  child: CustomText(
                                    txt: AppStrings.userNameInvalid,
                                    txtColor: ColorManager.primary,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
