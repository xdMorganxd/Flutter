import 'package:adiletproj/reg_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'translations/codegen_loader.g.dart';

void main() {
  runApp(const MyApp());
}

// void maintwo() async{
//   WidgetsFlutterBinding.ensureInitialized();
//   await EasyLocalization.ensureInitialized();
//   runApp(EasyLocalization(
//     child: MyApp(),
//     supportedLocales:
//     [
//       Locale('kaz'),
//       Locale('rus'),
//       Locale('eng')
//     ], path: 'assets/translations',
//     fallbackLocale: Locale('eng'),
//     assetLoader: CodegenLoader(),),
//   );
// }
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // localizationsDelegates: context.localizationDelegates,
      // supportedLocales: context.supportedLocales,
      // locale: context.locale,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RegPage(),
    );
  }
}


class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
    );
  }
}