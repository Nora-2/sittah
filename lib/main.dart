import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glasses/core/routing/routes.dart';
import 'package:glasses/core/routing/app_router.dart';
import 'package:glasses/core/utils/appstring/app_string.dart';

void main() {

  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final AppRouter appRouter = AppRouter();

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: Routes.splash, 
            onGenerateRoute: appRouter.generateRoute, 
       
            theme: ThemeData(fontFamily: Appstring.fontfamily),
          ),
        );
      },
    );
  }
}
