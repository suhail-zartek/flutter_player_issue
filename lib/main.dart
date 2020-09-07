import 'package:flutter/material.dart';
import 'package:flutter_drm_sample/player_native.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter DRM',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Player"),
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: FlatButton(
             child: Text("Play",style: TextStyle(
               color: Colors.white
             ),),
            color: Colors.blue,
            onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Player()));

            },
        )
        ),
      ),
    );
    throw UnimplementedError();
  }
}
