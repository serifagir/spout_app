import 'package:flutter/material.dart';
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
                title: const Text("Sounds & Notifications"),
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    viewModel.navigationService.navigateToSettingsView();
                  },
                )),
            body: SettingsList(
              sections: [
                SettingsSection(
                  title: Text('Sounds'),
                  tiles: <SettingsTile>[
                    SettingsTile.switchTile(
                      leading: Icon(Icons.notifications),
                      title: Text('Sounds'),
                      initialValue: viewModel.userSettings.sounds,
                      onToggle: (value) => viewModel.toggleSounds(value),
                    ),
                    SettingsTile.switchTile(
                      leading: Icon(Icons.notifications),
                      title: Text('Ticking Sound'),
                      initialValue: viewModel.userSettings.tickingSounds,
                      onToggle: (value) => viewModel.toggleTickingSounds(value),
                    ),
                    SettingsTile.switchTile(
                      leading: Icon(Icons.notifications),
                      title: Text('Ambient Sounds'),
                      initialValue: viewModel.userSettings.ambientSounds,
                      onToggle: (value) => viewModel.toggleAmbientSounds(value),
                    ),
                    SettingsTile.switchTile(
                      leading: Icon(Icons.notifications),
                      title: Text('Vibration'),
                      initialValue: viewModel.userSettings.vibration,
                      onToggle: (value) => viewModel.toggleVibration(value),
                    ),
                  ],
                ),
                SettingsSection(
                  title: Text('Notifications'),
                  tiles: <SettingsTile>[
                    SettingsTile.switchTile(
                      leading: Icon(Icons.notifications),
                      title: Text('Notifications'),
                      initialValue: viewModel.userSettings.notifications,
                      onToggle: (value) => viewModel.toggleNotifications(value),
                    ),
                  ],
                ),
                SettingsSection(
                  title: Text('Ambient Sounds'),
                  tiles: <SettingsTile>[
                    SettingsTile.navigation(
                      leading: Icon(Icons.notifications),
                      title: Text('Rain'),
                    ),
                  ],
                ),
              ],
            )));
  }
}
