import 'package:flutter/material.dart';
import 'package:spout_app/app/app.router.dart';
import 'package:spout_app/ui/auth/login/login_view_model.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => LoginViewModel(),
      onViewModelReady: (viewModel) => viewModel.initLoginViewModel(),
      builder: (context, viewModel, child) => Scaffold(
        appBar: AppBar(
          title: Text('LoginView'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              viewModel.navigationService.navigateToMainView();
            },
          ),
        ),
        body: Center(
          child: Text('LoginView'),
        ),
      ),
    );
  }
}
