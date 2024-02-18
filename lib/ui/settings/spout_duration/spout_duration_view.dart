import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:spout_app/app/app.router.dart';
import 'package:spout_app/ui/settings/spout_duration/spout_duration_view_model.dart';
import 'package:stacked/stacked.dart';

class SpoutDurationView extends StatelessWidget {
  const SpoutDurationView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SpoutDurationViewModel>.reactive(
        onViewModelReady: (viewModel) => viewModel.initSpotDurationViewModel(),
        viewModelBuilder: () => SpoutDurationViewModel(),
        builder: (context, viewModel, child) => Scaffold(
            appBar: AppBar(
              title: const Text("Spout Duration"),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  viewModel.navigationService.navigateToSettingsView();
                },
              ),
            ),
            body: SettingsList(
              sections: [
                SettingsSection(
                    tiles: viewModel.spoutDurations
                        .map(
                          (spoutDuration) => SettingsTile.navigation(
                            title: Text(spoutDuration.toString()),
                            trailing: viewModel.userSettings.spoutDuration ==
                                    spoutDuration
                                ? const Icon(Icons.check)
                                : const Icon(null),
                            onPressed: (context) =>
                                viewModel.setSpoutDuration(spoutDuration),
                          ),
                        )
                        .toList())
              ],
            )));
  }
}
