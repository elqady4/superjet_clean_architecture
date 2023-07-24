import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'selected_seats_state.dart';

class SelectedSeatsCubit extends Cubit<SelectedSeatsState> {
  SelectedSeatsCubit() : super(SelectedSeatsInitial());

  List<int> mselectedSeats = [];

  void setSelectedSeats({required List<int> selectedSeats}) {
    mselectedSeats = selectedSeats;
  }
}
