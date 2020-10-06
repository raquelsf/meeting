import 'dart:convert';
import 'dart:io';
import 'package:meeting/model/reservations.dart';

Future<List<Reservation>> findAll() async{
  var host = "192.168.0.108";

  HttpClient client = new HttpClient();
  client.badCertificateCallback = ((X509Certificate cert, String host, int port) => true);

  HttpClientRequest request = await client.get(host, 5000, "/api/reservations").timeout(Duration(seconds: 5));

  request.headers.set('content-type', 'application/json');

  HttpClientResponse response = await request.close();

  String reply = await response.transform(utf8.decoder).join();

  final List<dynamic> decodedJson = jsonDecode(reply);
  final List<Reservation> reservations = List();
  for(Map<String, dynamic> json in decodedJson){
    final Reservation reservation = Reservation(
        RoomId: json['RoomId'] as String,
        UserId: json['UserId'] as String,
        DateInitial: json['DateInitial'] as DateTime,
        DateEnd: json['DateEnd'] as DateTime
    );
    reservations.add(reservation);
  }
  return reservations;
}