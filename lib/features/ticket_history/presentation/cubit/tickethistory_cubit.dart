import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tickethistory_state.dart';

class TickethistoryCubit extends Cubit<TickethistoryState> {
  TickethistoryCubit() : super(TickethistoryInitial());
}
