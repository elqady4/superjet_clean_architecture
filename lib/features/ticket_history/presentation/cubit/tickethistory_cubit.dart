import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suberjet_clean_architecture/config/locale/app_localizations.dart';
import 'package:suberjet_clean_architecture/core/errors/failure.dart';
import 'package:suberjet_clean_architecture/features/ticket_history/domain/entities/ticket_entity.dart';
import 'package:suberjet_clean_architecture/features/ticket_history/domain/usecases/get_my_tickets_usecase.dart';

part 'tickethistory_state.dart';

class TickethistoryCubit extends Cubit<TickethistoryState> {
  final GetMyTicketsUsecase getMyTicketsUsecase;
  TickethistoryCubit({required this.getMyTicketsUsecase})
      : super(TickethistoryInitial());

  void getMyTickets(
      {required String email, required BuildContext context}) async {
    emit(TickethistoryLoading());
    Either<Failure, List<TicketEntity>> result =
        await getMyTicketsUsecase(email);

    result.fold(
        (failure) => emit(TickethistoryFail(
            msg: AppLocalizations.of(context)!.translate('fail_tickets')!)),
        (ticketsList) =>
            emit(TickethistoryLoaded(listTicketEntity: ticketsList)));
  }

  void emitInitial() {
    emit(TickethistoryInitial());
  }
}
