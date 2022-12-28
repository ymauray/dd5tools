import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';

import 'app_theme.dart';
import 'pages/sign_up_page.dart';
import 'providers/character_provider.dart';
import 'utils/db_util.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<DbUtil>(
          create: (_) => DbUtil(),
        ),
        ChangeNotifierProvider<CharacterProvider>(
          create: (context) => CharacterProvider(context.read<DbUtil>()),
        ),
      ],
      child: MaterialApp(
        title: 'DD5Tools',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.themeData,
        home: SignUpPage(),
        localizationsDelegates: const [
          FormBuilderLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
      ),
    );
  }
}
