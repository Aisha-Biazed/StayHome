import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stay_home/Presntation/login/cubit/states.dart';
import 'package:stay_home/Presntation/resources/color_manager.dart';
import 'package:stay_home/Presntation/resources/routes_manager.dart';
import 'package:stay_home/Presntation/resources/strings_manager.dart';
import 'package:stay_home/core/widgets/custom_text.dart';

import '../cubit/cubit.dart';
import 'header_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    InitialCubit.get(context).profileCubit();

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          // title: const Text('Profile Page', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
          elevation: 0.5,
          iconTheme: const IconThemeData(color: Colors.white),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[
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
              BlocBuilder<InitialCubit, InitialStates>(
                  builder: (context, state) {
                if (state is ProfileSuccessState) {
                  final item = state.result;
                  return Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.fromLTRB(25, 10, 25, 5),
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border:
                                    Border.all(width: 5, color: Colors.white),
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 20,
                                      offset: Offset(5, 5)),
                                ],
                              ),
                              child: Icon(
                                Icons.person,
                                size: 80,
                                color: Colors.grey.shade300,
                              ),
                            ),
                            20.verticalSpace,
                            CustomText(
                              txt: item.fullName,
                              txtColor: ColorManager.dark,
                              fontSize: 25.sp,
                              fontWeight: FontWeight.w700,
                            ),
                            30.verticalSpace,
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            REdgeInsetsDirectional.only(start: 30, end: 30),
                        child: Card(
                          child: Container(
                            alignment: Alignment.topRight,
                            padding:
                                REdgeInsetsDirectional.only(start: 20, end: 20),
                            child: Column(
                              children: <Widget>[
                                ...ListTile
                                    .divideTiles(color: Colors.grey, tiles: [
                                  ListTile(
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 4,
                                    ),
                                    leading: Icon(Icons.female_outlined,
                                        color: ColorManager.primary),
                                    title: const CustomText(
                                        txt: AppStrings.gender),
                                    subtitle: Text(item.gender),
                                  ),
                                  ListTile(
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 4,
                                    ),
                                    leading: Icon(Icons.email,
                                        color: ColorManager.primary),
                                    title: const CustomText(
                                        txt: AppStrings.usernameHint),
                                    subtitle: CustomText(
                                      txt: item.email,
                                    ),
                                  ),
                                  ListTile(
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 4,
                                    ),
                                    leading: Icon(Icons.phone,
                                        color: ColorManager.primary),
                                    title: const CustomText(
                                        txt: AppStrings.mobileNumber),
                                    subtitle: CustomText(
                                      txt: item.phoneNumber,
                                    ),
                                  ),
                                  ListTile(
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 4,
                                    ),
                                    leading: Icon(
                                      Icons.calendar_month_outlined,
                                      color: ColorManager.primary,
                                    ),
                                    title: const CustomText(
                                        txt: AppStrings.bairthdatehit),
                                    subtitle: CustomText(txt: item.birthDate),
                                  ),
                                ])
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(ColorManager.primary),
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
