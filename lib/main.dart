import 'package:flutter/material.dart';

void main() => runApp(MyApp());// 앱 실행

class MyApp extends StatelessWidget { // 상태 변경이 없는 위젯. 한번 UI가 그려지면 그대로 있음
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {  // UI를 만드는 부분.
    String update;
    return MaterialApp( // 구글 기본 디자인인 Material Design을 써서 앱을 만든다.
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HelloPage("hello World")
    );
  }
}
class HelloPage extends StatefulWidget {// 상태 변경을 할수 있는 위젯.
  final String title; // 전역변수에는 값을 변경할 수 없게 final을 규칙으로 한다.
  HelloPage(this.title); // 생성자를 만듬.

  @override
  _HelloPageState createState() => _HelloPageState();
}

class _HelloPageState extends State<HelloPage> {
  String _message = 'Hello World'; // '_'를 붙이면 private임
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: 
        FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: _changeMessage, // 메서드 호출
        ),
      appBar:AppBar(
        title: Text( widget.title )
      ),
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,  //열 기준 가운데 정렬
          children: <Widget>[
            Text(_message, style: TextStyle(fontSize: 30),),
            Text('$_count', style: TextStyle(fontSize: 30),), // int를 String으로 형변환
          ],
        )
      )
    ); // 전역변수에 있는 title을 가져온다.
  }

  void _changeMessage() {
    setState(() { //setState는 상태를 변경하겠다.
      _message = "값 변경 확인";
      _count++;
    });
  }
}

