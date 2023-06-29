import 'package:flutter/material.dart';
import 'package:suberjet_clean_architecture/core/style/app_colors.dart';

import '../../../../core/style/style_constant.dart';

class DirectionBaseWidget extends StatelessWidget {
  const DirectionBaseWidget({
    Key? key,
    required this.headerText,
    this.cityText,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  final String headerText;
  final String? cityText;
  final IconData icon;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          color: AppColors.backColor,
          child: Row(
            children: [
              Icon(
                icon,
                color: AppColors.iconsColor,
                size: 45,
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    headerText,
                    style: StyleConst.title3,
                  ),
                  Text(
                    cityText == null ? '' : cityText!,
                    style: StyleConst.title2,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
