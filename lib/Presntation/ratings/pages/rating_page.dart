import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stay_home/Presntation/login/cubit/cubit.dart';
import 'package:stay_home/Presntation/login/cubit/states.dart';
import 'package:stay_home/Presntation/ratings/pages/delivery_rating_page.dart';
import 'package:stay_home/Presntation/resources/color_manager.dart';
import 'package:stay_home/Presntation/resources/strings_manager.dart';
import 'package:stay_home/core/widgets/custom_text.dart';
import '../../resources/assets_manager.dart';
import '../widgets/custom_buttons.dart';

class RatingsPage extends StatefulWidget {
  const RatingsPage({Key? key}) : super(key: key);

  @override
  State<RatingsPage> createState() => _RatingsPageState();
}

class _RatingsPageState extends State<RatingsPage> {
  @override
  Widget build(BuildContext context) {
    var textEditingController = TextEditingController(text: "");
    int userRating = 0;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        body: BlocBuilder<InitialCubit, InitialStates>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsetsDirectional.only(
                    start: 33, end: 33, top: 70),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      ImageAssets.ratings,
                      height: 240.h,
                      width: 294.w,
                    ),
                    const CustomText(
                        txt: AppStrings.ratingsText_1,
                        fontSize: 25,
                        fontWeight: FontWeight.w400),
                    const CustomText(
                      txt: AppStrings.ratingsText_2,
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                    ),
                    20.verticalSpace,
                    RatingBar.builder(
                      textDirection: TextDirection.ltr,
                      initialRating: 1,
                      updateOnDrag: true,
                      minRating: 0,
                      direction: Axis.horizontal,
                      allowHalfRating: false,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: ColorManager.amber,
                      ),
                      unratedColor: ColorManager.purple,
                      onRatingUpdate: (rating) {
                        userRating = rating.round();
                      },
                    ),
                    20.verticalSpace,
                    TextFormField(
                        maxLines: 10,
                        controller: textEditingController,
                        textDirection: TextDirection.rtl,
                        decoration: InputDecoration(
                          border: InputBorder.none, // remove underline Ms.mish
                          hintText: AppStrings.ratingsAddComments,
                          labelText: AppStrings.ratingsAddComments,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: const BorderSide(color: Colors.grey)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide:
                                  BorderSide(color: Colors.grey.shade400)),
                        )),
                    20.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: CustomButtons(
                            text: AppStrings.ratingsBtn,
                            color: ColorManager.primary,
                            onPressed: () {
                              print(textEditingController.text);
                              print("numberStars $userRating");
                              InitialCubit.get(context).rateCubit(
                                  star: userRating,
                                  comment: textEditingController.text);
                            },
                          ),
                        ),
                        10.horizontalSpace,
                        Expanded(
                          child: CustomButtons(
                            onPressed: () {},
                            text: AppStrings.ratingBtnSkip,
                            colorText: ColorManager.primary,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
