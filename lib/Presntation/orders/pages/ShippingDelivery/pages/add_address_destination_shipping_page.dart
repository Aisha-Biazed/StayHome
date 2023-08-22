import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/parse_route.dart';
import 'package:stay_home/Presntation/login/cubit/cubit.dart';
import 'package:stay_home/Presntation/orders/pages/ShippingDelivery/cubit/shipping_cubit.dart';
import 'package:stay_home/Presntation/orders/pages/ShippingDelivery/pages/order_review_shipping_page_2.dart';

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
  late SingleValueDropDownController _cnt;
  late SingleValueDropDownController _area;
  String? areaId;
  String? areaName;
  String? cityName;
  String? cityId;

  @override
  void initState() {
    InitialCubit.get(context).getAllCitiesWithAreasCubit();
    _cnt = SingleValueDropDownController();
    _area = SingleValueDropDownController();

    super.initState();
  }

  @override
  void dispose() {
    _cnt.dispose();
    _area.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController streetDestinationController =
        TextEditingController(text: "");
    TextEditingController detailsDestinationController =
        TextEditingController(text: "");
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
                                  fontWeight: FontWeight.w400,
                                )),
                            20.verticalSpace,
                            BlocBuilder<InitialCubit, InitialStates>(
                              builder: (context, state) {
                                if (state
                                    is GetAllCitiesWithAllCitiesSuccessState) {
                                  final cityList = state.result;
                                  cityId = cityId ?? cityList.first.id;
                                  cityName = cityName ?? cityList.first.name;
                                  return Container(
                                    decoration: ThemeHelper()
                                        .inputBoxDecorationShadow(),
                                    child: DropDownTextField(
                                      controller: _area
                                        ..setDropDown(DropDownValueModel(
                                          name:
                                              cityName ?? cityList.first.name!,
                                          value: cityId ?? cityList.first.id,
                                          toolTipMsg:
                                              "${cityId ?? cityList.first.id}",
                                        )),
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
                                        setState(() {
                                          cityId = val.value;
                                          cityName = val.name;
                                        });
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
                                    final selectedCity =
                                        cityList.firstWhereOrNull(
                                            (city) => city.id == cityId);
                                    final filteredAreas = selectedCity?.areas;
                                    areaId = areaId ?? filteredAreas!.first.id;
                                    areaName =
                                        areaName ?? filteredAreas!.first.name;
                                    return Container(
                                      decoration: ThemeHelper()
                                          .inputBoxDecorationShadow(),
                                      child: DropDownTextField(
                                        controller: _cnt
                                          ..setDropDown(DropDownValueModel(
                                            name: filteredAreas!.first.name!,
                                            value: filteredAreas.first.id,
                                          )),
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
                                          setState(() {
                                            areaId = val.value;
                                            areaName = val.Name;
                                          });
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
                                    print(areaId);
                                    ShippingCubit.get(context).setIdDestination(
                                        value: areaId.toString(),
                                        name: areaName.toString());
                                    ShippingCubit.get(context)
                                        .setDestinationStreet(
                                            value: streetDestinationController
                                                .text
                                                .toString());
                                    ShippingCubit.get(context)
                                        .setDetailsDestination(
                                            value: detailsDestinationController
                                                .text
                                                .toString());
                                    if (_formKey.currentState!.validate()) {
                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const OrderReviewShippingPage2()));
                                    }
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
