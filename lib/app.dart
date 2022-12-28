import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/localization/l10n.dart';
import 'package:gettext_i18n/gettext_i18n.dart';

import 'main_layout.dart';

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    return CupertinoApp(
      title: 'dnd assistant',
      debugShowCheckedModeBanner: false,
      //theme: AppTheme.light.data,
      //darkTheme: AppTheme.dark.data,
      home: const MainLayout(),
      supportedLocales: const [
        Locale('en'),
        Locale('fr'),
      ],
      localizationsDelegates: [
        FormBuilderLocalizations.delegate,
        GettextLocalizationsDelegate(defaultLanguage: 'fr'),
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
    );
  }
}
