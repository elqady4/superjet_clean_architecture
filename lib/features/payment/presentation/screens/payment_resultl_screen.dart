import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suberjet_clean_architecture/config/locale/app_localizations.dart';
import 'package:suberjet_clean_architecture/core/style/app_colors.dart';
import 'package:suberjet_clean_architecture/core/style/style_constant.dart';
import 'package:suberjet_clean_architecture/core/widgets/center_msg.dart';
import 'package:suberjet_clean_architecture/core/widgets/m_button.dart';
import 'package:suberjet_clean_architecture/features/available_trips/presentation/cubites/available_seats/available_seats_cubit.dart';
import 'package:suberjet_clean_architecture/features/available_trips/presentation/cubites/selected_seats_cubit/selected_seats_cubit.dart';
import 'package:suberjet_clean_architecture/features/home/presentation/cubits/city_text_cubit/city_text_cubit.dart';
import 'package:suberjet_clean_architecture/features/payment/domain/entities/reverse_seats_entity.dart';
import 'package:suberjet_clean_architecture/features/payment/presentation/cubites/cubit/reverse_seats_cubit.dart';
import 'package:suberjet_clean_architecture/features/payment/presentation/cubites/payment_method_cubit/payment_method_cubit.dart';

class PaymentResultScreen extends StatelessWidget {
  PaymentResultScreen({super.key, required this.isSuccess, required this.msg});
  final bool isSuccess;
  final String msg;
  ReverseSeatsEntity? reverseSeatsEntity;

  @override
  Widget build(BuildContext context) {
    reverseSeats(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            isSuccess ? Icons.check_circle : Icons.cancel,
            color: isSuccess ? AppColors.green : AppColors.red,
            size: 200,
          ),
          CenterHintMsg(msg: msg),
          isSuccess ? createTicket(context) : const SizedBox(),
          MButton(
              onTap: () {
                Navigator.pop(context);
              },
              title: AppLocalizations.of(context)!.translate('ok')!)
        ],
      ),
    );
  }

  Container createTicket(BuildContext context) {
    return Container(
      color: AppColors.backColor,
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
                      reverseSeatsEntity!.orderId.toString(),
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
                      reverseSeatsEntity!.tripId.toString(),
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
                      reverseSeatsEntity!.companyName,
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
                      reverseSeatsEntity!.cityFrom,
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
                      reverseSeatsEntity!.cityTo,
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
                      reverseSeatsEntity!.seats.toString(),
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
                      reverseSeatsEntity!.busType,
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
                      reverseSeatsEntity!.travelDate,
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
                      reverseSeatsEntity!.travelTime,
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

  void reverseSeats(BuildContext context) {
    int tripId = BlocProvider.of<AvailableSeatsCubit>(context).tripId;
    String company = BlocProvider.of<AvailableSeatsCubit>(context).company;
    String travelTime =
        BlocProvider.of<AvailableSeatsCubit>(context).travelTime;
    String busType = BlocProvider.of<AvailableSeatsCubit>(context).busType;

    String cityFrom = BlocProvider.of<CityTextCubit>(context).cityFrom;
    String cityTo = BlocProvider.of<CityTextCubit>(context).cityTo;
    String date = BlocProvider.of<CityTextCubit>(context).date;

    int orderID = BlocProvider.of<PaymentMethodCubit>(context).orderID;

    List<int> selectedSeats =
        BlocProvider.of<SelectedSeatsCubit>(context).mselectedSeats;

    reverseSeatsEntity = ReverseSeatsEntity(
        tripId: tripId,
        orderId: orderID,
        companyName: company,
        cityFrom: cityFrom,
        cityTo: cityTo,
        travelDate: date,
        travelTime: travelTime,
        busType: busType,
        seats: selectedSeats);
    BlocProvider.of<ReverseSeatsCubit>(context).reverseSeats(
        context: context, reverseSeatsEntity: reverseSeatsEntity!);
  }
}
