import 'package:firebase_core/firebase_core.dart' show Firebase;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:travo/common/routes/routes_generator.dart' show RouteGenerator;
import 'package:travo/features/view/auth/login_screen.dart' show LoginScreen;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,

        onGenerateRoute: RouteGenerator.generateRoute,
        home: LoginScreen(),
      ),
      designSize: const Size(360, 640),
    );
  }
}
