import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suberjet_clean_architecture/config/locale/app_localizations.dart';

import '../../../../core/style/app_colors.dart';
import '../../../../core/style/style_constant.dart';
import '../../../../core/widgets/center_msg.dart';
import '../../domain/entities/city_entitie.dart';
import '../cubits/citu_search_cubit/city_search_cubit.dart';
import '../cubits/city_text_cubit/city_text_cubit.dart';

typedef OnItemSelected = void Function(String selectedItem, int anyWidget);

class ModalSheteContentWidget extends StatelessWidget {
  const ModalSheteContentWidget({
    Key? key,
    required this.anyWidget,
    this.listCity,
  }) : super(key: key);
  final int anyWidget;
  final List<CityEntity>? listCity;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          height: 400,
          padding:
              const EdgeInsetsDirectional.symmetric(vertical: 5, horizontal: 5),
          child: Column(
            children: [
              Container(
                width: 100,
                height: 8,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: AppColors.primaryColor),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                  label: Text(
                    AppLocalizations.of(context)!.translate('search')!,
                    style: StyleConst.title3,
                  ),
                ),
                onChanged: (value) {
                  BlocProvider.of<CitySearchCubit>(context)
                      .search(listCity!, value, context);
                },
              ),
              Expanded(
                child: BlocBuilder<CitySearchCubit, CitySearchState>(
                  builder: (context, state) {
                    if (state is CitySearchFound) {
                      return buildListCityModalShete(state.cityList);
                    } else if (state is CitySearchInitial) {
                      return buildListCityModalShete(listCity!);
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
      ),
    );
  }

  ListView buildListCityModalShete(List<CityEntity> listCity) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: listCity.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              BlocProvider.of<CityTextCubit>(context)
                  .changeCity(listCity[index].name, anyWidget);
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                listCity[index].name,
                style: StyleConst.title2,
              ),
            ),
          );
        });
  }
}
