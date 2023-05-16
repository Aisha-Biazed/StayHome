import 'package:flutter/material.dart';
import 'package:stay_home/core/constants.dart';
import 'package:stay_home/core/widgets/space_widget.dart';
class PageViewItem extends StatelessWidget {
  const PageViewItem({Key? key, this.title, this.subTitle, this.image}) : super(key: key);
  final String? title;
  final String? subTitle;
  final String? image;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const VerticalSpace(10),
        SizedBox(
          height: 450,
            child: Image.asset(image!)),
        // const VerticalSpace(5),
        Text(
            title!,
          style: const TextStyle(
            fontFamily: 'Popines',
            fontSize: 25,
            fontWeight: FontWeight.w800,
            color: kMainColor
          ),
        ),
        const VerticalSpace(5),
        // Text(
        //   subTitle!,
        //   style: const TextStyle(
        //     fontSize: 15,
        //     color: Color(0xff78787c)
        //   ),
        // )
      ],
    );
  }
}
