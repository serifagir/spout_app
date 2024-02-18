import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:spout_app/app/app.router.dart';
import 'package:spout_app/ui/settings/session_count/session_count_view_model.dart';
import 'package:stacked/stacked.dart';

class SessionCountView extends StatelessWidget {
  const SessionCountView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SessionCountViewModel>.reactive(
        onViewModelReady: (viewModel) => viewModel.initSessionCountViewModel(),
        viewModelBuilder: () => SessionCountViewModel(),
        builder: (context, viewModel, child) => Scaffold(
              appBar: AppBar(
                title: const Text("Session Count"),
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
                      tiles: viewModel.sessionCounts
                          .map(
                            (sessionCount) => SettingsTile.navigation(
                              title: Text(sessionCount.toString()),
                              trailing: viewModel.userSettings.sessionCount ==
                                      sessionCount
                                  ? const Icon(Icons.check)
                                  : const Icon(null),
                              onPressed: (context) =>
                                  viewModel.setSessionCount(sessionCount),
                            ),
                          )
                          .toList())
                ],
              ),
            ));
  }
}
