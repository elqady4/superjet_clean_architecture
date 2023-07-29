import 'package:dartz/dartz.dart';
import 'package:suberjet_clean_architecture/core/errors/failure.dart';
import 'package:suberjet_clean_architecture/core/usecases/usecase.dart';
import 'package:suberjet_clean_architecture/features/ticket_history/domain/entities/ticket_entity.dart';
import 'package:suberjet_clean_architecture/features/ticket_history/domain/repositories/ticket_repository.dart';

class GetMyTicketsUsecase extends Usecase<List<TicketEntity>, String> {
  final TicketRepository ticketRepository;

  GetMyTicketsUsecase({required this.ticketRepository});
  @override
  Future<Either<Failure, List<TicketEntity>>> call(String params) async {
    return await ticketRepository.getMyTickets(params);
  }
}
