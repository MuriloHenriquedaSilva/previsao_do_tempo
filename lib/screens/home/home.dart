import 'package:flutter/material.dart';
//import 'package:previsao_do_tempo/provider/weatcher_server.dart';
//import 'package:previsao_do_tempo/screens/home/widgets/main_screen.dart';
import 'package:previsaodotempo/provider/weatcher_server.dart';
import 'package:previsaodotempo/screens/home/widgets/main_screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(
                    Colors.white,
                  ),
                ),
              ),
            );
          default:
            return MainScreen(snapshot.data["results"]);
        }
      },
    );
  }
}
