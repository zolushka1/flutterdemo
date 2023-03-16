import 'package:flutter/material.dart';
import 'package:itemcount/BusinessObjects/Contract.dart';
import 'package:itemcount/Integrations/PosmanagerService.dart';

import 'Styles/textStyles.dart';
import 'Customs/Buttons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String resultText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Column and Row Example'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RoundButton(
                  text: "Dar2",
                  onPressedFunction: () {
                    _getContractInfo();
                  },
                  cornerRadius: 15.0),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$resultText'),
            ],
          )
        ],
      ),
    );
  }

  void _getContractInfo() async {
    Contract contract = await PosManagerService.getContract('1592634870');
    resultText = contract.number;

    setState(() {});
  }
}
