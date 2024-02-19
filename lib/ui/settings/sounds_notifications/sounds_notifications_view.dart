import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:spout_app/app/app.router.dart';
import 'package:spout_app/ui/settings/sounds_notifications/sounds_notifications_view_model.dart';
import 'package:stacked/stacked.dart';

class SoundsNotificationsView extends StatelessWidget {
  const SoundsNotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SoundsNotificationsViewModel>.reactive(
        viewModelBuilder: () => SoundsNotificationsViewModel(),
        onViewModelReady: (viewModel) =>
            viewModel.initSoundsNotificationsViewModel(),
        builder: (context, viewModel, child) => Scaffold(
            appBar: AppBar(
                title: Text(
                  "Sounds & Notifications",
                  style: GoogleFonts.poppins(
                    textStyle:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                ),
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    viewModel.navigationService.navigateToSettingsView();
                  },
                )),
            body: SettingsList(
              lightTheme: const SettingsThemeData(
                tileDescriptionTextColor: Colors.black,
                titleTextColor: Colors.black,
                settingsListBackground: Colors.white,
                settingsTileTextColor: Colors.black,
                leadingIconsColor: Colors.black,
              ),
              darkTheme: const SettingsThemeData(
                tileDescriptionTextColor: Colors.white,
                titleTextColor: Colors.white,
                settingsListBackground: Colors.black,
                settingsTileTextColor: Colors.white,
                leadingIconsColor: Colors.white,
              ),
              platform: DevicePlatform.iOS,
              sections: [
                SettingsSection(
                  title: Text(
                    'Sounds',
                    style: GoogleFonts.poppins(
                      textStyle:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                  ),
                  tiles: <SettingsTile>[
                    SettingsTile.switchTile(
                      leading: Icon(Icons.notifications),
                      title: Text(
                        'Sounds',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                      ),
                      initialValue: viewModel.userSettings.sounds,
                      onToggle: (value) => viewModel.toggleSounds(value),
                    ),
                    SettingsTile.switchTile(
                      leading: Icon(Icons.notifications),
                      title: Text(
                        'Ticking Sound',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                      ),
                      initialValue: viewModel.userSettings.tickingSounds,
                      onToggle: (value) => viewModel.toggleTickingSounds(value),
                    ),
                    SettingsTile.switchTile(
                      leading: Icon(Icons.notifications),
                      title: Text(
                        'Ambient Sounds',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                      ),
                      initialValue: viewModel.userSettings.ambientSounds,
                      onToggle: (value) => viewModel.toggleAmbientSounds(value),
                    ),
                    SettingsTile.switchTile(
                      leading: Icon(Icons.notifications),
                      title: Text(
                        'Vibration',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                      ),
                      initialValue: viewModel.userSettings.vibration,
                      onToggle: (value) => viewModel.toggleVibration(value),
                    ),
                  ],
                ),
                SettingsSection(
                  title: Text(
                    'Notifications',
                    style: GoogleFonts.poppins(
                      textStyle:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                  ),
                  tiles: <SettingsTile>[
                    SettingsTile.switchTile(
                      leading: Icon(
                        Icons.notifications,
                      ),
                      title: Text(
                        'Notifications',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                      ),
                      initialValue: viewModel.userSettings.notifications,
                      onToggle: (value) => viewModel.toggleNotifications(value),
                    ),
                  ],
                ),
                SettingsSection(
                  title: Text(
                    'Ambient Sounds',
                    style: GoogleFonts.poppins(
                      textStyle:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                  ),
                  tiles: <SettingsTile>[
                    SettingsTile.navigation(
                      leading: Icon(Icons.notifications),
                      title: Text(
                        'Rain',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )));
  }
}
