import 'package:flutter/material.dart';
import 'package:meeting/api/api.dart';
import 'package:meeting/model/rooms.dart';
import 'package:meeting/ui/common/centered_label.dart';
import 'package:meeting/ui/common/progress.dart';

class ListRooms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final subtitles = [
      '31/07/2020 13:00', '05/08/2020 16:00', '06/08/2020 09:00'
    ];

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  width: MediaQuery.of(context).size.width,
                  child: new Card(
                    child: Column(
                      children: <Widget>[
                        CenteredLabel(message: 'Minhas Reservas'),
                        FutureBuilder<List<Room>>(
                          future: findAll(),
                          builder: (context, snapshot) {
                            switch (snapshot.connectionState) {
                              case ConnectionState.none:
                                break;
                              case ConnectionState.waiting:
                                Progress();
                                break;
                              case ConnectionState.active:
                                break;
                              case ConnectionState.done:
                                final List<Room> rooms = snapshot.hasData ? snapshot.data : new  List<Room>();
                                if(rooms.isNotEmpty){
                                  return ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    itemCount: 1,
                                    itemBuilder: (context, index) {
                                      final Room room = rooms[index];
                                      return Card(
                                        child: ListTile(
                                          leading: room.floor.toInt() == 2
                                              ? Icon(Icons.filter_2)
                                              : Icon(Icons.filter_4),
                                          title: Text(room.name.toString()),
                                          subtitle: Text(subtitles[index]),
                                          trailing: Icon(Icons.more_vert),
                                        ),
                                      );
                                    },
                                  );
                                }
                                else{
                                  return CenteredLabel(message: 'Nenhuma sala encontrada');
                                }
                                break;
                            }
                            return CenteredLabel(message: 'Servidor Indisponível');
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
