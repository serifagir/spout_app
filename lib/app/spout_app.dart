import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spout_app/app/app.router.dart';
import 'package:spout_app/app/app_base_view_model.dart';
import 'package:spout_app/common/constants/theme.dart';
import 'package:spout_app/core/di/locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SpoutApp extends StatelessWidget {
  const SpoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        <DeviceOrientation>[DeviceOrientation.portraitUp]);
    return ViewModelBuilder<AppBaseViewModel>.reactive(
        viewModelBuilder: () => locator<AppBaseViewModel>(),
        onViewModelReady: (viewModel) => viewModel.init(),
        builder: (context, viewModel, child) => MaterialApp(
              theme: light,
              darkTheme: dark,
              themeMode: locator<AppBaseViewModel>().themeMode,
              navigatorKey: StackedService.navigatorKey,
              onGenerateRoute: StackedRouter().onGenerateRoute,
              navigatorObservers: [StackedService.routeObserver],
              debugShowCheckedModeBanner: false,
              title: "Spout App",
            ));
  }
}
