<<<<<<< HEAD
import 'package:firebase_core/firebase_core.dart';
=======
>>>>>>> 4271cdd59d711b159194825b5c78c0d1d66c88b2
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:yibe_final_ui/pages/College.dart';
import 'package:yibe_final_ui/pages/splash.dart';

Future<void> main() async {
<<<<<<< HEAD
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
=======
>>>>>>> 4271cdd59d711b159194825b5c78c0d1d66c88b2
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
      onGenerateRoute: (routeSettings) {
        // if (routeSettings.name == Notifications.routeName + 'Right Swipe')
        //   return PageTransition(
        //     child: Notifications(),
        //     type: PageTransitionType.leftToRight,
        //     settings: routeSettings,
        //   );
        // if (routeSettings.name == CollegeSectionPage.routeName + 'Right Swipe')
        //   return PageTransition(
        //     child: CollegeSectionPage(),
        //     type: PageTransitionType.leftToRight,
        //     settings: routeSettings,
        //   );
        // if (routeSettings.name == Money.routeName + 'Right Swipe')
        //   return PageTransition(
        //     child: CollegeSectionPage(),
        //     type: PageTransitionType.leftToRight,
        //     settings: routeSettings,
        //   );
        // if (routeSettings.name == Messages.routeName + 'Left Swipe')
        //   return PageTransition(
        //     child: Messages(),
        //     type: PageTransitionType.rightToLeft,
        //     settings: routeSettings,
        //   );
        // else
        //  return null;
      },
      routes: {
        // Messages.routeName: (context) => Messages(),
        // Notifications.routeName: (context) => Notifications(),
        // CollegeSectionPage.routeName: (context) => CollegeSectionPage(),
        // Money.routeName: (context) => Money()
      },
    );
  }
}
