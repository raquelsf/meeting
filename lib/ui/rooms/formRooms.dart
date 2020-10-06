import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:date_format/date_format.dart';
import 'package:meeting/ui/common/centered_label.dart';
import 'listRoomsCheck.dart';
import 'package:meeting/style/theme.dart' as Theme;

class FormRooms extends StatefulWidget {
  @override
  _FormRoomsState createState() => _FormRoomsState();
}

class _FormRoomsState extends State<FormRooms> {
  final _formKey = GlobalKey<FormState>();

  bool _isVisible = true;
  bool _btnEnabled = false;
  Function listRoomsCheck;
  DateTime _dateTime;
  TextEditingController _dateTimeInitialController = TextEditingController();
  TextEditingController _dateTimeFinalController = TextEditingController();
  TextEditingController _dateTimeHourInitialController =
  TextEditingController();
  TextEditingController _dateTimeHourFinalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Theme.Colors.appPrimary,
        title: new Text("Reservar Sala"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Card(
            child: Column(
              children: <Widget>[
                CenteredLabel(message: 'Escolha o horário:'),
                Container(
                  padding: EdgeInsets.only(left: 12.0, right: 12.0, top: 8.0),
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  child: Column(
                    children: <Widget>[
                      _formReservation(context),
                      Visibility(visible: _isVisible, child: ListRoomsCheck()),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(top: 5.0),
                            child: RaisedButton(
                              color: Theme.Colors.appLight,
                              onPressed: () {
                                if (_btnEnabled) {
                                  showRooms();
                                }
                              },
                              child: Text(
                                "Reservar",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }

  Widget _formReservation(BuildContext context) {
    return Form(
      key: _formKey,
      onChanged: () =>
          setState(
                  () =>
              _btnEnabled = _formKey.currentState.validate()),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _createDatePickerIcon(
                  context, _dateTimeInitialController),
              _createText("Data Inicial", "00/00/00",
                  _dateTimeInitialController),
              _createTimePickerIcon(
                  context, _dateTimeHourInitialController),
              _createText("Hora Inicial", "00:00",
                  _dateTimeHourInitialController),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _createDatePickerIcon(
                  context, _dateTimeFinalController),
              _createText("Data Final", "00/00/00",
                  _dateTimeFinalController),
              _createTimePickerIcon(
                  context, _dateTimeHourFinalController),
              _createText("Hora Final", "00:00",
                  _dateTimeHourFinalController),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 5.0),
                child: RaisedButton(
                  color: Theme.Colors.appLight,
                  onPressed: () {
                    if (_btnEnabled) {
                      showRooms();
                    }
                  },
                  child: Text(
                    "Verificar Disponibilidade",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  showRooms() {
    setState(() {
      _isVisible = true;
    });
  }

  Widget _createDatePickerIcon(BuildContext context,
      TextEditingController controller) {
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(top: 10.0),
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              _showDatePicker(context, controller);
            },
            child: Icon(Icons.date_range),
          ),
        ),
      ],
    );
  }

  Widget _createTimePickerIcon(BuildContext context,
      TextEditingController controller) {
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(top: 10.0),
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              _showTimePicker(context, controller);
            },
            child: Icon(Icons.access_time),
          ),
        ),
      ],
    );
  }

  Widget _createText(String labelText, String hintText,
      TextEditingController controller) {
    return Column(
      children: <Widget>[
        Container(
            width: MediaQuery
                .of(context)
                .size
                .width * 0.3,
            child: new TextFormField(
              decoration: InputDecoration(
                labelText: labelText,
                hintText: hintText,
                contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                //border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))
              ),
              maxLines: 1,
              controller: controller,
              autovalidate: false,
              validator: (value) =>
              value.length < 1
                  ? 'Informe um valor'
                  : // return an error message
              null,
            )),
      ],
    );
  }

  _showDatePicker(BuildContext context, TextEditingController controller) {
    DatePicker.showDatePicker(context,
        showTitleActions: true,
        minTime: DateTime.now(),
        maxTime: DateTime(2021, 6, 7),
        onConfirm: (date) {
          setState(
                  () =>
              controller.text = formatDate(date, [dd, '/', mm, '/', yyyy]));
        },
        currentTime: DateTime.now(),
        locale: LocaleType.pt);
  }

  _showTimePicker(BuildContext context, TextEditingController controller) {
    DatePicker.showTimePicker(context, showTitleActions: true,
        onConfirm: (date) {
          setState(() => controller.text = formatDate(date, [HH, ':', nn]));
        },
        currentTime: DateTime.now().subtract(new Duration(hours: 3)),
        locale: LocaleType.pt);
  }
}
