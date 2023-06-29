import 'package:flutter/material.dart';
import '../utils/app_assets_strings.dart';

import '../style/style_constant.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 10),
                height: 50,
                child: Text(
                  title,
                  style: StyleConst.title2,
                ),
              ),
              Image.asset(
                AppAssetsStrings.logo,
                width: 150,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
