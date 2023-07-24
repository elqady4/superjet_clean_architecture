import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suberjet_clean_architecture/config/locale/app_localizations.dart';
import 'package:suberjet_clean_architecture/config/routes/routes.dart';
import 'package:suberjet_clean_architecture/features/available_trips/presentation/cubites/available_seats/available_seats_cubit.dart';
import 'package:suberjet_clean_architecture/features/home/presentation/cubits/city_text_cubit/city_text_cubit.dart';
import 'package:suberjet_clean_architecture/features/home/presentation/widgets/trip_destination_widget.dart';
import '../../../../core/widgets/center_msg.dart';
import '../../../../core/widgets/page_back_widget.dart';
import '../cubites/available_trips/available_trips_cubit.dart';
import '../widgets/trip_card.dart';

class AvailableTripsScreen extends StatelessWidget {
  const AvailableTripsScreen({super.key});
  static String id = 'TripsScreen';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            PageBackHeaderWidget(
                pageTitle:
                    AppLocalizations.of(context)!.translate('availableTrips')!),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: BlocBuilder<AvailableTripsCubit, AvailableTripsState>(
                builder: (context, state) {
                  if (state is AvailableTripsLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is AvailableTripsLoaded) {
                    return Column(
                      children: [
                        TripDestinationWidget(
                            tripDestination:
                                "${BlocProvider.of<CityTextCubit>(context).cityFrom} - ${BlocProvider.of<CityTextCubit>(context).cityTo}",
                            tripDate:
                                BlocProvider.of<CityTextCubit>(context).date),
                        Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: state.availableTripsList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacementNamed(
                                        context, Routes.takeSeatRoute);
                                    BlocProvider.of<AvailableSeatsCubit>(
                                            context)
                                        .getAvailableSeats(index, context);
                                    BlocProvider.of<AvailableSeatsCubit>(
                                            context)
                                        .selectedTripDetails(
                                            mTripId: state
                                                .availableTripsList[index].id,
                                            mBusType: state
                                                .availableTripsList[index]
                                                .tripClass,
                                            mCompany: state
                                                .availableTripsList[index]
                                                .company,
                                            mTravelTime: state
                                                .availableTripsList[index]
                                                .travelTime);
                                  },
                                  child: TripCard(
                                      tripEntity:
                                          state.availableTripsList[index]),
                                );
                              }),
                        ),
                      ],
                    );
                  } else {
                    return CenterHintMsg(
                        msg: AppLocalizations.of(context)!
                            .translate('notFound')!);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
