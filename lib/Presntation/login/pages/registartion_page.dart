import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stay_home/Presntation/login/cubit/cubit.dart';
import 'package:stay_home/Presntation/login/cubit/states.dart';
import 'package:stay_home/Presntation/login/widgets/header_widget.dart';
import 'package:stay_home/Presntation/resources/assets_manager.dart';
import 'package:stay_home/core/widgets/custom_buttons.dart';

import '../../../core/utils/theme_helper.dart';
import '../../../core/widgets/custom_text.dart';
import '../../home/pages/home_body_view.dart';
import '../../resources/color_manager.dart';
import '../../resources/routes_manager.dart';
import '../../resources/strings_manager.dart';

class RegisterationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegisterationPageState();
  }
}

List<String> options = ['male', 'female'];

class _RegisterationPageState extends State<RegisterationPage> {
  String gender = options[0];
  final _formKey = GlobalKey<FormState>();
  var fullNameController = TextEditingController(text: "");
  var emailController = TextEditingController(text: "");
  var passwordController = TextEditingController(text: "");
  var phoneNumberController = TextEditingController(text: "");
  var birthdateController = TextEditingController(text: "");
  var deviceTokenController = TextEditingController(text: "");
  var cityIdController = TextEditingController(text: "");
  final phoneNumberFocus = FocusNode();
  var cityId;

  late SingleValueDropDownController _cnt;
  late MultiValueDropDownController _cntMulti;

  @override
  void initState() {
    _cnt = SingleValueDropDownController();
    _cntMulti = MultiValueDropDownController();

    super.initState();
  }

