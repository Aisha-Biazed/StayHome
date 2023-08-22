import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stay_home/Presntation/login/cubit/cubit.dart';

import '../../../../../core/utils/theme_helper.dart';
import '../../../../../core/widgets/custom_buttons.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../login/cubit/states.dart';
import '../../../../resources/color_manager.dart';
  import '../../../../resources/strings_manager.dart';
import '../cubit/delivery_cubit.dart';
import 'order_review_delivery_page_1.dart';
import 'order_review_delivery_page_2.dart';

class AddAddressDestinationShopDeliveryPage extends StatefulWidget {
  const AddAddressDestinationShopDeliveryPage({Key? key}) : super(key: key);

  @override
  State<AddAddressDestinationShopDeliveryPage> createState() =>
      _AddAddressDestinationShopDeliveryPageState();
}

class _AddAddressDestinationShopDeliveryPageState extends State<AddAddressDestinationShopDeliveryPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController streetDestinationController = TextEditingController(text: "");
  TextEditingController detailsDestinationController = TextEditingController(text: "");
  String dropdownValue = 'add';
  late SingleValueDropDownController _cnt;
  var cityId;
  var areaId;

  @override
  void initState() {
    InitialCubit.get(context).getAllAreasCubit();
    _cnt = SingleValueDropDownController();
    super.initState();
  }

  @override
  void dispose() {
    _cnt.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                                if (state is GetAllAreasSuccessState) {
                                  final areaList = state.result;
                                  return Container(
                                    decoration: ThemeHelper().inputBoxDecorationShadow(),
                                    child: DropDownTextField(
                                      controller: _cnt
                                        ..setDropDown(DropDownValueModel(
                                          name: areaList[0].name!,
                                          value: areaList[0].id,
                                          toolTipMsg: "${areaList[0].id}",
                                        )),
                                      searchDecoration: const InputDecoration(),
                                      textFieldDecoration: ThemeHelper().textInputDecoration(AppStrings.theArea),
                                      clearOption: true,
                                      autovalidateMode: AutovalidateMode.onUserInteraction,
                                      validator: (value) {
                                        if (value == null) {
                                          return "هذا الحقل مطلوب";
                                        } else {
                                          return null;
                                        }
                                      },
                                      dropDownItemCount: areaList.length,
                                      dropDownList: [
                                        for (final area in areaList)
                                          DropDownValueModel(
                                            name: area.name!,
                                            value: area.id,
                                            toolTipMsg: "${area.id}",
                                          ),
                                      ],
                                      onChanged: (val) {
                                        areaId = val.value; // تخزين قيمة المدينة المختارة في المتغير
                                      },
                                    ),
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
                            30.verticalSpace,
                            Container(
                              decoration:
                                  ThemeHelper().inputBoxDecorationShadow(),
                              child: TextFormField(
                                controller: streetDestinationController,
                                decoration: ThemeHelper().textInputDecoration(
                                  AppStrings.theStreet,
                                ),
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "هذا الحقل مطلوب";
                                  }
                                  return null;
                                },
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
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "هذا الحقل مطلوب";
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
                                  print(_formKey.currentState?.validate());
                                  DeliveryCubit.get(context).setIdDestination(value: _cnt.dropDownValue?.value, name: _cnt.dropDownValue!.name);
                                  DeliveryCubit.get(context).setDestinationStreet(value: streetDestinationController.text);
                                  DeliveryCubit.get(context).setDetailsDestination(value: detailsDestinationController.text);
                                  if(_formKey.currentState!.validate()) {
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                    Navigator.pushReplacement(
                                        context, MaterialPageRoute(builder: (context) => const OrderReviewDeliveryPage2()));
                                  }
                                  // Navigator.pushNamed(
                                  //     context, Routes.addressSourceRoute);
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
