import 'package:br_button/br_button.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Package BR Button'),
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
  bool isLoading = false;
  List<Map<String, dynamic>> data = [
    {
      'red': 0XFFDC3444,
    },
    {
      'yellow': 0XFFFFC007,
    },
    {
      'green': 0XFF28A745,
    },
    {
      'blue': 0XFF017BFE,
    },
  ];

  void changeLoading() async {
    setState(() {
      isLoading = true;
    });
    await Future.delayed(const Duration(seconds: 5));
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Image.network(
              'https://i.pinimg.com/originals/1e/90/ce/1e90ce8de7e37ddda375687ad7931b4f.jpg',
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var item in data)
                  BRTransparentButton(
                    text: '${item.keys} Button'.toUpperCase(),
                    isLoading: isLoading,
                    color: Color(
                      int.parse(
                        item.values
                            .toString()
                            .replaceAll('(', '')
                            .replaceAll(')', ''),
                      ),
                    ),
                    onPressed: changeLoading,
                  )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
