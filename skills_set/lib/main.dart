import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:layout/layout.dart';
import 'package:skills_set/presentation/utils/custom_scroll_behaviour.dart';
import 'package:skills_set/presentation/utils/extensions/theme_ex.dart';
import 'package:url_strategy/url_strategy.dart';

import 'firebase_options.dart';
import 'injection.dart';
import 'presentation/route/routes.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  Injection.setUp();
  setPathUrlStrategy();
  runApp(const Berry());
}

class Berry extends StatelessWidget {
  const Berry({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: MaterialApp(
        title: 'Made berry',
        scrollBehavior: AppScrollBehavior(),
        debugShowCheckedModeBanner: false,
        theme: context.theme(),
        initialRoute: initialRoute,
        onGenerateRoute: RouteGen.generateRoute,
      ),
    );
  }

  String get initialRoute => Routes.home;
}
