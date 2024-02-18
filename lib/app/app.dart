import 'package:spout_app/ui/customize/customize_view.dart';
import 'package:spout_app/ui/main/main_view.dart';
import 'package:spout_app/ui/settings/break_duration/break_duration_view.dart';
import 'package:spout_app/ui/settings/language/language_view.dart';
import 'package:spout_app/ui/settings/long_break_duration/long_break_duration_view.dart';
import 'package:spout_app/ui/settings/session_count/session_count_view.dart';
import 'package:spout_app/ui/settings/settings_view.dart';
import 'package:spout_app/ui/settings/sounds_notifications/sounds_notifications_view.dart';
import 'package:spout_app/ui/settings/spout_duration/spout_duration_view.dart';
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

    /// SETTINGS VIEWS
    MaterialRoute(page: LanguageView),
    MaterialRoute(page: SoundsNotificationsView),
    MaterialRoute(page: SpoutDurationView),
    MaterialRoute(page: BreakDurationView),
    MaterialRoute(page: LongBreakDurationView),
    MaterialRoute(page: SessionCountView)
  ],
)
class App {}
