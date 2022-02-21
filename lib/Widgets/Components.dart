// ignore: unused_import
// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, duplicate_ignore, non_constant_identifier_names, prefer_typing_uninitialized_variables, file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_hours/UI/Stages/StageSetting.dart';
import 'package:school_hours/UI/Stages/Stagelogin.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'School Hours',
      style: TextStyle(
        color: Color(0xff343434),
        fontSize: 40.0,
        decoration: TextDecoration.underline,
      ),
      textAlign: TextAlign.center,
    );
  }
}

class GeneralTf extends StatelessWidget {
  final String labelText;
  final bool obcureText;
  final TextInputType keyboarType;
  final Icon icon;
  final TextEditingController controller;
  final validator;
  final onSaved;

  // ignore: use_key_in_widget_constructors
  const GeneralTf({
    required this.labelText,
    this.obcureText = false,
    this.keyboarType = TextInputType.text,
    required this.icon,
    required this.controller,
    required this.validator,
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Color(0xff777777),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
          color: Color(0xff777777),
        ),
        floatingLabelStyle: TextStyle(
          color: Color(0xff777777),
        ),
        focusColor: Color(0xff777777),
        icon: icon,
      ),
      obscureText: obcureText,
      keyboardType: keyboarType,
      controller: controller,
      validator: validator,
      onSaved: onSaved,
    );
  }
}

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xff4d5e7f),
        child: ListView(
          padding: EdgeInsets.symmetric(
            vertical: 10.0,
          ),
          children: [
            SizedBox(
              height: 30.0,
            ),
            Center(
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Logo(),
                  SizedBox(
                    height: 30.0,
                  ),
                  Divider(
                    color: Color(0xff343434),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            Route route = MaterialPageRoute(
                              builder: (__) => StageSetting(),
                            );
                            Navigator.push(context, route);
                          },
                          child: Text(
                            'Configuracion',
                            style: TextStyle(
                              color: Color(0xff343434),
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.keyboard_arrow_right_outlined,
                          color: Color(0xff343434),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Color(0xff343434),
                  ),
                  SizedBox(
                    height: 400.0,
                  ),
                  CupertinoButton(
                    onPressed: () {
                      {
                        Route route =
                            MaterialPageRoute(builder: (__) => StageLogin());
                        Navigator.pushReplacement(context, route);
                      }
                    },
                    child: Text(
                      'Cerrar sesión',
                      style: TextStyle(
                        color: Color(0xff343434),
                        fontSize: 20.0,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Info extends StatelessWidget {
  final String hour;
  final String materia;

  const Info({
    required this.hour,
    required this.materia,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          hour,
          style: TextStyle(
            color: Color(0xff343434),
            fontSize: 50.0,
            decoration: TextDecoration.underline,
          ),
        ),
        SizedBox(
          width: 65.0,
        ),
        SizedBox(
          width: 50.0,
          height: 50.0,
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Text(
                'Hora',
                style: TextStyle(
                  color: Color(0xff343434),
                ),
              ),
              Divider(
                color: Color(0xff343434),
              ),
              Text(
                'Hora',
                style: TextStyle(
                  color: Color(0xff343434),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 85.0,
        ),
        Text(
          'Materia',
          style: TextStyle(
            color: Color(0xff343434),
            fontSize: 17.0,
          ),
        ),
      ],
    );
  }
}
