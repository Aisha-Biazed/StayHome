import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/theme_helper.dart';
import '../../core/widgets/custom_buttons.dart';
import '../../core/widgets/custom_text.dart';
import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';
import '../resources/strings_manager.dart';

class AddAddressPage extends StatefulWidget {
  const AddAddressPage({Key? key}) : super(key: key);

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  final _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool checkboxValue = false;
  String dropdownValue = 'add';
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
                                txt: AppStrings.addNewAddress,
                                fontSize: 25,
                                txtColor: ColorManager.primary,
                                fontWeight: FontWeight.w600,
                              )),

                          20.verticalSpace,
                          DropDownTextField(
                            controller: _cnt,
                            searchDecoration: const InputDecoration(),
                            textFieldDecoration: ThemeHelper()
                                .textInputDecoration(AppStrings.theTown),
                            clearOption: true,
                            // enableSearch: true,
                            // dropdownColor: Colors.green,
                            validator: (value) {
                              if (value == null) {
                                return "Required field";
                              } else {
                                return null;
                              }
                            },
                            dropDownItemCount: 2,
                            dropDownList: const [
                              DropDownValueModel(
                                name: 'حلب',
                                value: "value1",
                              ),
                              DropDownValueModel(
                                  name: 'دمشق',
                                  value: "value2",
                                  toolTipMsg:
                                      "DropDownButton is a widget that we can use to select one unique value from a set of values")
                            ],
                            onChanged: (val) {},
                          ),
                          30.verticalSpace,
                          Container(
                            child: TextFormField(
                              decoration: ThemeHelper().textInputDecoration(
                                AppStrings.theStreet,
                              ),
                            ),
                            decoration:
                                ThemeHelper().inputBoxDecorationShadow(),
                          ),
                          20.verticalSpace,
                          Container(
                            child: TextFormField(
                              decoration: ThemeHelper().textInputDecoration(
                                AppStrings.theBuilding,
                              ),
                            ),
                            decoration:
                                ThemeHelper().inputBoxDecorationShadow(),
                          ),
                          20.verticalSpace,
                          Container(
                            child: TextFormField(
                              decoration: ThemeHelper()
                                  .textInputDecoration(AppStrings.theFloor),
                              keyboardType: TextInputType.text,
                              // validator: (val) {
                              //   if (!(val!.isEmpty) &&
                              //       !RegExp(r"^(\d+)*$").hasMatch(val)) {
                              //     return "Enter a valid phone number";
                              //   }
                              //   return null;
                              // },
                            ),
                            decoration:
                                ThemeHelper().inputBoxDecorationShadow(),
                          ),
                          20.verticalSpace,
                          Container(
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
                            decoration:
                                ThemeHelper().inputBoxDecorationShadow(),
                          ),
                          // 15.verticalSpace,
                          //    FormField<bool>(
                          //      builder: (state) {
                          //        return Column(
                          //          children: <Widget>[
                          //            Row(
                          //              children: <Widget>[
                          //                Checkbox(
                          //                    value: checkboxValue,
                          //                    onChanged: (value) {
                          //                      setState(() {
                          //                        checkboxValue = value!;
                          //                        state.didChange(value);
                          //                      });
                          //                    }),
                          //               // const Text("I accept all terms and conditions.", style: TextStyle(color: Colors.grey),),
                          //              ],
                          //            ),
                          //            Container(
                          //              child: Text(
                          //                state.errorText ?? '',
                          //                textAlign: TextAlign.right,
                          //                style: TextStyle(color: Theme.of(context).errorColor,fontSize: 12,),
                          //              ),
                          //            )
                          //          ],
                          //        );
                          //      },
                          //      validator: (value) {
                          //        if (!checkboxValue) {
                          //          return 'You need to accept terms and conditions';
                          //        } else {
                          //          return null;
                          //        }
                          //      },
                          //    ),
                          50.verticalSpace,
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
                                Navigator.pushNamed(
                                    context, Routes.orderReview3Route);
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
      ),
    );
  }
}
