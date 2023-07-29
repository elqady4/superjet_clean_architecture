import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:suberjet_clean_architecture/api/end_points.dart';
import 'package:suberjet_clean_architecture/features/ticket_history/data/models/ticket_model.dart';

abstract class GetTicketsRemoteDataSource {
  Future<List<TicketModel>> getTickets(String email);
}

class GetTicketsRemoteDataSourceDIO implements GetTicketsRemoteDataSource {
  @override
  Future<List<TicketModel>> getTickets(String email) async {
    var response = await Dio().get('${EndPoints.getMyTickets}?email=$email');
    return List<TicketModel>.from((jsonDecode(response.data) as List)
        .map((ticket) => TicketModel.fromJson(ticket)));
  }
}
