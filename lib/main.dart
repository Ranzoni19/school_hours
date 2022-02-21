import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:school_hours/UI/Stages/StageHomeOne.dart';
import 'package:school_hours/UI/Stages/StageSettingEmail.dart';
import 'package:school_hours/UI/Stages/StageSetting.dart';
import 'package:school_hours/UI/Stages/StageSingUp.dart';
import 'UI/Stages/StageSettingPass.dart';
import 'UI/Stages/StageSettingPerfil.dart';
import 'UI/Stages/Stagelogin.dart';

void main() async {
  WidgetsFlutterBinding();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      title: 'School Hours',
      debugShowCheckedModeBanner: false,
      initialRoute: StageLogin.id,
      routes: {
        StageLogin.id: (context) => const StageLogin(),
        StageSingUp.id: (context) => const StageSingUp(),
        StageHomeOne.id: (context) => const StageHomeOne(),
        StageSetting.id: (context) => const StageSetting(),
        StageSettingEmail.id: (context) => const StageSettingEmail(),
        StageSettingPass.id: (context) => const StageSettingPass(),
        StageSettingPerfil.id: (context) => const StageSettingPerfil(),
      },
    );
  }
}
