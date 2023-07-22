import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:suberjet_clean_architecture/config/locale/app_localizations.dart';
import 'package:suberjet_clean_architecture/config/routes/routes.dart';

import '../../../../core/utils/app_assets_strings.dart';
import '../../../../core/style/style_constant.dart';
import '../../../../core/widgets/center_msg.dart';
import '../../../../core/widgets/m_button.dart';
import '../../../available_trips/domain/entities/trip_search_entity.dart';
import '../../../available_trips/presentation/cubites/available_trips/available_trips_cubit.dart';
import '../../domain/entities/city_entitie.dart';
import '../cubits/citu_search_cubit/city_search_cubit.dart';
import '../cubits/city_text_cubit/city_text_cubit.dart';
import '../cubits/retrive_cities_cubit/home_cubit.dart';
import '../widgets/content_modal_bottom_shete.dart';
import '../widgets/direction_widget.dart';
import '../widgets/switch_directons_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  AppAssetsStrings.qrCode,
                  height: 50,
                ),
                Image.asset(
                  AppAssetsStrings.logo,
                  width: 150,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  AppLocalizations.of(context)!.translate('whereToTravel')!,
                  style: StyleConst.title1,
                ),
              ),
              Image.asset(
                AppAssetsStrings.bus,
                width: 130,
              ),
            ],
          ),
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is HomeInitialState) {
                BlocProvider.of<HomeCubit>(context).getCities(context);
                return const RefreshProgressIndicator();
              } else if (state is HomeLoadingState) {
                return const RefreshProgressIndicator();
              } else if (state is HomeLoadedState) {
                List<CityEntity> listCities = state.listCitiesEntity;
                return Stack(
                  children: [
                    BlocConsumer<CityTextCubit, CityTextState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        return Column(
                          children: [
                            DirectionBaseWidget(
                              onTap: () {
                                restCityListView(context);
                                showMaterialModalBottomSheet(
                                  context: context,
                                  builder: (context) => ModalSheteContentWidget(
                                    listCity: listCities,
                                    anyWidget: 1,
                                  ),
                                );
                              },
                              icon: Icons.location_on,
                              headerText: AppLocalizations.of(context)!
                                  .translate('mFrom')!,
                              cityText: BlocProvider.of<CityTextCubit>(context)
                                  .cityFrom,
                            ),
                            DirectionBaseWidget(
                              onTap: () {
                                restCityListView(context);
                                showMaterialModalBottomSheet(
                                  context: context,
                                  builder: (context) => ModalSheteContentWidget(
                                    listCity: listCities,
                                    anyWidget: 2,
                                  ),
                                );
                              },
                              icon: Icons.location_on,
                              headerText: AppLocalizations.of(context)!
                                  .translate('mTo')!,
                              cityText: BlocProvider.of<CityTextCubit>(context)
                                  .cityTo,
                            ),
                            DirectionBaseWidget(
                              onTap: () async {
                                DateTime? date = DateTime(1900);
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());

                                date = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime(2100));
                                if (date != null) {
                                  BlocProvider.of<CityTextCubit>(context).date =
                                      formatDate(date);
                                }
                                //print('date is:' + dateChoose!);
                              },
                              icon: Icons.calendar_month,
                              headerText: AppLocalizations.of(context)!
                                  .translate('date')!,
                              cityText:
                                  BlocProvider.of<CityTextCubit>(context).date,
                            ),
                            MButton(
                              title: AppLocalizations.of(context)!
                                  .translate('search')!,
                              onTap: () {
                                String destinationCity =
                                    BlocProvider.of<CityTextCubit>(context)
                                        .cityFrom;
                                String arrivalCity =
                                    BlocProvider.of<CityTextCubit>(context)
                                        .cityTo;
                                String travelDate =
                                    BlocProvider.of<CityTextCubit>(context)
                                        .date;
                                if (destinationCity.isNotEmpty &&
                                    arrivalCity.isNotEmpty &&
                                    travelDate.isNotEmpty) {
                                  BlocProvider.of<AvailableTripsCubit>(context)
                                      .getAvailableTrips(
                                          TripSearchEntity(
                                              destinationCity: destinationCity,
                                              arrivalCity: arrivalCity,
                                              travelDate: travelDate),
                                          context);
                                  Navigator.pushNamed(
                                      context, Routes.availableTripsRoute);
                                }
                              },
                            )
                          ],
                        );
                      },
                    ),
                    SwitchDirections(
                      onPressed: () {
                        BlocProvider.of<CityTextCubit>(context).switchCities();
                      },
                    ),
                  ],
                );
              } else if (state is HomeFailureState) {
                return MButton(
                  title: AppLocalizations.of(context)!.translate('reload')!,
                  onTap: () {
                    BlocProvider.of<HomeCubit>(context).getCities(context);
                  },
                );
              } else {
                return CenterHintMsg(
                  msg: AppLocalizations.of(context)!
                      .translate('unexpectedError')!,
                  color: Colors.red,
                );
              }
            },
          ),
        ],
      ),
    );
  }

  void restCityListView(BuildContext context) {
    BlocProvider.of<CitySearchCubit>(context).restDefult();
  }
}

String formatDate(DateTime date) {
  return "${date.year}/${date.month}/${date.day}";
}
