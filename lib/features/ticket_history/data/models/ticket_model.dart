import 'package:suberjet_clean_architecture/features/ticket_history/domain/entities/ticket_entity.dart';

class TicketModel extends TicketEntity {
  const TicketModel(
      {required super.orderId,
      required super.tripId,
      required super.payMethod,
      required super.amount,
      required super.payState,
      required super.company,
      required super.cityfrom,
      required super.cityto,
      required super.travelDate,
      required super.travelTime,
      required super.busType,
      required super.arraySeats});

  factory TicketModel.fromJson(Map<String, dynamic> json) => TicketModel(
        orderId: json["order_id"],
        tripId: json["trip_id"],
        payMethod: json["pay_Method"],
        amount: json["amount"],
        payState: json["pay_state"],
        company: json["company"],
        cityfrom: json["cityfrom"],
        cityto: json["cityto"],
        travelDate: json["travel_date"],
        travelTime: json["travel_time"],
        busType: json["bus_type"],
        arraySeats: json["array_seats"],
      );

  Map<String, dynamic> toJson() => {
        "order_id": orderId,
        "trip_id": tripId,
        "pay_Method": payMethod,
        "amount": amount,
        "pay_state": payState,
        "company": company,
        "cityfrom": cityfrom,
        "cityto": cityto,
        "travel_date": travelDate,
        "travel_time": travelTime,
        "bus_type": busType,
        "array_seats": arraySeats,
      };
}
