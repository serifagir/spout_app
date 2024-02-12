import 'package:flutter/material.dart';
import 'package:spout_app/ui/splash/splash_view_model.dart';
import 'package:stacked/stacked.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => SplashViewModel(),
        onViewModelReady: (viewModel) => viewModel.handleSplashScreen(),
        builder: (context, viewModel, child) => Scaffold(
                body: Center(
              child: Text('Splash'),
            )));
  }
}
