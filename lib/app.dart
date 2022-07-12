import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_theme.dart';
import 'models/characer.dart';
import 'pages/home_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<List<Character>>(
          create: (_) => [
            const Character("Kräal", tagline: "Paladin, deux, trois, ..."),
            const Character("Valla Morigak"),
            const Character(
              "Yavana",
              tagline: "Aubergiste, mais pas seulement.",
            ),
          ],
        ),
      ],
      child: MaterialApp(
        title: 'DD5Tools',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.themeData,
        home: const HomePage(),
      ),
    );
  }
}
