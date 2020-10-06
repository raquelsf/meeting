import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meeting/api/api.dart';
import 'package:meeting/ui/common/nav_drawer.dart';
import 'package:meeting/ui/rooms/listRooms.dart';
import 'package:meeting/style/theme.dart' as Theme;
import 'dash.dart';

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Theme.Colors.appPrimary,
        title: new Text(widget.title),
      ),
      drawer: DrawerWidget(parentAction: _setIndex),
      body: _getDrawerItem(),
    );
  }

  _setIndex(int index) {
    setState(() => _selectedIndex = index);
  }

  _getDrawerItem() {
    findAll();
    switch (_selectedIndex) {
      case 0:
        return Dash();
      case 1:
        return ListRooms();

    }
  }
}
