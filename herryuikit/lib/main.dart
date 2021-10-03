import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:herryuikit/helpers/themes.dart';
import 'package:herryuikit/providers/theme_providers.dart';
import 'package:provider/provider.dart';

import 'src/welcome.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        ),
      ],
      child: Consumer<ThemeProvider>(builder: (context, _theme, snapshot){
        return GetMaterialApp(
          title: 'Herry UI KIT',
          debugShowCheckedModeBanner: false,
          theme: themeLight(context),
          darkTheme: themeDark(context),
          themeMode: (_theme.isDarkTheme == true) ? ThemeMode.dark : ThemeMode.light,
        );

      }),
    );
  }
}
