import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suberjet_clean_architecture/config/routes/routes.dart';
import 'package:suberjet_clean_architecture/features/available_trips/presentation/cubites/available_seats/available_seats_cubit.dart';
import '../../../../core/utils/app_strings.dart';
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
            const PageBackHeaderWidget(pageTitle: 'الرحلات المتاحه'),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: BlocBuilder<AvailableTripsCubit, AvailableTripsState>(
                builder: (context, state) {
                  if (state is AvailableTripsLoading) {
                    return Container();
                  } else if (state is AvailableTripsLoaded) {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.availableTripsList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, Routes.takeSeatRoute);
                              BlocProvider.of<AvailableSeatsCubit>(context)
                                  .getAvailableSeats(index);
                            },
                            child: TripCard(
                                tripEntity: state.availableTripsList[index]),
                          );
                        });
                  } else {
                    return const CenterHintMsg(msg: AppStrings.notFound);
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
