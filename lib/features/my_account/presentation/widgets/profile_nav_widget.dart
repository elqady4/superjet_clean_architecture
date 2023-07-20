import 'package:flutter/material.dart';
import 'package:suberjet_clean_architecture/core/style/app_colors.dart';

import '../../../../core/style/style_constant.dart';

class ProfileNavWidget extends StatelessWidget {
  const ProfileNavWidget(
      {Key? key,
      required this.icon,
      required this.title,
      this.onTap,
      this.iconNavigat})
      : super(key: key);

  final IconData icon;
  final String title;
  final void Function()? onTap;
  final IconData? iconNavigat;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.only(left: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.backColor,
          ),
          height: 65,
          child: Row(
            children: [
              const SizedBox(
                width: 5,
              ),
              Icon(
                icon,
                color: AppColors.primaryColor,
                size: 30,
              ),
              const SizedBox(
                width: 16,
              ),
              Text(
                title,
                style: StyleConst.title2,
              ),
              const Spacer(
                flex: 1,
              ),
              Icon(
                iconNavigat ?? Icons.open_in_new,
                color: AppColors.primaryColor,
                size: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
