import 'package:dartz/dartz.dart';
import 'package:suberjet_clean_architecture/core/errors/exception.dart';
import 'package:suberjet_clean_architecture/core/errors/failure.dart';
import 'package:suberjet_clean_architecture/core/network/netwok_info.dart';
import 'package:suberjet_clean_architecture/features/ticket_history/data/datasources/get_tickets_remote_datasource.dart';
import 'package:suberjet_clean_architecture/features/ticket_history/domain/entities/ticket_entity.dart';
import 'package:suberjet_clean_architecture/features/ticket_history/domain/repositories/ticket_repository.dart';

class TicketRepositoryImp implements TicketRepository {
  final GetTicketsRemoteDataSource getTicketsRemoteDataSource;
  final NetworkInfo networkInfo;

  TicketRepositoryImp(
      {required this.getTicketsRemoteDataSource, required this.networkInfo});
  @override
  Future<Either<Failure, List<TicketEntity>>> getMyTickets(String email) async {
    if (await networkInfo.isConnected) {
      try {
        var result = await getTicketsRemoteDataSource.getTickets(email);
        return right(result);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return left(NoInternetFailure());
    }
  }
}
