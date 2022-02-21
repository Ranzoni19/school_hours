// ignore_for_file: file_names, prefer_const_constructors, non_constant_identifier_names, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:school_hours/Widgets/Components.dart';

class StageHomeOne extends StatefulWidget {
  static String id = "StageHomeOne";
  const StageHomeOne({Key? key}) : super(key: key);

  @override
  State<StageHomeOne> createState() => _StageHomeOneState();
}

class _StageHomeOneState extends State<StageHomeOne> {
  final ListDay = [
    'Lunes',
    'Martes',
    'Miercoles',
    'Jueves',
    'Viernes',
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff9DA3C3),
        appBar: AppBar(
          backgroundColor: Color(0xff4d5e7f),
          title: Text(
            'Curso',
            style: TextStyle(
              color: Color(0xff343434),
              fontSize: 25.0,
            ),
          ),
        ),
        drawer: CustomDrawer(),
        body: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: 5.0,
          ),
          children: [
            DropDays(),
            SizedBox(
              height: 30.0,
            ),
            Titles(),
            SizedBox(
              height: 30.0,
            ),
            HourOne(),
            SizedBox(
              height: 15.0,
            ),
            HourTwo(),
            SizedBox(
              height: 15.0,
            ),
            HourThree(),
            SizedBox(
              height: 15.0,
            ),
            HourFour(),
            SizedBox(
              height: 15.0,
            ),
            HourFive(),
            SizedBox(
              height: 15.0,
            ),
            HourSix(),
            SizedBox(
              height: 15.0,
            ),
            HourSeven(),
          ],
        ),
      ),
    );
  }

  DropDays() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Column(
            children: <Widget>[
              DropdownButtonFormField(
                items: ListDay.map((String a) {
                  return DropdownMenuItem(
                    value: a,
                    child: Text(a),
                  );
                }).toList(),
                onChanged: (_) {},
                hint: Text(ListDay[0]),
                icon: Icon(Icons.keyboard_arrow_down_sharp),
                style: TextStyle(
                  color: Color(0xff343434),
                  fontSize: 20.0,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          width: 170.0,
        ),
      ],
    );
  }

  Titles() {
    return Row(
      children: [
        Text(
          'Horas',
          style: TextStyle(
            color: Color(0xff343434),
            fontSize: 20.0,
            decoration: TextDecoration.underline,
          ),
        ),
        SizedBox(
          width: 30.0,
        ),
        Text(
          'Horario',
          style: TextStyle(
            color: Color(0xff343434),
            fontSize: 20.0,
            decoration: TextDecoration.underline,
          ),
        ),
        SizedBox(
          width: 70.0,
        ),
        Text(
          'Materias',
          style: TextStyle(
            color: Color(0xff343434),
            fontSize: 20.0,
            decoration: TextDecoration.underline,
          ),
        ),
      ],
    );
  }

  HourOne() {
    return Info(
      hour: '1',
      materia: 'materia',
    );
  }

  HourTwo() {
    return Info(
      hour: '2',
      materia: 'materia',
    );
  }

  HourThree() {
    return Info(
      hour: '3',
      materia: 'materia',
    );
  }

  HourFour() {
    return Info(
      hour: '4',
      materia: 'materia',
    );
  }

  HourFive() {
    return Info(
      hour: '5',
      materia: 'materia',
    );
  }

  HourSix() {
    return Info(
      hour: '6',
      materia: 'materia',
    );
  }

  HourSeven() {
    return Info(
      hour: '7',
      materia: 'materia',
    );
  }
}
