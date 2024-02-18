import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:spout_app/app/app.router.dart';
import 'package:spout_app/ui/settings/long_break_duration/long_break_duration_view_model.dart';
import 'package:stacked/stacked.dart';

class LongBreakDurationView extends StatelessWidget {
  const LongBreakDurationView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LongBreakDurationViewModel>.reactive(
        onViewModelReady: (viewModel) =>
            viewModel.initLongBreakDurationViewModel(),
        viewModelBuilder: () => LongBreakDurationViewModel(),
        builder: (context, viewModel, child) => Scaffold(
            appBar: AppBar(
              title: const Text("Long Break Duration"),
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
                    tiles: viewModel.longBreakDurations
                        .map(
                          (longBreakDuration) => SettingsTile.navigation(
                            title: Text(longBreakDuration.toString()),
                            trailing:
                                viewModel.userSettings.longBreakDuration ==
                                        longBreakDuration
                                    ? const Icon(Icons.check)
                                    : const Icon(null),
                            onPressed: (context) => viewModel
                              ..setLongBreakDuration(longBreakDuration),
                          ),
                        )
                        .toList())
              ],
            )));
  }
}
