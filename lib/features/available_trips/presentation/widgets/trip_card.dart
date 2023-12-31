import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:suberjet_clean_architecture/config/locale/app_localizations.dart';

import '../../../../core/style/style_constant.dart';
import '../../../../core/widgets/dotet_line.dart';
import '../../domain/entities/available_trip_entity.dart';

class TripCard extends StatelessWidget {
  const TripCard({
    Key? key,
    required this.tripEntity,
  }) : super(key: key);
  final AvailableTripEntity tripEntity;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        elevation: 10,
        shadowColor: Colors.black,
        child: Container(
          height: 30.h,
          padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.2.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    tripEntity.date,
                    style: StyleConst.simpleText,
                  ),
                  Text(
                    tripEntity.travelTime,
                    style: StyleConst.title4,
                  ),
                  Text(
                    tripEntity.tripTakeTime,
                    style: StyleConst.simpleText,
                  ),
                  Text(
                    AppLocalizations.of(context)!.translate('arriveTime')!,
                    style: StyleConst.simpleText,
                  ),
                  Text(
                    tripEntity.arraiveTime,
                    style: StyleConst.title4,
                  ),
                ],
              ),
              CustomPaint(
                  size: const Size(1, double.infinity),
                  painter: DashedLineVerticalPainter()),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.work),
                      const SizedBox(
                        width: 5,
                      ),
                      SizedBox(
                        width: 40.w,
                        child: Text(
                          tripEntity.company,
                          style: StyleConst.title4,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        tripEntity.rate.toString(),
                        style: StyleConst.title3,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.directions_car,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        tripEntity.from,
                        style: StyleConst.title2,
                      ),
                    ],
                  ),
                  Text(
                    tripEntity.tripClass,
                    style: StyleConst.title4,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.circle_rounded,
                        color: Colors.red,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        tripEntity.to,
                        style: StyleConst.title2,
                      ),
                    ],
                  ),
                ],
              ),
              Center(
                child: Text(
                  AppLocalizations.of(context)!.translate('ReverseNow')!,
                  style:
                      StyleConst.title4.copyWith(fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
