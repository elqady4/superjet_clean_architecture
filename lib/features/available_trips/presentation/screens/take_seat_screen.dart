import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suberjet_clean_architecture/config/locale/app_localizations.dart';
import 'package:suberjet_clean_architecture/core/widgets/center_msg.dart';
import 'package:suberjet_clean_architecture/features/available_trips/presentation/cubites/available_seats/available_seats_cubit.dart';
import 'package:suberjet_clean_architecture/features/home/presentation/cubits/city_text_cubit/city_text_cubit.dart';

import '../../../../core/widgets/page_back_widget.dart';
import '../../../home/presentation/widgets/trip_destination_widget.dart';
import '../widgets/seats_screen_widgets/seats_widget.dart';

class TakeSeatScreen extends StatelessWidget {
  const TakeSeatScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:
          Scaffold(body: BlocBuilder<AvailableSeatsCubit, AvailableSeatsState>(
        builder: (context, state) {
          if (state is AvailableSeatsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AvailableSeatsLoaded) {
            List<bool> seatAvaiableList = List.filled(49, true);
            List<int> reservedSeatsIndexes =
                state.availableSeatsEntity.reservedSeats;
            for (var index in reservedSeatsIndexes) {
              seatAvaiableList[index - 1] =
                  false; // set the specified indexes to true
            }
            return Column(
              children: [
                PageBackHeaderWidget(
                    pageTitle:
                        AppLocalizations.of(context)!.translate('takeSeat')!),
                TripDestinationWidget(
                    tripDestination:
                        "${BlocProvider.of<CityTextCubit>(context).cityFrom} - ${BlocProvider.of<CityTextCubit>(context).cityTo}",
                    tripDate: BlocProvider.of<CityTextCubit>(context).date),
                Expanded(
                    child: SeatsWidget(
                  booked: seatAvaiableList,
                  ticketPrice: state.availableSeatsEntity.ticketPrice,
                  // tripsModel: _tripsModel,
                )),
              ],
            );
          } else {
            return CenterHintMsg(
              msg: AppLocalizations.of(context)!.translate('unexpectedError')!,
            );
          }
        },
      )),
    );
  }
}
