import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stay_home/Presntation/login/cubit/cubit.dart';
import 'package:stay_home/Presntation/orders/pages/ShippingDelivery/cubit/shipping_cubit.dart';

import '../../../../../core/utils/theme_helper.dart';
import '../../../../../core/widgets/custom_buttons.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../login/cubit/states.dart';
import '../../../../resources/color_manager.dart';
import '../../../../resources/routes_manager.dart';
import '../../../../resources/strings_manager.dart';

class AddAddressDestinationShippingPage extends StatefulWidget {
  const AddAddressDestinationShippingPage({Key? key}) : super(key: key);

  @override
  State<AddAddressDestinationShippingPage> createState() =>
      _AddAddressDestinationShippingPageState();
}

class _AddAddressDestinationShippingPageState
    extends State<AddAddressDestinationShippingPage> {
  final _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool checkboxValue = false;
  String dropdownValue = 'add';
  late SingleValueDropDownController _cnt;
  late SingleValueDropDownController _area;
  late MultiValueDropDownController _cntMulti;
  var cityId;
  var areaId;
  var destinationId;
  var destinationName;

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
    TextEditingController streetDestinationController =
        TextEditingController(text: "");
    TextEditingController detailsDestinationController =
        TextEditingController(text: "");
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
                                        cityId = val.value;
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
                                          destinationId = val.value;
                                          destinationName = val.name;
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
                                controller: streetDestinationController,
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
                                controller: detailsDestinationController,
                                decoration: ThemeHelper().textInputDecoration(
                                  AppStrings.addDetails,
                                ),
                              ),
                            ),
                            Container(
                                margin: REdgeInsetsDirectional.only(
                                    end: 25, start: 25, top: 210),
                                padding: REdgeInsetsDirectional.only(
                                  end: 10,
                                  start: 10,
                                ),
                                decoration:
                                    ThemeHelper().buttonBoxDecoration(context),
                                child: CustomGeneralButton(
                                  text: AppStrings.save,
                                  onTap: () {
                                    print(destinationId);
                                    ShippingCubit.get(context).getIdDestination(
                                        value: destinationId.toString(),
                                        name: destinationName.toString());
                                    ShippingCubit.get(context)
                                        .getDestinationStreet(
                                            value: streetDestinationController
                                                .text
                                                .toString());
                                    ShippingCubit.get(context)
                                        .getDetailsDestination(
                                            value: detailsDestinationController
                                                .text
                                                .toString());
                                    Navigator.pop(
                                        context, Routes.reviewShippingRoute_1);
                                  },
                                )),
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
