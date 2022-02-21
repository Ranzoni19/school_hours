// ignore_for_file: prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables, non_constant_identifier_names, avoid_unnecessary_containers, unnecessary_new

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:school_hours/FIrebase/UserModel.dart';
import 'package:school_hours/UI/Stages/StageHomeOne.dart';
import 'package:school_hours/Widgets/Components.dart';

class StageSingUp extends StatefulWidget {
  static String id = "StageSingUp";
  const StageSingUp({Key? key}) : super(key: key);

  @override
  State<StageSingUp> createState() => _StageSingUpState();
}

class _StageSingUpState extends State<StageSingUp> {
  final _formkey = GlobalKey<FormState>();

  final TextEditingController name = TextEditingController();
  final TextEditingController lastname = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final TextEditingController turn = TextEditingController();
  final TextEditingController age = TextEditingController();
  final TextEditingController div = TextEditingController();

  final _auth = FirebaseAuth.instance;

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
            key: _formkey,
            child: Center(
              child: ListView(
                padding: EdgeInsets.symmetric(
                  horizontal: 30.0,
                ),
                children: [
                  SizedBox(
                    height: 80.0,
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
                    height: 30.0,
                  ),
                  TextFieldEmail(),
                  SizedBox(
                    height: 30.0,
                  ),
                  TextFieldPassw(),
                  SizedBox(
                    height: 30.0,
                  ),
                  TextFieldCPassw(),
                  SizedBox(
                    height: 30.0,
                  ),
                  DropTurnAges(),
                  SizedBox(
                    height: 20.0,
                  ),
                  DropDiv(),
                  SizedBox(
                    height: 35.0,
                  ),
                  RegisterBt(context),
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

  TextFieldEmail() {
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

  TextFieldPassw() {
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

  TextFieldCPassw() {
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
        if (confirmPassword.text != password.text) {
          return 'Las contraseñas no coinciden';
        }
        return null;
      },
      onSaved: (value) {
        confirmPassword.text = value!;
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
                  onChanged: (_) {
                    setState(() {});
                  },
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

  RegisterBt(context) {
    return CupertinoButton(
      onPressed: () {
        {
          Register(email.text, password.text);
        }
      },
      child: Text(
        'Registrar',
        style: TextStyle(
          color: Color(0xff343434),
          fontSize: 25.0,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }

  void Register(String email, String password) async {
    if (_formkey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {
                postDetailsToFirestore(),
              })
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  postDetailsToFirestore() async {
    FirebaseFirestore _firebase = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    userModel usermodel = userModel();

    usermodel.email = user!.email;
    usermodel.name = name.text;
    usermodel.lastname = lastname.text;
    usermodel.password = password.text;

    await _firebase.collection("USERS").doc(user.uid).set(usermodel.toMap());
    Fluttertoast.showToast(msg: "Se ha regístrado con exito");

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => StageHomeOne()),
        (route) => false);
  }
}
