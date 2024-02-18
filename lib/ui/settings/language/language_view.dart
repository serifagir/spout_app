import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:spout_app/app/app.router.dart';
import 'package:spout_app/app/app_base_view_model.dart';
import 'package:spout_app/core/di/locator.dart';
import 'package:spout_app/ui/settings/language/language_view_model.dart';
import 'package:stacked/stacked.dart';

class LanguageView extends StatelessWidget {
  const LanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LanguageViewModel>.reactive(
        viewModelBuilder: () => LanguageViewModel(),
        onViewModelReady: (viewModel) => viewModel.initLanguageViewModel(),
        builder: (context, viewModel, child) => Scaffold(
            appBar: AppBar(
                title: const Text("Language"),
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    viewModel.navigationService.navigateToSettingsView();
                  },
                )),
            body: SettingsList(
              sections: [
                SettingsSection(
                  title: Text('Language'),
                  tiles: viewModel.languages
                      .map(
                        (language) => SettingsTile.navigation(
                          trailing: viewModel.currentLanguage == language
                              ? const Icon(Icons.check)
                              : const Icon(null),
                          title: Text(language),
                          onPressed: (context) {
                            viewModel.changeLanguage(language);
                          },
                        ),
                      )
                      .toList(),
                ),
              ],
            )));
  }
}
