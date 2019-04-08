import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: '打开蓝牙'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String _message='检查蓝牙状态中....';


  ///////////Flutter 调用原生 Start//////////////

  static const MethodChannel methodChannel=
      MethodChannel('samples.flutter.io/bluetooth');

  Future<void> _openBlueTooth()async{
    String message;
    message=await methodChannel.invokeMethod('openBuleTooth');
    setState(() {
      _message=message;
    });
  }

  Future<void> _getBlueTooth()async{
    String message;
    message=await methodChannel.invokeMethod('getBuleTooth');
    setState(() {
      _message=message;
    });
  }

  //////// Flutter 调用原生  End  ////////

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: new Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('蓝牙状态:'),
                    Text(
                        _message,
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child:Column(
                    children: <Widget>[
                      RaisedButton(
                        color: Colors.blue,
                        textColor: Colors.white,
                        child: Text('打开蓝牙'),
                        onPressed: _openBlueTooth,
                      ),
                      RaisedButton(
                        color: Colors.blue,
                        textColor: Colors.white,
                        child: Text('检测蓝牙状态'),
                        onPressed: _getBlueTooth,
                      ),
                    ],
                  )
                )
              ],
            )
          ],
        ),
      ),
    );
  }
 
}
