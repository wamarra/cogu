import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_theme/json_theme.dart';

const applicationName = 'Investing Now';

void main() async {
  ThemeData theme = await getTheme();
  runApp(App(theme: theme));
}

Future<ThemeData> getTheme() async {
  WidgetsFlutterBinding.ensureInitialized();
  final theme = await rootBundle.loadString('assets/themes/theme.json');
  return ThemeDecoder.decodeThemeData(jsonDecode(theme))!;
}

class App extends StatelessWidget {
  const App({Key? key, required this.theme}) : super(key: key);
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: applicationName,
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // child: const Text('Bem vindo'),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/cogu.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        transform: Matrix4.translationValues(0.0, 100, 0.0),
      ),
      floatingActionButton: FloatingActionButton(
        child: Container(
          width: 60,
          height: 60,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                  colors: [Color(0xffa60c20), Color(0xff262450)])),
          child: const Icon(
            Icons.login,
            size: 30,
          ),
        ),
        onPressed: () {},
      ),
    );
  }
}
