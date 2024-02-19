import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
                title: Text(
                  "Language",
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.w700),
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
                    'Language',
                    style: GoogleFonts.poppins(
                      textStyle:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                  ),
                  tiles: viewModel.languages
                      .map((language) => SettingsTile.navigation(
                            title: Text(
                              language,
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w400),
                              ),
                            ),
                            trailing: viewModel.currentLanguage == language
                                ? const Icon(Icons.check)
                                : const Icon(null),
                            onPressed: (context) =>
                                viewModel.changeLanguage(language),
                          ))
                      .toList(),
                )
              ],
            )));
  }
}
