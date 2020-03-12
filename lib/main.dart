import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/locator.dart';
import 'package:news_app/ui/screens/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await setUpLocator();
   
  try {
    SystemChrome.setPreferredOrientations(
            [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
        .then((_) {
      runApp(NewsApp());
    });
  } catch (error) {
    print('Locator setup has failed');
  }
}

class NewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return 
        MaterialApp(
      debugShowCheckedModeBanner: false,
      // navigatorKey: serviceLocator<NavigationService>().navigatorKey,
      title: 'News App',
      home: Home(),
      // onGenerateRoute: router.generateRoute,
    );
  }
}
