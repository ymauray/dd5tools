import 'package:dd5tools/cubit/character_builder_cubit.dart';
import 'package:dd5tools/pages/character_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'app_theme.dart';
import 'pages/home_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider<CharacterBuilderCubit>(
          create: (context) => CharacterBuilderCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'DD5Tools',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.themeData,
        routes: {
          'home': (context) => const HomePage(),
          'build_character': (context) => const CharacterBuilder(),
        },
        initialRoute: 'home',
      ),
    );
  }
}
