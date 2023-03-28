import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 상태 관리 변수
  int numb = 1;

  void add(){
    setState(() {
      numb = numb + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(child: HeaderPage(numb)),
            Expanded(child: BottomPage(add)),
          ],
        ),
      ),
    );
  }
}

class HeaderPage extends StatelessWidget {
  // 전달받는 변수
  final int numb;
  HeaderPage(this.numb, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.redAccent,
      child: Align(
        child: Text(
          "$numb",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 100,
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }
}

class BottomPage extends StatelessWidget {
  // Function add;
  final add;

  BottomPage(this.add, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Align(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
          ),
          onPressed: (){
            add();
          },
          child: Text("증가"),
        ),
      ),
    );
  }
}
