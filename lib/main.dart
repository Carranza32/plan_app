import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plan_app/src/utils/router.dart';
import 'package:plan_app/src/utils/translations.dart';
import 'package:plan_app/src/constants.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
	const MyApp({super.key});

	@override
	Widget build(BuildContext context) {
		return GetMaterialApp(
			title: 'Plan App',
			getPages: Routes.route,
			initialRoute: '/login',
			locale: const Locale('es', 'ES'),
			translations: LanguageTranslations(),
			fallbackLocale: const Locale('es'),
			debugShowCheckedModeBanner: false,
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