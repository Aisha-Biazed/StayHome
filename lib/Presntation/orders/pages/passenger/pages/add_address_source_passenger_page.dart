import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stay_home/Presntation/login/cubit/cubit.dart';
import 'package:stay_home/Presntation/orders/pages/passenger/cubit/passenger_cubit.dart';

import '../../../../../core/utils/theme_helper.dart';
import '../../../../../core/widgets/custom_buttons.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../login/cubit/states.dart';
import '../../../../resources/color_manager.dart';
import '../../../../resources/strings_manager.dart';

class AddAddressSourcePassengerPage extends StatefulWidget {
  const AddAddressSourcePassengerPage({Key? key}) : super(key: key);

  @override
  State<AddAddressSourcePassengerPage> createState() =>
      _AddAddressSourcePassengerPageState();
}

class _AddAddressSourcePassengerPageState
    extends State<AddAddressSourcePassengerPage> {
  final _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool checkboxValue = false;
  String dropdownValue = 'add';
  late SingleValueDropDownController _cnt;
  late MultiValueDropDownController _cntMulti;
  var areaId;
  var areaName;

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
    TextEditingController streetSourceController =
        TextEditingController(text: "");
    TextEditingController detailsSourceController =
        TextEditingController(text: "");

    InitialCubit.get(context).getAllAreasCubit();
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(25, 50, 25, 10),
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
                                  txt: AppStrings.addNewAddressSource,
                                  fontSize: 25,
                                  txtColor: ColorManager.primary,
                                  fontWeight: FontWeight.w600,
                                )),
                            20.verticalSpace,
                            RSizedBox(
                              height: 75,
                              child: Container(
                                decoration:
                                    ThemeHelper().inputBoxDecorationShadow(),
                                child: BlocBuilder<InitialCubit, InitialStates>(
                                  builder: (context, state) {
                                    if (state is GetAllAreasSuccessState) {
                                      final areaList = state.result;
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
                                                    AppStrings.theArea),
                                            clearOption: true,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Required field";
                                              } else {
                                                return null;
                                              }
                                            },
                                            dropDownItemCount: areaList.length,
                                            dropDownList: [
                                              for (final area in areaList)
                                                DropDownValueModel(
                                                  name: area.name!,
                                                  value: area.id!,
                                                  toolTipMsg: "${area.id!}",
                                                ),
                                            ],
                                            onChanged: (val) {
                                              setState(() {
                                                areaId = val.value;
                                                areaName = val.name;
                                              });
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
                            30.verticalSpace,
                            Container(
                              decoration:
                                  ThemeHelper().inputBoxDecorationShadow(),
                              child: TextFormField(
                                controller: streetSourceController,
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
                                controller: detailsSourceController,
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
                                  // print(
                                  //     InitialCubit.get(context).listOrders?[1]
                                  // );
                                  PassengerCubit.get(context).getIdSource(
                                      value: areaId.toString(),
                                      name: areaName.toString());
                                  PassengerCubit.get(context).getSourceStreet(
                                      value: streetSourceController.text
                                          .toString());
                                  PassengerCubit.get(context).getDetailsSource(
                                      value: detailsSourceController.text
                                          .toString());
                                  // InitialCubit.get(context).orderPassengerCubit(
                                  //   note: InitialCubit.get(context)
                                  //       .listOrders?[0],
                                  //   numberOfPassenger: InitialCubit.get(context)
                                  //       .listOrders?[1] as int,
                                  // );
                                  Navigator.pop(context);
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
