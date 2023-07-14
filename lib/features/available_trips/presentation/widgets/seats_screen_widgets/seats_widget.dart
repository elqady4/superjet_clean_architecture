import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:suberjet_clean_architecture/core/style/app_colors.dart';
import 'package:suberjet_clean_architecture/core/utils/app_strings.dart';

import '../../../../../core/style/style_constant.dart';
import '../../../../../core/widgets/dotet_line.dart';

class SeatsWidget extends StatefulWidget {
  final List<bool> booked;
  final double ticketPrice;

  const SeatsWidget(
      {super.key, required this.booked, required this.ticketPrice});

  @override
  _SeatsWidgetState createState() => _SeatsWidgetState();
}

class _SeatsWidgetState extends State<SeatsWidget> {
  List<bool> selectedSeats = List.generate(49, (index) => false);
  List<int> onClickSelectedSeats = [];
  double totalTicketPrice = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 30,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.circle_rounded,
                  color: AppColors.primaryColor,
                  size: 14,
                ),
                Text(
                  AppStrings.available,
                  style: StyleConst.simpleText,
                ),
                Icon(
                  Icons.circle_rounded,
                  color: AppColors.green,
                  size: 14,
                ),
                Text(
                  AppStrings.yourChoise,
                  style: StyleConst.simpleText,
                ),
                Icon(
                  Icons.circle_rounded,
                  color: AppColors.red,
                  size: 14,
                ),
                Text(
                  AppStrings.notAvailable,
                  style: StyleConst.simpleText,
                ),
                CustomPaint(
                    size: const Size(1, double.infinity),
                    painter: DashedLineVerticalPainter()),
                GestureDetector(
                  onTap: () {
                    // Navigator.pushNamed(context, TripsStopLocationsScreen.id,
                    //     arguments: widget.tripsModel);
                  },
                  child: Text(
                    AppStrings.tripDetails,
                    style: StyleConst.title4.copyWith(
                        color: AppColors.red, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SvgPicture.asset(
                            'assets/seats/steeringwheel.svg',
                            width: 70,
                          ),
                          const Spacer(
                            flex: 1,
                          ),
                          SvgPicture.asset(
                            'assets/seats/door-exit.svg',
                            width: 70,
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        buildSeat(1, widget.booked[0]),
                        const Spacer(
                          flex: 1,
                        ),
                        buildSeat(2, widget.booked[1]),
                        const Spacer(
                          flex: 9,
                        ),
                        buildSeat(3, widget.booked[2]),
                        const Spacer(
                          flex: 1,
                        ),
                        buildSeat(4, widget.booked[3]),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        buildSeat(5, widget.booked[4]),
                        const Spacer(
                          flex: 1,
                        ),
                        buildSeat(6, widget.booked[5]),
                        const Spacer(
                          flex: 9,
                        ),
                        buildSeat(7, widget.booked[6]),
                        const Spacer(
                          flex: 1,
                        ),
                        buildSeat(8, widget.booked[7]),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        buildSeat(9, widget.booked[8]),
                        const Spacer(
                          flex: 1,
                        ),
                        buildSeat(10, widget.booked[9]),
                        const Spacer(
                          flex: 9,
                        ),
                        buildSeat(11, widget.booked[10]),
                        const Spacer(
                          flex: 1,
                        ),
                        buildSeat(12, widget.booked[11]),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        buildSeat(13, widget.booked[12]),
                        const Spacer(
                          flex: 1,
                        ),
                        buildSeat(14, widget.booked[13]),
                        const Spacer(
                          flex: 9,
                        ),
                        buildSeat(15, widget.booked[14]),
                        const Spacer(
                          flex: 1,
                        ),
                        buildSeat(16, widget.booked[15]),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        buildSeat(17, widget.booked[16]),
                        const Spacer(
                          flex: 1,
                        ),
                        buildSeat(18, widget.booked[17]),
                        const Spacer(
                          flex: 9,
                        ),
                        buildSeat(19, widget.booked[18]),
                        const Spacer(
                          flex: 1,
                        ),
                        buildSeat(20, widget.booked[19]),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        buildSeat(21, widget.booked[20]),
                        const Spacer(
                          flex: 1,
                        ),
                        buildSeat(22, widget.booked[21]),
                        const Spacer(
                          flex: 30,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        buildSeat(23, widget.booked[22]),
                        const Spacer(
                          flex: 1,
                        ),
                        buildSeat(24, widget.booked[23]),
                        const Spacer(
                          flex: 30,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        buildSeat(25, widget.booked[24]),
                        const Spacer(
                          flex: 1,
                        ),
                        buildSeat(26, widget.booked[25]),
                        const Spacer(
                          flex: 9,
                        ),
                        buildSeat(27, widget.booked[26]),
                        const Spacer(
                          flex: 1,
                        ),
                        buildSeat(28, widget.booked[27]),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        buildSeat(29, widget.booked[28]),
                        const Spacer(
                          flex: 1,
                        ),
                        buildSeat(30, widget.booked[29]),
                        const Spacer(
                          flex: 9,
                        ),
                        buildSeat(31, widget.booked[30]),
                        const Spacer(
                          flex: 1,
                        ),
                        buildSeat(32, widget.booked[31]),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        buildSeat(33, widget.booked[32]),
                        const Spacer(
                          flex: 1,
                        ),
                        buildSeat(34, widget.booked[33]),
                        const Spacer(
                          flex: 9,
                        ),
                        buildSeat(35, widget.booked[34]),
                        const Spacer(
                          flex: 1,
                        ),
                        buildSeat(36, widget.booked[35]),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        buildSeat(37, widget.booked[36]),
                        const Spacer(
                          flex: 1,
                        ),
                        buildSeat(38, widget.booked[37]),
                        const Spacer(
                          flex: 9,
                        ),
                        buildSeat(39, widget.booked[38]),
                        const Spacer(
                          flex: 1,
                        ),
                        buildSeat(40, widget.booked[39]),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        buildSeat(41, widget.booked[40]),
                        const Spacer(
                          flex: 1,
                        ),
                        buildSeat(42, widget.booked[41]),
                        const Spacer(
                          flex: 10,
                        ),
                        buildSeat(43, widget.booked[42]),
                        const Spacer(
                          flex: 1,
                        ),
                        buildSeat(44, widget.booked[43]),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        buildSeat(45, widget.booked[44]),
                        const Spacer(
                          flex: 1,
                        ),
                        buildSeat(46, widget.booked[45]),
                        const Spacer(
                          flex: 1,
                        ),
                        buildSeat(47, widget.booked[46]),
                        const Spacer(
                          flex: 1,
                        ),
                        buildSeat(48, widget.booked[47]),
                        const Spacer(
                          flex: 1,
                        ),
                        buildSeat(49, widget.booked[48]),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
              height: 100,
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${widget.ticketPrice} ${AppStrings.egPound}',
                        style: StyleConst.title3,
                      ),
                      Text(
                        AppStrings.everyticket,
                        style: StyleConst.title3,
                      ),
                    ],
                  ),
                  CustomPaint(
                      size: const Size(1, double.infinity),
                      painter: DashedLineVerticalPainter()),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        onClickSelectedSeats.length.toString(),
                        style: StyleConst.title3,
                      ),
                      Text(
                        AppStrings.ticket,
                        style: StyleConst.title3,
                      ),
                    ],
                  ),
                  CustomPaint(
                      size: const Size(1, double.infinity),
                      painter: DashedLineVerticalPainter()),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '$totalTicketPrice ${AppStrings.egPound}',
                        style: StyleConst.title3.copyWith(color: AppColors.red),
                      ),
                      Text(
                        AppStrings.total,
                        style: StyleConst.title3.copyWith(color: AppColors.red),
                      ),
                    ],
                  ),
                  CustomPaint(
                      size: const Size(1, double.infinity),
                      painter: DashedLineVerticalPainter()),
                  ElevatedButton(
                    onPressed: () {
                      onClickSelectedSeats = [];
                      for (int i = 0; i < selectedSeats.length; i++) {
                        if (selectedSeats[i]) {
                          onClickSelectedSeats.add(i + 1);
                        }
                      }
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                              AppStrings.seatsWillReserved,
                              style: StyleConst.title2,
                            ),
                            content: Text(
                              onClickSelectedSeats.join(' - '),
                              style: StyleConst.title3
                                  .copyWith(color: Colors.blueGrey),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  AppStrings.ok,
                                  style: StyleConst.title2,
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        AppStrings.getNow,
                        style:
                            StyleConst.title2.copyWith(color: AppColors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildSeat(int seatNumber, bool enable) {
    return GestureDetector(
      onTap: enable
          ? () {
              setState(() {
                selectedSeats[seatNumber - 1] = !selectedSeats[seatNumber - 1];
                if (onClickSelectedSeats.contains(seatNumber)) {
                  onClickSelectedSeats.remove(seatNumber);
                  totalTicketPrice = totalTicketPrice - widget.ticketPrice;
                } else {
                  onClickSelectedSeats.add(seatNumber);
                  totalTicketPrice = totalTicketPrice + widget.ticketPrice;
                }
              });
            }
          : () {},
      child: Container(
        width: 60.0,
        height: 65.0,
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: enable
            ? BoxDecoration(
                color: selectedSeats[seatNumber - 1]
                    ? AppColors.lightGreen
                    : AppColors.white,
                borderRadius: BorderRadius.circular(8.0),
              )
            : BoxDecoration(
                color: AppColors.brown,
                borderRadius: BorderRadius.circular(8.0),
              ),
        child: Stack(
          children: [
            enable
                ? SvgPicture.asset(
                    'assets/seats/seat_selected.svg',
                    color: AppColors.primaryColor,
                  )
                : SvgPicture.asset(
                    'assets/seats/seat_selected.svg',
                    color: AppColors.grey,
                  ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Text(
                  seatNumber.toString(),
                  style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
