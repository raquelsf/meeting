import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meeting/ui/rooms/formRooms.dart';
import 'package:meeting/ui/rooms/listRooms.dart';
import 'package:meeting/style/theme.dart' as Theme;

class Dash extends StatefulWidget {
  final String title;

  const Dash({Key key, this.title}) : super(key: key);

  @override
  _Dash createState() => _Dash();
}

class _Dash extends State<Dash> {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      _headerDashboard(),
      _btnReservar(),
      ListRooms(),
    ]);
  }

  Widget _btnReservar() {
    return Container(
      height: 50.0,
      margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FormRooms()),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: Theme.Colors.appLight,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Text(
                  "Reservar Sala",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Montserrat',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _headerDashboard() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        _buildCardText('12', 'Salas'),
        _buildCardText('2', 'Reuniões'),
        _buildCardText('4', 'Convites'),
      ],
    );
  }

  Widget _buildCardText(String number, String title) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: new Card(
                child: Column(
                  children: <Widget>[
                    Center(
                      child: Container(
                        margin: const EdgeInsets.only(top: 20.0),
                        child: Text(
                          number,
                          style: TextStyle(
                            color: Theme.Colors.appDark,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        margin: const EdgeInsets.only(top: 25.0, bottom: 20.0),
                        child: Text(
                          title,
                          style: TextStyle(
                            color: Colors.black38,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
