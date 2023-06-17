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
                              margin: const EdgeInsets.fromLTRB(25, 100, 25, 10),
                              padding: const EdgeInsets.fromLTRB(70, 0, 70, 0),
                              alignment: Alignment.center,
                              child: Row(
                                children: [
                                  Icon(Icons.add_location_alt_sharp,color:ColorManager.primary),
                                  CustomText(txt:AppStrings.addNewAddress , fontSize: 25, txtColor: ColorManager.primary,
                                    fontWeight: FontWeight.w600,),
                                ],
                              )),

                          20.verticalSpace,
                          Container(
                            child: TextFormField(
                              decoration: ThemeHelper().textInputDecoration(AppStrings.theTown,),
                            ),
                            decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          ),
                          // DropdownButtonFormField(
                          //   // decoration: InputDecoration(
                          //   //   enabledBorder: OutlineInputBorder(
                          //   //     borderSide: BorderSide(color: Colors.amberAccent, width: 2), //<-- SEE HERE
                          //   //   ),
                          //   //   focusedBorder: OutlineInputBorder(
                          //   //     borderSide: BorderSide(color: Colors.amberAccent, width: 2), //<-- SEE HERE
                          //   //   ),
                          //   //   filled: true,
                          //   //   fillColor: ColorManager.primary,
                          //   // ),
                          //   decoration: ThemeHelper().textInputDecoration(AppStrings.theTown,),
                          //   value: dropdownValue,
                          //   onChanged: (String? newValue) {
                          //     setState(() {
                          //       dropdownValue = newValue!;
                          //     });
                          //   },
                          //   items: <String>['add', 'Cat', 'Tiger', 'Lion'].map<DropdownMenuItem<String>>((String value) {
                          //     return DropdownMenuItem<String>(
                          //       value: value,
                          //       child: Text(
                          //         value,
                          //         style: TextStyle(fontSize: 20),
                          //       ),
                          //     );
                          //   }).toList(),
                          // ),
                          DropDownTextField(
                            // initialValue: "name4",
                            controller: _cnt,
                            textFieldDecoration: InputDecoration(
                              hintText: AppStrings.theTown
                            ),
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
                            dropDownItemCount: 4,

                            dropDownList: const [
                              DropDownValueModel(name: 'name1', value: "value1"),
                              DropDownValueModel(
                                  name: 'name2',
                                  value: "value2",
                                  toolTipMsg:
                                  "DropDownButton is a widget that we can use to select one unique value from a set of values"),
                              DropDownValueModel(name: 'name3', value: "value3"),
                              DropDownValueModel(
                                  name: 'name4',
                                  value: "value4",
                                  toolTipMsg:
                                  "DropDownButton is a widget that we can use to select one unique value from a set of values"),
                              DropDownValueModel(name: 'name5', value: "value5"),
                              DropDownValueModel(name: 'name6', value: "value6"),
                            ],
                            onChanged: (val) {},
                          ),
                          30.verticalSpace,
                          Container(
                            child: TextFormField(
                              decoration: ThemeHelper().textInputDecoration(AppStrings.theStreet,),
                            ),
                            decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          ),
                          20.verticalSpace,
                          Container(
                            child: TextFormField(
                              decoration: ThemeHelper().textInputDecoration(AppStrings.theBuilding,),
                            ),
                            decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          ),
                          20.verticalSpace,
                          Container(
                            child: TextFormField(
                              decoration: ThemeHelper().textInputDecoration(
                                  AppStrings.theFloor),
                              keyboardType: TextInputType.phone,
                              validator: (val) {
                                if(!(val!.isEmpty) && !RegExp(r"^(\d+)*$").hasMatch(val)){
                                  return "Enter a valid phone number";
                                }
                                return null;
                              },
                            ),
                            decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          ),
                          20.verticalSpace,
                          Container(
                            child: TextFormField(
                              obscureText: true,
                              decoration: ThemeHelper().textInputDecoration(
                                AppStrings.addDetails,),
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Please enter your password";
                                }
                                return null;
                              },
                            ),
                            decoration: ThemeHelper().inputBoxDecorationShaddow(),
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
                            margin: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            decoration: ThemeHelper().buttonBoxDecoration(context),
                            child: CustomGeneralButton(
                              text: AppStrings.save,
                              onTap: (){
                                Navigator.pushNamed(context, Routes.profilesRoute);
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