  @override
  void dispose() {
    _cnt.dispose();
    _cntMulti.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    InitialCubit.get(context).getAllCitiesCubit();
    return BlocBuilder<InitialCubit, InitialStates>(
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: BlocListener<InitialCubit, InitialStates>(
            listener: (context, state) {
              if (state is CreateSuccessState) {
                Navigator.pushAndRemoveUntil(context,
                    MaterialPageRoute(builder: (BuildContext context) => const HomeBodyView()),
                        (Route<dynamic> route) => false
                );
                Navigator.pushReplacementNamed(context, Routes.homesRoute);
              }
            },
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
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        border: Border.all(
                                            width: 10, color: Colors.white),
                                        color: Colors.white,
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.black12,
                                            blurRadius: 20,
                                            offset: Offset(5, 5),
                                          ),
                                        ],
                                      ),
                                      child: gender == 'male'
                                          ? Image.asset(
                                              ImageAssets.male,
                                              fit: BoxFit.cover,
                                              width: 95,
                                              height: 95,
                                            )
                                          : Image.asset(
                                              ImageAssets.female,
                                              fit: BoxFit.cover,
                                              width: 95,
                                              height: 95,
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
                                margin:
                                    const EdgeInsets.fromLTRB(25, 10, 25, 10),
                                padding:
                                    const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                alignment: Alignment.center,
                                child: CustomText(
                                  txt: AppStrings.registerText,
                                  fontSize: 25,
                                  txtColor: ColorManager.primary,
                                  fontWeight: FontWeight.w600,
                                )),
                            RSizedBox(
                              height: 75,
                              child: Container(
                                decoration:
                                    ThemeHelper().inputBoxDecorationShadow(),
                                child: BlocBuilder<InitialCubit, InitialStates>(
                                  builder: (context, state) {
                                    if (state is GetAllCitiesSuccessState) {
                                      final cityList = state.result;
                                      return ListView.builder(
                                        itemCount: 1,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return DropDownTextField(
                                            controller: _cnt,
                                            searchDecoration:
                                                const InputDecoration(),
                                            textFieldDecoration: ThemeHelper()
                                                .textInputDecoration(
                                                    AppStrings.theTown),
                                            clearOption: true,
                                            // enableSearch: true,
                                            // dropdownColor: Colors.green,

                                            validator: (val) {
                                              if (val!.isEmpty) {
                                                return AppStrings.validateCity;
                                              }
                                              return null;
                                            },
                                            dropDownItemCount: cityList.length,
                                            dropDownList: [
                                              for (final city in cityList)
                                                DropDownValueModel(
                                                  name: city.name!,
                                                  value: city.id,
                                                  toolTipMsg: "${city.id}",
                                                ),
                                            ],
                                            onChanged: (val) {
                                              setState(() {});
                                              cityId = val.value;
                                            },
                                          );
                                        },
                                      );
                                    } else {
                                      return Center(
                                        child: CircularProgressIndicator(
                                          color: ColorManager.primary,
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ),
                            ),
                            15.verticalSpace,
                            Container(
                              decoration:
                                  ThemeHelper().inputBoxDecorationShadow(),
                              child: TextFormField(
                                keyboardType: TextInputType.name,
                                controller: fullNameController,
                                decoration: ThemeHelper().textInputDecoration(
                                  AppStrings.firstname,
                                ),
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return AppStrings.validateName;
                                  }
                                  return null;
                                },
                              ),
                            ),
                            15.verticalSpace,
                            Container(
                              decoration:
                                  ThemeHelper().inputBoxDecorationShadow(),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                controller: birthdateController,
                                decoration: ThemeHelper().textInputDecoration(
                                  AppStrings.birthDate,
                                ),
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return AppStrings.validateBirthdate;
                                  }
                                  return null;
                                },
                              ),
                            ),
                            15.verticalSpace,
                            Container(
                              decoration:
                                  ThemeHelper().inputBoxDecorationShadow(),
                              child: TextFormField(
                                controller: emailController,
                                decoration: ThemeHelper().textInputDecoration(
                                  AppStrings.usernameHint,
                                ),
                                keyboardType: TextInputType.emailAddress,
                                validator: (val) {
                                  if ((val!.isEmpty) &&
                                      !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                                          .hasMatch(val)) {
                                    return AppStrings.validateEmail;
                                  }
                                },
                              ),
                            ),
                            15.verticalSpace,
                            Container(
                              decoration:
                                  ThemeHelper().inputBoxDecorationShadow(),
                              child: TextFormField(
                                  controller: phoneNumberController,
                                  obscureText: true,
                                  maxLength: 10,
                                  decoration: ThemeHelper().textInputDecoration(
                                      AppStrings.mobileNumber,
                                      AppStrings.mobileNumber),
                                  keyboardType: TextInputType.phone,
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return AppStrings.validatePhone;
                                    }
                                    return null;
                                  }),
                            ),
                            15.verticalSpace,
                            Container(
                              decoration:
                                  ThemeHelper().inputBoxDecorationShadow(),
                              child: TextFormField(
                                controller: passwordController,
                                obscureText: true,
                                decoration: ThemeHelper().textInputDecoration(
                                  AppStrings.passwordHint,
                                ),
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return AppStrings.validatePassword;
                                  }
                                  return null;
                                },
                              ),
                            ),
                            15.verticalSpace,
                            Row(
                              children: [
                                Expanded(
                                  child: RadioListTile(
                                    activeColor: ColorManager.primary,
                                    title: const CustomText(
                                      txt: AppStrings.male,
                                      fontSize: 17,
                                    ),
                                    value: options[0],
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
                                    value: options[1],
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
                            ConditionalBuilder(
                              fallback: (BuildContext context) => Center(
                                child: CircularProgressIndicator(
                                  color: ColorManager.primary,
                                ),
                              ),
                              condition: state is! CreateLoadingState,
                              builder: (BuildContext context) => Container(
                                margin:
                                    const EdgeInsets.fromLTRB(25, 0, 25, 10),
                                padding:
                                    const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                decoration:
                                    ThemeHelper().buttonBoxDecoration(context),
                                child: CustomGeneralButton(
                                  text: AppStrings.registerBtn,
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                      InitialCubit.get(context).createUser(
                                        email: emailController.text.toString(),
                                        password:
                                            passwordController.text.toString(),
                                        fullName:
                                            fullNameController.text.toString(),
                                        phoneNumber: phoneNumberController.text
                                            .toString(),
                                        birthdate:
                                            birthdateController.text.toString(),
                                        gender: gender,
                                        cityId: cityId,
                                        context: context,
                                      );
                                    }
                                  },
                                ),
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
          ),
        );
      },
    );
  }
}
