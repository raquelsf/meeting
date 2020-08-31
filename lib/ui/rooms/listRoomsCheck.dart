import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
class ListRoomsCheck extends StatefulWidget {
  @override
  _ListRoomsCheck createState() => _ListRoomsCheck();
}

class _ListRoomsCheck extends State<ListRoomsCheck> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final titles = ['Pão de Queijo', 'Pampulha', 'Doce de Leite', 'Doce de Leite', 'Doce de Leite', 'Doce de Leite', 'Doce de Leite' ];

    final icons = [Icons.filter_2, Icons.filter_4, Icons.filter_2, Icons.filter_2, Icons.filter_2, Icons.filter_2, Icons.filter_2];

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
                        Container(
                          margin: const EdgeInsets.only(top: 20.0, bottom: 10.0),
                          child: Text(
                            'Escolha uma Sala:',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: titles.length,
                          itemBuilder: (context, index) {
                            return Center(
                              child: CheckboxListTile(
                                title: Text(titles[index]),
                                subtitle: Text(subtitles[index]),
                                value: _selectedIndex == index,
                                activeColor: Colors.black54,
                                onChanged: (bool value) {
                                  setState( () => _selectedIndex = index);
                                },
                                secondary: Icon(icons[index]),
                              ),
                            );
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
