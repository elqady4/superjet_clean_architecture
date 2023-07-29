import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suberjet_clean_architecture/config/locale/app_localizations.dart';
import 'package:suberjet_clean_architecture/core/widgets/center_msg.dart';
import 'package:suberjet_clean_architecture/features/auth/presentation/cubit/user_data_cubit/user_data_cubit.dart';
import 'package:suberjet_clean_architecture/features/ticket_history/presentation/cubit/tickethistory_cubit.dart';
import 'package:suberjet_clean_architecture/features/ticket_history/presentation/widgets/ticket_card_widget.dart';

import '../../../../core/widgets/header_widget.dart';

class TicketHistoryScreen extends StatelessWidget {
  const TicketHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UserDataState mstate = BlocProvider.of<UserDataCubit>(context).state;
    if (mstate is UserDataLoaded) {
      BlocProvider.of<TickethistoryCubit>(context)
          .getMyTickets(email: mstate.userEntity.email!, context: context);
    }

    return Column(
      children: [
        HeaderWidget(
          title: AppLocalizations.of(context)!.translate('ticketsHistory')!,
        ),
        BlocBuilder<TickethistoryCubit, TickethistoryState>(
          builder: (context, state) {
            if (state is TickethistoryLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is TickethistoryLoaded) {
              if (state.listTicketEntity.isNotEmpty) {
                return Expanded(
                  child: ListView.builder(
                      itemCount: state.listTicketEntity.length,
                      itemBuilder: (BuildContext context, int index) {
                        return TicketCardWidget(
                          ticketEntity: state.listTicketEntity[index],
                        );
                      }),
                );
              } else {
                return CenterHintMsg(
                    msg: AppLocalizations.of(context)!.translate('notFound')!);
              }
            } else if (state is TickethistoryFail) {
              return CenterHintMsg(
                  msg:
                      AppLocalizations.of(context)!.translate('fail_tickets')!);
            } else {
              return CenterHintMsg(
                  msg: AppLocalizations.of(context)!.translate('notFound')!);
            }
          },
        ),
      ],
    );
  }
}
