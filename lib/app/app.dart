import 'package:spout_app/ui/customize/customize_view.dart';
import 'package:spout_app/ui/main/main_view.dart';
import 'package:spout_app/ui/settings/settings_view.dart';
import 'package:spout_app/ui/splash/splash_view.dart';
import 'package:spout_app/ui/stats/stats_view.dart';
import 'package:stacked/stacked_annotations.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: SplashView, initial: true),
    MaterialRoute(page: MainView),
    MaterialRoute(page: SettingsView),
    MaterialRoute(page: StatsView),
    MaterialRoute(page: CustomizeView),
  ],
)
class App {}
