import 'dart:convert';
import 'dart:io';
import 'package:meeting/model/rooms.dart';

Future<List<Room>> findAll() async{
  var host = "192.168.0.108";

  HttpClient client = new HttpClient();
  client.badCertificateCallback = ((X509Certificate cert, String host, int port) => true);

  HttpClientRequest request = await client.get(host, 5000, "/api/rooms").timeout(Duration(seconds: 5));

  request.headers.set('content-type', 'application/json');

  //request.add(utf8.encode(json.encode(map)));

  HttpClientResponse response = await request.close();

  String reply = await response.transform(utf8.decoder).join();

  final List<dynamic> decodedJson = jsonDecode(reply);
  final List<Room> rooms = List();
  for(Map<String, dynamic> roomJson in decodedJson){
    final Room room = Room(
      name: roomJson['name'] as String,
      description: roomJson['description'] as String,
      maxPeople: roomJson['maxPeople'] as int,
      floor: roomJson['floor'] as int,
      hasTv: roomJson['hasTv'] as bool,
      hasPainting: roomJson['hasPainting'] as bool,
    );
    rooms.add(room);
  }
  return rooms;
}