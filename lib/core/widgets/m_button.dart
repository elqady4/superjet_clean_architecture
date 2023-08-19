import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../style/style_constant.dart';

class MButton extends StatelessWidget {
  const MButton({
    Key? key,
    required this.onTap,
    required this.title,
  }) : super(key: key);
  final void Function() onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: 5.h,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.indigo, borderRadius: BorderRadius.circular(16)),
          child: Center(
            child: Text(
              title,
              style: StyleConst.title2.copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
