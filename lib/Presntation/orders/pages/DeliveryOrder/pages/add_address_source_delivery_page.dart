import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stay_home/Presntation/login/cubit/cubit.dart';
import 'package:stay_home/Presntation/orders/pages/DeliveryOrder/cubit/delivery_cubit.dart';
import 'package:stay_home/Presntation/orders/pages/DeliveryOrder/pages/add_address_destination_delivery_page.dart';
import '../../../../../core/utils/theme_helper.dart';
import '../../../../../core/widgets/custom_buttons.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../login/cubit/states.dart';
import '../../../../resources/color_manager.dart';
import '../../../../resources/strings_manager.dart';

class AddAddressSourceDeliveryPage extends StatefulWidget {
  const AddAddressSourceDeliveryPage({Key? key}) : super(key: key);

  @override
  State<AddAddressSourceDeliveryPage> createState() =>
      _AddAddressSourceDeliveryPageState();
}

class _AddAddressSourceDeliveryPageState
    extends State<AddAddressSourceDeliveryPage> {
  final _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool checkboxValue = false;
  String dropdownValue = 'add';
  TextEditingController streetSourceController =
      TextEditingController(text: "");
  TextEditingController detailsSourceController =
      TextEditingController(text: "");
  late SingleValueDropDownController _cnt;
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
            child: Container(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
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
                              txt: AppStrings.addNewAddressSource,
                              fontSize: 25,
                              txtColor: ColorManager.primary,
                              fontWeight: FontWeight.w400,
                            )),
                        50.verticalSpace,
                        BlocBuilder<InitialCubit, InitialStates>(
                          builder: (context, state) {
                            if (state is GetAllAreasSuccessState) {
                              final areaList = state.result;
                              return Container(
                                decoration:
                                    ThemeHelper().inputBoxDecorationShadow(),
                                child: DropDownTextField(
                                  controller: _cnt
                                    ..setDropDown(DropDownValueModel(
                                      name: areaList[0].name!,
                                      value: areaList[0].id,
                                      toolTipMsg: "${areaList[0].id}",
                                    )),
                                  searchDecoration: const InputDecoration(),
                                  textFieldDecoration: ThemeHelper()
                                      .textInputDecoration(AppStrings.theArea),
                                  clearOption: true,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
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
                                    areaId = val
                                        .value; // تخزين قيمة المدينة المختارة في المتغير
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
                          decoration: ThemeHelper().inputBoxDecorationShadow(),
                          child: TextFormField(
                            controller: streetSourceController,
                            decoration: ThemeHelper().textInputDecoration(
                              AppStrings.theStreet,
                            ),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
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
                          decoration: ThemeHelper().inputBoxDecorationShadow(),
                          child: TextFormField(
                            controller: detailsSourceController,
                            decoration: ThemeHelper().textInputDecoration(
                              AppStrings.addDetails,
                            ),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "هذا الحقل مطلوب";
                              }
                              return null;
                            },
                          ),
                        ),
                        70.verticalSpace,
                        Container(
                          margin: REdgeInsetsDirectional.only(
                              end: 25, top: 10, start: 25, bottom: 10),
                          padding: REdgeInsetsDirectional.only(
                              end: 10, top: 0, start: 10, bottom: 0),
                          decoration:
                              ThemeHelper().buttonBoxDecoration(context),
                          child: CustomGeneralButton(
                            text: AppStrings.save,
                            onTap: () {
                              // print(_cnt.validate());
                              DeliveryCubit.get(context).setIdSource(
                                  value: _cnt.dropDownValue?.value,
                                  name: _cnt.dropDownValue!.name);
                              DeliveryCubit.get(context).setSourceStreet(
                                  value: streetSourceController.text);
                              DeliveryCubit.get(context).setDetailsSource(
                                  value: detailsSourceController.text);
                              if (_formKey.currentState!.validate()) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const AddAddressDestinationDeliveryPage()));
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
