import 'package:flutter/material.dart';
import 'package:futurama/modules/character/characters_provider.dart';
import 'package:futurama/modules/character/characters_screen.dart';
import 'package:futurama/modules/home/home_screen.dart';
import 'package:futurama/modules/quiz/quiz_provider.dart';
import 'package:futurama/modules/quiz/quiz_screen.dart';
import 'package:futurama/modules/home/futurama_info_provider.dart';
import 'package:futurama/src/utils/theme/theme.dart';
import 'package:provider/provider.dart';

class FuturamaApp extends StatelessWidget {
  const FuturamaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FuturamaInfoProvider()),
        ChangeNotifierProvider(create: (_) => CharactersProvider()),
        ChangeNotifierProvider(create: (_) => QuizProvider()),
      ],
      // create: (_) => FuturamaInfoProvider(),
      child: MaterialApp(
        title: 'Futurama',
        theme: FuturamaTheme.lightTheme,
        darkTheme: FuturamaTheme.darkTheme,
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
        routes: {
          CharactersScreen.routeName: (_) => const CharactersScreen(),
          QuizScreen.routeName: (_) => const QuizScreen(),
        },
      ),
    );
  }
}
