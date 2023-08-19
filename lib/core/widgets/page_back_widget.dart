import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../style/style_constant.dart';

class PageBackHeaderWidget extends StatelessWidget {
  const PageBackHeaderWidget({
    Key? key,
    required this.pageTitle,
  }) : super(key: key);
  final String pageTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.chevron_left_outlined),
          iconSize: 50,
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                pageTitle,
                style: StyleConst.title2,
              ),
              Image.asset(
                'assets/home/SA.png',
                width: 35.w,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
