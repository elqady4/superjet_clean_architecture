import 'package:flutter/material.dart';

import '../../../../core/style/app_colors.dart';
import '../../../../core/style/style_constant.dart';
import '../../../../core/widgets/dotet_line.dart';

class TripDetailsWidget extends StatelessWidget {
  final List<List<String>> detailsList;

  const TripDetailsWidget({super.key, required this.detailsList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: detailsList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                detailsList[index][0],
                                style: StyleConst.title2,
                              ),
                              Text(
                                detailsList[index][1],
                                style: StyleConst.title4,
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          CircleAvatar(
                            minRadius: 7,
                            backgroundColor: pointColor(index),
                            child: iconFirstPoint(index),
                          ),
                        ],
                      ),
                      index != -1 && index + 1 != detailsList.length
                          ? Container(
                              margin: const EdgeInsets.only(right: 10),
                              width: 2,
                              height: 60,
                              child: CustomPaint(
                                painter: DashedLineVerticalPainter(),
                              ),
                            )
                          : const SizedBox(
                              height: 0,
                              width: 0,
                            ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget? iconFirstPoint(int index) => index == 0
      ? const Padding(
          padding: EdgeInsets.all(3.0),
          child: Icon(
            Icons.bus_alert_outlined,
            color: Colors.white,
            size: 20,
          ),
        )
      : null;

  Color pointColor(int index) {
    if (index == 0) {
      return AppColors.primaryColor;
    } else if (index + 1 == detailsList.length) {
      return Colors.red;
    } else {
      return Colors.amber;
    }
  }
}
