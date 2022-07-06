import 'package:dd5tools/pages/choose_race.dart';
import 'package:flutter/material.dart';

import 'app_theme.dart';
import 'pages/home_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DD5Tools',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.themeData,
      routes: {
        'home': (BuildContext context) => const HomePage(),
        'choose_race': (BuildContext context) => const ChooseRace(),
      },
      initialRoute: 'home',
    );
  }
}
