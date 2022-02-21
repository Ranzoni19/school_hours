// ignore_for_file: file_names, prefer_const_constructors, non_constant_identifier_names, unnecessary_new

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:school_hours/UI/Stages/StageHomeOne.dart';
import 'package:school_hours/UI/Stages/StageSettingPass.dart';
import 'package:school_hours/UI/Stages/StageSingUp.dart';
import 'package:school_hours/widgets/components.dart';

class StageLogin extends StatefulWidget {
  static String id = "StageLogin";
  const StageLogin({Key? key}) : super(key: key);

  @override
  State<StageLogin> createState() => _StageLoginState();
}

class _StageLoginState extends State<StageLogin> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  final _auth = FirebaseAuth.instance;

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
                  textfieldPassw(),
                  SizedBox(
                    height: 5.0,
                  ),
                  passwdBt(context),
                  SizedBox(
                    height: 50.0,
                  ),
                  loginBt(context),
                  SizedBox(
                    height: 80.0,
                  ),
                  registerBt(context),
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
      controller: email,
      validator: (value) {
        if (value!.isEmpty) {
          return ('Este campo de texto es obligatorio');
        }
        return null;
      },
      onSaved: (value) {
        email.text = value!;
      },
    );
  }

  textfieldPassw() {
    return GeneralTf(
      labelText: 'Contraseña',
      icon: Icon(
        Icons.password_rounded,
        color: Color(0xff777777),
      ),
      controller: password,
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
        password.text = value!;
      },
    );
  }

  passwdBt(context) {
    return CupertinoButton(
      onPressed: () {
        Route route = MaterialPageRoute(builder: (__) => StageSettingPass());
        Navigator.push(context, route);
      },
      child: Text(
        '¿Hás olvidado tu contraseña?',
        style: TextStyle(
          color: Color(0xffffffff),
          fontSize: 15.0,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }

  loginBt(context) {
    return CupertinoButton(
      onPressed: () {
        logIn(email.text, password.text);
      },
      child: Text(
        'Iniciar sesión',
        style: TextStyle(
          color: Color(0xff343434),
          fontSize: 20.0,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }

  registerBt(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '¿No tienes una cuenta?',
          style: TextStyle(
            color: Color(0xff343434),
            fontSize: 15.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        CupertinoButton(
            onPressed: () {
              {
                Route route = MaterialPageRoute(builder: (__) => StageSingUp());
                Navigator.push(context, route);
              }
            },
            child: Text(
              'Registrate',
              style: TextStyle(
                color: Color(0xffffffff),
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
              ),
            ))
      ],
    );
  }

  void logIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
                Fluttertoast.showToast(msg: 'Inicio sesión exitosamente'),
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => StageHomeOne()))
              })
          .catchError((e) {
        throw Fluttertoast.showToast(msg: e!.message);
      });
    }
  }
}
