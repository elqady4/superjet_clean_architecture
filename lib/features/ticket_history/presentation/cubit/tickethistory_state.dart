part of 'tickethistory_cubit.dart';

abstract class TickethistoryState extends Equatable {
  const TickethistoryState();

  @override
  List<Object> get props => [];
}

class TickethistoryInitial extends TickethistoryState {}

class TickethistoryLoading extends TickethistoryState {}

class TickethistoryLoaded extends TickethistoryState {
  final List<TicketEntity> listTicketEntity;

  const TickethistoryLoaded({required this.listTicketEntity});
}

class TickethistoryFail extends TickethistoryState {
  final String msg;

  const TickethistoryFail({required this.msg});
}
