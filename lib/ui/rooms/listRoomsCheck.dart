import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:meeting/api/api.dart';
import 'package:meeting/model/rooms.dart';
import 'package:meeting/ui/common/centered_label.dart';
import 'package:meeting/ui/common/progress.dart';

class ListRoomsCheck extends StatefulWidget {
  @override
  _ListRoomsCheck createState() => _ListRoomsCheck();
}

class _ListRoomsCheck extends State<ListRoomsCheck> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final subtitles = [
      '5 Pessoas - Tem Televisão.',
      '20 Pessoas - Tem Televisão.',
      '2 Pessoas.',
      '2 Pessoas.',
      '2 Pessoas.',
      '2 Pessoas.',
      '2 Pessoas.',
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
                  child: new Card(
                    child: Column(
                      children: <Widget>[
                        CenteredLabel(message: 'Escolha uma Sala'),
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
                                final List<Room> rooms = snapshot.hasData
                                    ? snapshot.data
                                    : new List<Room>();
                                if (rooms.isNotEmpty) {
                                  return ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    itemCount: rooms.length,
                                    itemBuilder: (context, index) {
                                      final Room room = rooms[index];
                                      return Center(
                                        child: CheckboxListTile(
                                          title: Text(room.name.toString()),
                                          subtitle: Text(subtitles[index]),
                                          value: _selectedIndex == index,
                                          activeColor: Colors.black54,
                                          onChanged: (bool value) {
                                            setState( () => _selectedIndex = index);
                                          },
                                          secondary: room.floor.toInt() == 2
                                              ? Icon(Icons.filter_2)
                                              : Icon(Icons.filter_4),
                                        ),
                                      );
                                    },
                                  );
                                } else {
                                  return CenteredLabel(
                                      message: 'Nenhuma sala encontrada');
                                }
                                break;
                            }
                            return CenteredLabel(
                                message: 'Servidor Indisponível');
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
