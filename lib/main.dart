import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roverpyapp/models/theme_model.dart';
import 'package:roverpyapp/pages/home_page.dart';
import 'package:roverpyapp/utils/themes.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider _darkThemeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    await _darkThemeProvider.getThemePreference();
  }

  @override
  void initState() {
    getCurrentAppTheme(); //TODO: Move to splash screen initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => _darkThemeProvider,
        )
      ],
      child: Consumer<DarkThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'RoverPy',
            theme: Styles.themeData(_darkThemeProvider.isDarkTheme, context),
            home: HomePage(),
          );
        },
      ),
    );
  }
}
