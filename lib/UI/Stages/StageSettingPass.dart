// ignore_for_file: file_names, prefer_const_constructors, non_constant_identifier_names, unnecessary_new

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_hours/widgets/components.dart';
import 'StageSetting.dart';

class StageSettingPass extends StatefulWidget {
  static String id = "StageSettingPass";
  const StageSettingPass({Key? key}) : super(key: key);

  @override
  State<StageSettingPass> createState() => _StageSettingPassState();
}

class _StageSettingPassState extends State<StageSettingPass> {
  final _keyForm = GlobalKey<FormState>();

  final TextEditingController newPassword = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
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
                  horizontal: 35.0,
                ),
                children: [
                  SizedBox(
                    height: 130.0,
                  ),
                  Logo(),
                  SizedBox(
                    height: 65.0,
                  ),
                  textfieldPass(),
                  SizedBox(
                    height: 40.0,
                  ),
                  textfieldCPass(),
                  SizedBox(
                    height: 5.0,
                  ),
                  SizedBox(
                    height: 150.0,
                  ),
                  Confirmar(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  textfieldPass() {
    return GeneralTf(
      labelText: 'Contraseña',
      icon: Icon(
        Icons.password_rounded,
        color: Color(0xff777777),
      ),
      controller: newPassword,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{8,}$');
        if (value!.isEmpty) {
          return ("Este campo de texto es obligatorio");
        }
        if (!regex.hasMatch(value)) {
          return ("Ingrese una contraseña valida, minimo 8 caracteres)");
        }
      },
      onSaved: (value) {
        newPassword.text = value!;
      },
    );
  }

  textfieldCPass() {
    return GeneralTf(
      labelText: 'Confirmar Contraseña',
      icon: Icon(
        Icons.password_rounded,
        color: Color(0xff777777),
      ),
      controller: confirmPassword,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Este campo de texto es obligatorio");
        }
        if (confirmPassword.text != newPassword.text) {
          return 'Las contraseñas no coinciden';
        }
        return null;
      },
      onSaved: (value) {
        confirmPassword.text = value!;
      },
    );
  }

  Confirmar(context) {
    return CupertinoButton(
      onPressed: () {
        Route route = MaterialPageRoute(builder: (__) => StageSetting());
        Navigator.pushReplacement(context, route);
      },
      child: Text(
        'Confirmar',
        style: TextStyle(
          color: Color(0xff343434),
          fontSize: 20.0,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
