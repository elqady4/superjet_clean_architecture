import 'package:dartz/dartz.dart';
import 'package:suberjet_clean_architecture/core/errors/failure.dart';
import 'package:suberjet_clean_architecture/features/ticket_history/domain/entities/ticket_entity.dart';

abstract class TicketRepository {
  Future<Either<Failure, List<TicketEntity>>> getMyTickets(String email);
}
