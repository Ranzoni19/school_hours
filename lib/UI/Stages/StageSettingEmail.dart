// ignore_for_file: file_names, prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_hours/UI/Stages/StageSetting.dart';
import 'package:school_hours/widgets/components.dart';

class StageSettingEmail extends StatefulWidget {
  static String id = "StageSettingEmail";
  const StageSettingEmail({Key? key}) : super(key: key);

  @override
  State<StageSettingEmail> createState() => _StageSettingEmailState();
}

class _StageSettingEmailState extends State<StageSettingEmail> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController newEmail = TextEditingController();
  final TextEditingController confirmEmail = TextEditingController();

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
            key: _formKey,
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
                  textfieldEmail(),
                  SizedBox(
                    height: 40.0,
                  ),
                  textfieldCEmail(),
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

  textfieldEmail() {
    return GeneralTf(
      labelText: 'Email',
      keyboarType: TextInputType.emailAddress,
      icon: Icon(
        Icons.email_outlined,
        color: Color(0xff777777),
      ),
      controller: newEmail,
      validator: (value) {
        if (value!.isEmpty) {
          return ('Este campo de texto es obligatorio');
        }
        return null;
      },
      onSaved: (value) {
        newEmail.text = value!;
      },
    );
  }

  textfieldCEmail() {
    return GeneralTf(
      labelText: 'Confirmar Email',
      icon: Icon(
        Icons.password_rounded,
        color: Color(0xff777777),
      ),
      controller: confirmEmail,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Este campo de texto es obligatorio");
        }
        if (confirmEmail.text != newEmail.text) {
          return 'Los Email´s no coinciden';
        }
        return null;
      },
      onSaved: (value) {
        confirmEmail.text = value!;
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
