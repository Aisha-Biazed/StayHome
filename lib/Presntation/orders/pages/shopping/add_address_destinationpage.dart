import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stay_home/Presntation/login/cubit/cubit.dart';

import '../../../../core/utils/theme_helper.dart';
import '../../../../core/widgets/custom_buttons.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../login/cubit/states.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/routes_manager.dart';
import '../../../resources/strings_manager.dart';

class AddAddressDestinationPage extends StatefulWidget {
  const AddAddressDestinationPage({Key? key}) : super(key: key);

  @override
  State<AddAddressDestinationPage> createState() =>
      _AddAddressDestinationPageState();
}

class _AddAddressDestinationPageState extends State<AddAddressDestinationPage> {
  final _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool checkboxValue = false;
  String dropdownValue = 'add';
  late SingleValueDropDownController _cnt;
  late SingleValueDropDownController _area;
  late MultiValueDropDownController _cntMulti;
  var cityId;
  var areaId;

  @override
  void initState() {
    _cnt = SingleValueDropDownController();
    _area = SingleValueDropDownController();
    _cntMulti = MultiValueDropDownController();
    super.initState();
  }

  @override
  void dispose() {
    _cnt.dispose();
    _area.dispose();
    _cntMulti.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    InitialCubit.get(context).getAllCitiesWithAreasCubit();
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(25, 30, 25, 10),
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Container(
                                margin: REdgeInsetsDirectional.only(
                                    top: 100, start: 0, end: 10, bottom: 10),
                                padding: REdgeInsetsDirectional.only(
                                    top: 0, start: 10, end: 0, bottom: 0),
                                alignment: Alignment.center,
                                child: CustomText(
                                  txt: AppStrings.addNewAddressDestination,
                                  fontSize: 25,
                                  txtColor: ColorManager.primary,
                                  fontWeight: FontWeight.w600,
                                )),
                            20.verticalSpace,
                            BlocBuilder<InitialCubit, InitialStates>(
                              builder: (context, state) {
                                if (state
                                    is GetAllCitiesWithAllCitiesSuccessState) {
                                  final cityList = state.result;
                                  return Container(
                                    decoration: ThemeHelper()
                                        .inputBoxDecorationShadow(),
                                    child: DropDownTextField(
                                      controller: _area,
                                      searchDecoration: const InputDecoration(),
                                      textFieldDecoration: ThemeHelper()
                                          .textInputDecoration(
                                              AppStrings.theTown),
                                      clearOption: true,
                                      validator: (value) {
                                        if (value == null) {
                                          return "Required field";
                                        } else {
                                          return null;
                                        }
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
                                        cityId = val
                                            .value; // تخزين قيمة المدينة المختارة في المتغير
                                      },
                                    ),
                                  );
                                } else {
                                  return CircularProgressIndicator(
                                    color: ColorManager.primary,
                                  );
                                }
                              },
                            ),
                            20.verticalSpace,
                            BlocBuilder<InitialCubit, InitialStates>(
                              builder: (context, state) {
                                if (state
                                    is GetAllCitiesWithAllCitiesSuccessState) {
                                  final cityList = state.result;
                                  if (cityId == null) {
                                    return const SizedBox.shrink();
                                  } else {
                                    final selectedCity = cityList.firstWhere(
                                        (city) => city.id == cityId);
                                    final filteredAreas = selectedCity.areas;
                                    return Container(
                                      decoration: ThemeHelper()
                                          .inputBoxDecorationShadow(),
                                      child: DropDownTextField(
                                        controller: _cnt,
                                        searchDecoration:
                                            const InputDecoration(),
                                        textFieldDecoration: ThemeHelper()
                                            .textInputDecoration(
                                                AppStrings.theArea),
                                        clearOption: true,
                                        validator: (value) {
                                          if (value == null) {
                                            return "Required field";
                                          } else {
                                            return null;
                                          }
                                        },
                                        dropDownItemCount: filteredAreas.length,
                                        dropDownList: [
                                          for (final area in filteredAreas)
                                            DropDownValueModel(
                                              name: area.name!,
                                              value: area.id,
                                            ),
                                        ],
                                        onChanged: (val) {
                                          cityId = val.value;
                                        },
                                      ),
                                    );
                                  }
                                } else {
                                  return CircularProgressIndicator(
                                    color: ColorManager.primary,
                                  );
                                }
                              },
                            ),
                            30.verticalSpace,
                            Container(
                              decoration:
                                  ThemeHelper().inputBoxDecorationShadow(),
                              child: TextFormField(
                                decoration: ThemeHelper().textInputDecoration(
                                  AppStrings.theStreet,
                                ),
                              ),
                            ),
                            30.verticalSpace,
                            Container(
                              decoration:
                                  ThemeHelper().inputBoxDecorationShadow(),
                              child: TextFormField(
                                obscureText: true,
                                decoration: ThemeHelper().textInputDecoration(
                                  AppStrings.addDetails,
                                ),
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Please enter your password";
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Container(
                              margin: REdgeInsetsDirectional.only(
                                end: 25,
                                top: 230,
                                start: 25,
                              ),
                              padding: REdgeInsetsDirectional.only(
                                  end: 10, top: 0, start: 10, bottom: 0),
                              decoration:
                                  ThemeHelper().buttonBoxDecoration(context),
                              child: CustomGeneralButton(
                                text: AppStrings.save,
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, Routes.addressSourceRoute);
                                },
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
          ),
        ));
  }
}
