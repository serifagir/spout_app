import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:spout_app/app/app.router.dart';
import 'package:spout_app/app/app_base_view_model.dart';
import 'package:spout_app/core/di/locator.dart';
import 'package:spout_app/ui/settings/settings_view_model.dart';
import 'package:stacked/stacked.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        onViewModelReady: (viewModel) => viewModel.initSettingsViewModel(),
        viewModelBuilder: () => SettingsViewModel(),
        builder: (context, viewModel, child) => Scaffold(
            appBar: AppBar(
                title: Text(
                  "Settings",
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.w700),
                  ),
                ),
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    viewModel.navigationService.navigateToMainView();
                  },
                )),
            body: ViewModelBuilder.reactive(
              onViewModelReady: (viewModel) =>
                  viewModel.initSettingsViewModel(),
              viewModelBuilder: () => SettingsViewModel(),
              builder: (context, viewModel, child) => SettingsList(
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
                      'App',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                    ),
                    tiles: <SettingsTile>[
                      SettingsTile.navigation(
                        leading: const Icon(CupertinoIcons.globe),
                        title: Text(
                          'Language',
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w400),
                          ),
                        ),
                        value: Text(
                          viewModel.currentLanguage,
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w400),
                          ),
                        ),
                        onPressed: (context) => viewModel.navigationService
                            .navigateToLanguageView(),
                      ),
                      SettingsTile.navigation(
                          leading: const Icon(CupertinoIcons.bell),
                          title: Text(
                            'Sounds & Notifications',
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w400),
                            ),
                          ),
                          onPressed: (context) => viewModel.navigationService
                              .navigateToSoundsNotificationsView()),
                      SettingsTile.switchTile(
                        onToggle: (value) =>
                            viewModel.toggleAutoStartNextSession(value),
                        initialValue:
                            viewModel.userSettings.autoStartNextSession,
                        leading: const Icon(CupertinoIcons.flowchart),
                        title: Text(
                          'Auto start next sesion',
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      SettingsTile.switchTile(
                        leading: const Icon(CupertinoIcons.moon_stars),
                        title: Text('Dark Mode',
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w400),
                            )),
                        onToggle: (value) {
                          locator<AppBaseViewModel>().changeTheme();
                        },
                        initialValue: locator<AppBaseViewModel>().themeMode ==
                            ThemeMode.dark,
                      ),
                      SettingsTile.switchTile(
                        onToggle: (value) =>
                            viewModel.toggleScreenAlwaysOn(value),
                        initialValue: viewModel.userSettings.screenAlwaysOn,
                        leading: const Icon(CupertinoIcons.sun_max),
                        title: Text('Screen always on',
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w400),
                            )),
                      ),
                    ],
                  ),
                  SettingsSection(
                    title: Text(
                      'Sessions',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                    ),
                    tiles: <SettingsTile>[
                      SettingsTile.navigation(
                        leading: const Icon(CupertinoIcons.wind),
                        title: Text('Spout Duration',
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w400),
                            )),
                        value: Text(
                            "${viewModel.userSettings.spoutDuration.toString()} min",
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w400),
                            )),
                        onPressed: (context) => viewModel.navigationService
                            .navigateToSpoutDurationView(),
                      ),
                      SettingsTile.navigation(
                        leading: const Icon(
                            CupertinoIcons.hourglass_bottomhalf_fill),
                        title: Text('Break Duration',
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w400),
                            )),
                        value: Text(
                            "${viewModel.userSettings.breakDuration.toString()} min",
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w400),
                            )),
                        onPressed: (context) => viewModel.navigationService
                            .navigateToBreakDurationView(),
                      ),
                      SettingsTile.navigation(
                        leading:
                            const Icon(CupertinoIcons.hourglass_tophalf_fill),
                        title: Text('Long Break Duration',
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w400),
                            )),
                        value: Text(
                            "${viewModel.userSettings.longBreakDuration.toString()} min",
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w400),
                            )),
                        onPressed: (context) => viewModel.navigationService
                            .navigateToLongBreakDurationView(),
                      ),
                      SettingsTile.navigation(
                        leading: const Icon(CupertinoIcons.number),
                        title: Text('Session Count',
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w400),
                            )),
                        value:
                            Text(viewModel.userSettings.sessionCount.toString(),
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400),
                                )),
                        onPressed: (context) => viewModel.navigationService
                            .navigateToSessionCountView(),
                      ),
                    ],
                  ),
                ],
              ),
            )));
  }
}
