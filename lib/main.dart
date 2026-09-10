import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show debugPaintBaselinesEnabled;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kiosk_app/app/data/database/app_database.dart';
import 'package:kiosk_app/app/data/providers/api_client.dart';
import 'package:kiosk_app/app/data/providers/api_service.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Prevent text-baseline diagnostic guides from appearing in the UI.
  debugPaintBaselinesEnabled = false;
  await GetStorage.init();

  Get.put<AppDatabase>(AppDatabase(), permanent: true);
  Get.put<ApiClient>(ApiClient(), permanent: true);
  Get.put<ApiService>(ApiService(), permanent: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 666),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Kiosk App',
          initialRoute: Routes.SPLASH,
          getPages: AppPages.routes,
          debugShowCheckedModeBanner: false,
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(
                context,
              ).copyWith(textScaler: const TextScaler.linear(1.0)),
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: child,
              ),
            );
          },
        );
      },
    );
  }
}
