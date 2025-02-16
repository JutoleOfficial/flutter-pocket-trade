import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pocket_trade/generated/l10n.dart';
import 'package:pocket_trade/presentation/pages/card_select_page.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget with _LocaleSetMixin {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pocket Trade',
      localizationsDelegates: localizationsDelegates,
      supportedLocales: S.delegate.supportedLocales,
      localeListResolutionCallback: localSetting,
      theme: ThemeData.light(useMaterial3: true).copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData.dark(useMaterial3: true).copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
      ),
      home: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
        child: CardSelectPage(),
      ),
    );
  }
}

mixin _LocaleSetMixin {
  Iterable<LocalizationsDelegate<dynamic>> get localizationsDelegates {
    return [
      S.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ];
  }

  Locale? localSetting(
    List<Locale>? locales,
    Iterable<Locale> supportedLocales,
  ) {
    if (locales == null || locales.isEmpty) {
      return S.delegate.supportedLocales.first;
    }

    for (Locale locale in locales) {
      final applyLocale = Locale.fromSubtags(
        languageCode: locale.languageCode,
      );

      if (supportedLocales.contains(applyLocale)) {
        return applyLocale;
      }
    }

    return S.delegate.supportedLocales.first;
  }
}
