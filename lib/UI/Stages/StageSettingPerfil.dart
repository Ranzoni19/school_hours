// ignore_for_file: prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables, non_constant_identifier_names, avoid_unnecessary_containers, unnecessary_new

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_hours/widgets/components.dart';
import 'StageSetting.dart';

class StageSettingPerfil extends StatefulWidget {
  static String id = "StageSettingPerfil";
  const StageSettingPerfil({Key? key}) : super(key: key);

  @override
  State<StageSettingPerfil> createState() => _StageSettingPerfilState();
}

class _StageSettingPerfilState extends State<StageSettingPerfil> {
  final _keyForm = GlobalKey<FormState>();

  final TextEditingController name = TextEditingController();
  final TextEditingController lastname = TextEditingController();

  final ListTurn = [
    'Mañana',
    'Tarde',
  ];
  final ListAge = [
    'Primero',
    'Segundo',
    'Tercero',
    'Cuarto',
    'Quinto',
    'Sexto',
  ];
  final ListDiv = [
    'Primera',
    'Segunda',
    'Tercera',
    'Cuarta',
    'Quinta',
    'Sexta,',
  ];
  String ViewTurn = 'Turno';
  String ViewAge = 'Año';
  String ViewDiv = 'División';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff9DA3C3),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Form(
            key: _keyForm,
            child: Center(
              child: ListView(
                padding: EdgeInsets.symmetric(
                  horizontal: 30.0,
                ),
                children: [
                  SizedBox(
                    height: 130.0,
                  ),
                  Logo(),
                  SizedBox(
                    height: 65.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: TextNameField(),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: TextLastNameField(),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  DropTurnAges(),
                  SizedBox(
                    height: 20.0,
                  ),
                  DropDiv(),
                  SizedBox(
                    height: 40.0,
                  ),
                  SaveBt(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextNameField() {
    return GeneralTf(
      labelText: 'Nombre',
      icon: Icon(
        Icons.person,
        color: Color(0xff777777),
      ),
      controller: name,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("Este campo de texto es obligatorio");
        }
        if (!regex.hasMatch(value)) {
          return ("Ingrese un nombre, minimo 3 caracteres)");
        }
        return null;
      },
      onSaved: (value) {
        name.text = value!;
      },
    );
  }

  TextLastNameField() {
    return GeneralTf(
      labelText: 'Apellido',
      icon: Icon(
        Icons.person,
        color: Color(0xff777777),
      ),
      controller: lastname,
      validator: (value) {
        if (value!.isEmpty) {
          return ('Este campo de texto es obligatorio');
        }
        return null;
      },
      onSaved: (value) {
        lastname.text = value!;
      },
    );
  }

  DropTurnAges() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Column(
            children: <Widget>[
              Container(
                child: DropdownButtonFormField(
                  items: ListTurn.map((String a) {
                    return DropdownMenuItem(
                      value: a,
                      child: Text(a),
                    );
                  }).toList(),
                  onChanged: (_) {},
                  hint: Text(ViewTurn),
                  icon: Icon(Icons.keyboard_arrow_down_sharp),
                  style: TextStyle(
                    color: Color(0xff343434),
                    fontSize: 15.0,
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: Column(
            children: <Widget>[
              Container(
                child: DropdownButtonFormField(
                  items: ListAge.map((String a) {
                    return DropdownMenuItem(
                      value: a,
                      child: Text(a),
                    );
                  }).toList(),
                  onChanged: (_) {},
                  hint: Text(ViewAge),
                  icon: Icon(Icons.keyboard_arrow_down_sharp),
                  style: TextStyle(
                    color: Color(0xff343434),
                    fontSize: 15.0,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  DropDiv() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Column(
            children: <Widget>[
              Container(
                child: DropdownButtonFormField(
                  items: ListDiv.map((String a) {
                    return DropdownMenuItem(
                      value: a,
                      child: Text(a),
                    );
                  }).toList(),
                  onChanged: (_) {},
                  hint: Text(ViewDiv),
                  icon: Icon(Icons.keyboard_arrow_down_sharp),
                  style: TextStyle(
                    color: Color(0xff343434),
                    fontSize: 15.0,
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          width: 162.0,
        ),
      ],
    );
  }

  SaveBt(context) {
    return CupertinoButton(
      onPressed: () {
        Route route = MaterialPageRoute(builder: (__) => StageSetting());
        Navigator.pushReplacement(context, route);
      },
      child: Text(
        'Guardar cambios',
        style: TextStyle(
          color: Color(0xff343434),
          fontSize: 20.0,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
