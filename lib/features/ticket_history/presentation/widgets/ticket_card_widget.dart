import 'package:flutter/widgets.dart';
import 'package:suberjet_clean_architecture/config/locale/app_localizations.dart';
import 'package:suberjet_clean_architecture/core/style/app_colors.dart';
import 'package:suberjet_clean_architecture/core/style/style_constant.dart';
import 'package:suberjet_clean_architecture/features/ticket_history/domain/entities/ticket_entity.dart';

class TicketCardWidget extends StatelessWidget {
  const TicketCardWidget({super.key, required this.ticketEntity});

  final TicketEntity ticketEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              blurStyle: BlurStyle.outer,
              blurRadius: 2,
              color: AppColors.barColor),
        ],
        gradient: LinearGradient(colors: [
          AppColors.barColor.withOpacity(0.1),
          AppColors.barColor.withOpacity(0.2)
        ], begin: Alignment.topCenter, end: AlignmentDirectional.bottomCenter),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: AppColors.primaryColor,
          width: 1.0,
        ),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.translate('ticket_num')!,
                      style: StyleConst.title2,
                    ),
                    Text(
                      ticketEntity.orderId,
                      style: StyleConst.title3.copyWith(color: AppColors.red),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.translate('trip_num')!,
                      style: StyleConst.title2,
                    ),
                    Text(
                      ticketEntity.tripId,
                      style: StyleConst.title3.copyWith(color: AppColors.red),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.translate('company')!,
                      style: StyleConst.title2,
                    ),
                    Text(
                      ticketEntity.company,
                      style: StyleConst.title3.copyWith(color: AppColors.red),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.translate('from')!,
                      style: StyleConst.title2,
                    ),
                    Text(
                      ticketEntity.cityfrom,
                      style: StyleConst.title3.copyWith(color: AppColors.red),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.translate('to')!,
                      style: StyleConst.title2,
                    ),
                    Text(
                      ticketEntity.cityto,
                      style: StyleConst.title3.copyWith(color: AppColors.red),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.translate('seats_num')!,
                      style: StyleConst.title2,
                    ),
                    Text(
                      ticketEntity.arraySeats,
                      style: StyleConst.title3.copyWith(color: AppColors.red),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.translate('busClass')!,
                      style: StyleConst.title2,
                    ),
                    Text(
                      ticketEntity.busType,
                      style: StyleConst.title3.copyWith(color: AppColors.red),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.translate('date')!,
                      style: StyleConst.title2,
                    ),
                    Text(
                      ticketEntity.travelDate,
                      style: StyleConst.title3.copyWith(color: AppColors.red),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.translate('time')!,
                      style: StyleConst.title2,
                    ),
                    Text(
                      ticketEntity.travelTime,
                      style: StyleConst.title3.copyWith(color: AppColors.red),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.translate('payMethod')!,
                      style: StyleConst.title2,
                    ),
                    Text(
                      ticketEntity.payMethod,
                      style: StyleConst.title3.copyWith(color: AppColors.red),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.translate('amount')!,
                      style: StyleConst.title2,
                    ),
                    Text(
                      ticketEntity.amount,
                      style: StyleConst.title3.copyWith(color: AppColors.red),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
