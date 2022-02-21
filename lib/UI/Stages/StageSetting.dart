// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:school_hours/UI/Stages/StageSettingEmail.dart';
import 'package:school_hours/UI/Stages/StageSettingPass.dart';
import 'package:school_hours/UI/Stages/StageSettingPerfil.dart';
import 'package:school_hours/widgets/components.dart';

class StageSetting extends StatelessWidget {
  static String id = "StageSetting";
  const StageSetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff9DA3C3),
        appBar: AppBar(
          backgroundColor: Color(0xff4d5e7f),
          title: Text(
            'Configuracion',
            style: TextStyle(
              color: Color(0xff343434),
              fontSize: 25.0,
            ),
          ),
        ),
        drawer: CustomDrawer(),
        body: ListView(
          children: [
            SizedBox(
              height: 10.0,
            ),
            ListTile(
              onTap: () {
                Route route =
                    MaterialPageRoute(builder: (__) => StageSettingEmail());
                Navigator.push(context, route);
              },
              title: Text(
                'Cambiar email',
                style: TextStyle(
                  color: Color(0xff343434),
                  fontSize: 25.0,
                ),
              ),
              trailing: Icon(
                Icons.email_outlined,
                color: Color(0xff343434),
              ),
            ),
            Divider(
              color: Color(0xff343434),
              height: 2.0,
            ),
            SizedBox(
              height: 10.0,
            ),
            ListTile(
              onTap: () {
                Route route =
                    MaterialPageRoute(builder: (__) => StageSettingPass());
                Navigator.push(context, route);
              },
              title: Text(
                'Restablecer contraseña',
                style: TextStyle(
                  color: Color(0xff343434),
                  fontSize: 25.0,
                ),
              ),
              trailing: Icon(
                Icons.password_rounded,
                color: Color(0xff343434),
              ),
            ),
            Divider(
              color: Color(0xff343434),
              height: 2.0,
            ),
            SizedBox(
              height: 10.0,
            ),
            ListTile(
              onTap: () {
                Route route =
                    MaterialPageRoute(builder: (__) => StageSettingPerfil());
                Navigator.push(context, route);
              },
              title: Text(
                'Editar perfil',
                style: TextStyle(
                  color: Color(0xff343434),
                  fontSize: 25.0,
                ),
              ),
              trailing: Icon(
                Icons.person,
                color: Color(0xff343434),
              ),
            ),
            Divider(
              color: Color(0xff343434),
              height: 2.0,
            ),
          ],
        ),
      ),
    );
  }
}
