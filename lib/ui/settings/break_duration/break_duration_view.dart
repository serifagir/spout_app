import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:spout_app/app/app.router.dart';
import 'package:spout_app/ui/settings/break_duration/break_duration_view_model.dart';
import 'package:stacked/stacked.dart';

class BreakDurationView extends StatelessWidget {
  const BreakDurationView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BreakDurationViewModel>.reactive(
        onViewModelReady: (viewModel) => viewModel.initBreakDurationViewModel(),
        viewModelBuilder: () => BreakDurationViewModel(),
        builder: (context, viewModel, child) => Scaffold(
              appBar: AppBar(
                title: const Text("Break Duration"),
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
                      tiles: viewModel.breakDurations
                          .map(
                            (breakDuration) => SettingsTile.navigation(
                              title: Text(breakDuration.toString()),
                              trailing: viewModel.userSettings.breakDuration ==
                                      breakDuration
                                  ? const Icon(Icons.check)
                                  : const Icon(null),
                              onPressed: (context) =>
                                  viewModel.setBreakDuration(breakDuration),
                            ),
                          )
                          .toList())
                ],
              ),
            ));
  }
}
