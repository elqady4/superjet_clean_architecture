import 'package:flutter/material.dart';

import '../../../../core/style/app_colors.dart';
import '../../../../core/style/style_constant.dart';

class TripDestinationWidget extends StatelessWidget {
  const TripDestinationWidget({
    Key? key,
    required this.tripDestination,
    required this.tripDate,
  }) : super(key: key);
  final String tripDestination;
  final String tripDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.backColor,
      ),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Column(
        children: [
          Text(
            tripDestination,
            style: StyleConst.title3,
          ),
          Text(
            tripDate,
            style: StyleConst.title3,
          ),
        ],
      ),
    );
  }
}
