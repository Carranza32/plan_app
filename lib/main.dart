import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:plan_app/src/utils/router.dart';
import 'package:plan_app/src/utils/translations.dart';
import 'package:plan_app/src/constants.dart';

import 'src/controllers/SettingsController.dart';

void main() async {
  await GetStorage.init();

  runApp(
    const MyApp()
      // DevicePreview(
      //   enabled: !kReleaseMode,
      //   builder: (context) => const MyApp(),
      // ),
  );
}

class MyApp extends StatelessWidget {
	const MyApp({super.key});

	@override
	Widget build(BuildContext context) {
		return GetMaterialApp(
      // useInheritedMediaQuery: true,
      // builder: DevicePreview.appBuilder,
			title: 'Plan App',
			getPages: Routes.route,
			initialRoute: '/login',
			locale: const Locale('es', 'ES'),
			translations: LanguageTranslations(),
			fallbackLocale: const Locale('es'),
			debugShowCheckedModeBanner: false,
      initialBinding: BindingsBuilder(() {
        Get.put(SettingsController());
      }),
			theme: ThemeData(
				primaryColor: primaryColor(),
				visualDensity: VisualDensity.adaptivePlatformDensity,
				scaffoldBackgroundColor: Colors.white,
				appBarTheme: AppBarTheme(
					color: Colors.white,
					centerTitle: true,
					titleTextStyle: TextStyle(
						color: primaryColor(),
						fontSize: 20,
					),
					foregroundColor: primaryColor(),
					elevation: 3,
				),
			),
		);
	}
}