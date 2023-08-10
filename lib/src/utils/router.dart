import 'package:get/get.dart';
import '../screens/index.dart';

class Routes {
	static final route = [
		GetPage(
			name: '/login',
			page: () => const LoginScreen(),
		),
		GetPage(
			name: '/home',
			page: () => const HomeScreen(),
		),
		GetPage(
			name: '/settings',
			page: () => SettingsScreen(),
		),
		GetPage(
			name: '/commune/dashboard',
			page: () => const DashboardScreen(),
		),
		GetPage(
			name: '/commune/velocity-curves',
			page: () => const VelocityCurvesScreen(),
		),
		GetPage(
			name: '/commune/velocity-curves/details',
			page: () => const VelocityCurvesDetailsScreen(),
		),
		GetPage(
			name: '/commune/otvigente',
			page: () => const OTVigenteScreen(),
		),
		GetPage(
			name: '/commune/otvigente/details',
			page: () => const OTVigenteDetailScreen(),
		),
		GetPage(
			name: '/commune/activities',
			page: () => const ActivitiesScreen(),
		),
		GetPage(
			name: '/commune/historic',
			page: () => const HistoricScreen(),
		),
	];
}