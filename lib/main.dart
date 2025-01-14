
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mobile_assignment/app/routes/app_pages.dart';
import 'package:mobile_assignment/app/services/initial_bindings.dart';
import 'package:sizer/sizer.dart' as sizer;



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);



  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);



  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {

    return sizer.ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return GetMaterialApp(

          debugShowCheckedModeBanner: false,
          theme: ThemeData(

            visualDensity: VisualDensity.standard,
            colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.transparent),
          ),
initialBinding: Binding(),
          title: "Mobile Assignment",
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
        );
      },
    );
  }
}

