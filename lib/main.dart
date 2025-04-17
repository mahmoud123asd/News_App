import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/views/home_view.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const NewsApp());
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, screenType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeView(),
        routes: {
          "home": (context) => HomeView(),
        },
      );
    });
  }
}
