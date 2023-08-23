import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stay_home/Presntation/login/cubit/states.dart';
import 'package:stay_home/Presntation/resources/color_manager.dart';
import 'package:stay_home/Presntation/resources/routes_manager.dart';
import 'package:stay_home/Presntation/resources/strings_manager.dart';
import 'package:stay_home/core/widgets/custom_text.dart';
import 'dart:ui' as ui;
import '../../../core/utils/theme_helper.dart';
import '../../../core/widgets/custom_buttons.dart';
import '../../home/pages/home_body_view.dart';
import '../../resources/assets_manager.dart';
import '../cubit/cubit.dart';
import '../widgets/header_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

List<String> options = ["Male", "Female"];

class _ProfilePageState extends State<ProfilePage> {
  String gender = "";
  final _formKey = GlobalKey<FormState>();
  var fullNameController = TextEditingController(text: "");
  var emailController = TextEditingController(text: "");
  var passwordController = TextEditingController(text: "");
  var phoneNumberController = TextEditingController(text: "");
  var birthdateController = TextEditingController(text: "");
  var deviceTokenController = TextEditingController(text: "");
  var cityIdController = TextEditingController(text: "");
  final phoneNumberFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    InitialCubit.get(context).profileCubit();
    return Directionality(
      textDirection: ui.TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          // title: const Text('Profile Page', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
          elevation: 0.5,
          iconTheme: const IconThemeData(color: Colors.white),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: <Color>[
              ColorManager.primary,
              ColorManager.primary,
              // Theme.of(context).primaryColor , Theme.of(context).accentColor
            ])),
          ),
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: 100,
                child: const HeaderWidget(100, false, Icons.house_rounded),
              ),
              BlocBuilder<InitialCubit, InitialStates>(builder: (context, state) {
                if (state is ProfileSuccessState) {
                  final item = state.result;
                  gender = item.gender;
                  fullNameController.text = item.fullName;
                  birthdateController.text = DateFormat('yyyy-MM-dd').format(DateTime.parse(item.birthDate));
                  emailController.text = item.email;
                  phoneNumberController.text = item.phoneNumber;
                  return StatefulBuilder(builder: (context, reState) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.fromLTRB(25, 10, 25, 5),
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(width: 10, color: Colors.white),
                                  color: Colors.white,
                                  boxShadow: const [
                                    BoxShadow(color: Colors.black12, blurRadius: 20, offset: Offset(5, 5)),
                                  ],
                                ),
                                child: gender == "Female"
                                    ? Image.asset(
                                        ImageAssets.female,
                                        fit: BoxFit.cover,
                                        width: 95,
                                        height: 95,
                                      ).animate().scaleXY(delay: Duration(milliseconds: 100))
                                    : Image.asset(
                                        ImageAssets.male,
                                        fit: BoxFit.cover,
                                        width: 95,
                                        height: 95,
                                      ).animate().scaleXY(delay: Duration(milliseconds: 50)),
                              ),
                              20.verticalSpace,
                            ],
                          ),
                        ),
                        Padding(
                          padding: REdgeInsetsDirectional.only(start: 0, end: 0),
                          child: Container(
                            margin: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            alignment: Alignment.center,
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  Container(
                                    decoration: ThemeHelper().inputBoxDecorationShadow(),
                                    child: TextFormField(
                                      keyboardType: TextInputType.text,
                                      controller: fullNameController,
                                      decoration: ThemeHelper().textInputDecoration(
                                        AppStrings.firstname,
                                      ),
                                      // validator: (val) {
                                      //   if (val!.isEmpty) {
                                      //     return AppStrings.validateBirthdate;
                                      //   }
                                      //   return null;
                                      // },
                                    ),
                                  ),
                                  20.verticalSpace,
                                  Container(
                                    decoration: ThemeHelper().inputBoxDecorationShadow(),
                                    child: TextFormField(
                                      keyboardType: TextInputType.text,
                                      controller: birthdateController,
                                      decoration: ThemeHelper().textInputDecoration(AppStrings.birthDate),
                                      readOnly: true,
                                      onTap: () async{
                                       final date= await showDatePicker(context: context, initialDate: DateTime(2000), firstDate: DateTime(1900), lastDate: DateTime(2100));
                                       if(date!=null) {
                                         birthdateController.text = DateFormat('yyyy-MM-dd').format(date);
                                       }else {
                                         birthdateController.text = DateFormat('yyyy-MM-dd').format(DateTime.parse(item.birthDate));
                                      }
                                       reState((){});
                                       },
                                      // validator: (val) {
                                      //   if (val!.isEmpty) {
                                      //     return AppStrings.validateBirthdate;
                                      //   }
                                      //   return null;
                                      // },
                                    ),
                                  ),
                                  20.verticalSpace,
                                  Container(
                                    decoration: ThemeHelper().inputBoxDecorationShadow(),
                                    child: TextFormField(
                                      controller: emailController,
                                      decoration: ThemeHelper().textInputDecoration(
                                        AppStrings.usernameHint,
                                      ),
                                      keyboardType: TextInputType.emailAddress,
                                    ),
                                  ),
                                  20.verticalSpace,
                                  Container(
                                    decoration: ThemeHelper().inputBoxDecorationShadow(),
                                    child: TextFormField(
                                      controller: phoneNumberController,
                                      decoration: ThemeHelper().textInputDecoration(AppStrings.mobileNumber),
                                      keyboardType: TextInputType.phone,
                                    ),
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
                                          value: options.first,
                                          groupValue: gender,
                                          onChanged: (value) {
                                            reState(() {
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
                                          value: options.last,
                                          groupValue: gender,
                                          onChanged: (value) {
                                            reState(() {
                                              gender = value.toString();
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  20.verticalSpace,
                                  ConditionalBuilder(
                                    fallback: (BuildContext context) => Center(
                                      child: CircularProgressIndicator(
                                        color: ColorManager.primary,
                                      ),
                                    ),
                                    condition: state is! ModifyProfileLoadingState,
                                    builder: (BuildContext context) => Container(
                                      margin: const EdgeInsets.fromLTRB(25, 0, 25, 10),
                                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                      decoration: ThemeHelper().buttonBoxDecoration(context),
                                      child: CustomGeneralButton(
                                        text: AppStrings.save,
                                        onTap: () {
                                          if (_formKey.currentState!.validate()) {
                                            InitialCubit.get(context).modifyProfileCubit(
                                              email: emailController.text.toString(),
                                              fullName: fullNameController.text.toString(),
                                              phoneNumber: phoneNumberController.text.toString(),
                                              birthdate: birthdateController.text.toString(),
                                              gender: gender,
                                              context: context,
                                            );
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                  8.verticalSpace,
                                  Container(
                                    margin: const EdgeInsets.fromLTRB(25, 0, 25, 10),
                                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    decoration: ThemeHelper().outlinedButtonBoxDecoration(context),
                                    child: CustomOutlinedButton(
                                      text: 'تسجيل الخروج',
                                      onTap: ()async {
                                        await (await SharedPreferences.getInstance()).clear();
                                        Navigator.pushAndRemoveUntil(context,
                                            MaterialPageRoute(builder: (BuildContext context) => const HomeBodyView()),
                                                (Route<dynamic> route) => false
                                        );
                                        Navigator.pushReplacementNamed(context, Routes.loginRoute);
                                      },
                                    ),
                                  ),                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  });
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(ColorManager.primary),
                    ),
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
