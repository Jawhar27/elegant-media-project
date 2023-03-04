import 'package:elegant_media_project/providers/app_state_provider.dart';
import 'package:elegant_media_project/styles/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:elegant_media_project/routes.dart' as router;

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppState>(
      create: (context) => AppState(),
      child: MaterialApp(
        title: 'Elegant Media Project',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: router.Router.generateRoute,
        initialRoute: router.ScreenRoutes.toSplashScreen,
      ),
    );
  }
}
