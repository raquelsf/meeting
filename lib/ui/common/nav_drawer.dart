import 'package:flutter/material.dart';

class DrawerWidget extends StatefulWidget {

  final ValueChanged<int> parentAction;

  const DrawerWidget({Key key, this.parentAction}) : super(key: key);

  @override
  _DrawerWidgetState createState() => new _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {

//identifica qual item foi selecionado
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Nav-Bar'),
            decoration: BoxDecoration(
              color: Colors.black38,
            ),
          ),
          _tiles('Item 1', Icons.favorite , 0),
          _tiles('Item 2', Icons.calendar_today , 1),
          _tiles('Item 3', Icons.favorite , 2),
        ],
      ),
    );
  }

//cria cada item do menu
  Widget _tiles(String text, IconData icon, int item) {
    return ListTile(
      leading: Icon(icon, color: Colors.black54),
      onTap: () {
        _onSelectItem(item);
      },
      selected: item == _selectedIndex,
      title: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black38),
      ),
    );
  }

  _onSelectItem(int index) {
    setState(() => _selectedIndex = index);
    widget.parentAction(_selectedIndex);
    Navigator.of(context).pop();
  }
}