import 'package:adiletproj/app/ui/reg_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Language extends StatefulWidget {
  const Language({Key? key}) : super(key: key);

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
          children: [
            SizedBox(
              height: 200,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueGrey,
                  fixedSize: Size(250, 60),
                ),
                onPressed: () async {
                  await context.setLocale(Locale('ru'));
                  // appBloc.add(AppStartedEvent());
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegPage(),
                    ),
                  );
                },
                child: Text("Русский")),
            SizedBox(height: 41),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueGrey,
                  fixedSize: Size(250, 60),
                ),
                onPressed: () async {
                  await context.setLocale(Locale('kz'));
                  // ignore: use_build_context_synchronously
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegPage(),
                    ),
                  );
                },
                child: Text("Казахский")),
            SizedBox(height: 41),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueGrey,
                  fixedSize: Size(250, 60),
                ),
                onPressed: () async {
                  await context.setLocale(Locale('en'));
                  // appBloc.add(AppStartedEvent());
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegPage(),
                    ),
                  );
                },
                child: Text("English")),
          ],
        )),
      );
  }
}
