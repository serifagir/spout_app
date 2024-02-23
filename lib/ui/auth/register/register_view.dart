import 'package:flutter/material.dart';
import 'package:spout_app/app/app.router.dart';
import 'package:spout_app/ui/auth/register/register_view_model.dart';
import 'package:stacked/stacked.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => RegisterViewModel(),
        onViewModelReady: (viewModel) => viewModel.initRegisterViewModel(),
        builder: (context, viewModel, child) => Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    viewModel.navigationService.navigateToLoginView();
                  },
                ),
                title: Text('RegisterView'),
              ),
              body: Center(
                child: Text('RegisterView'),
              ),
            ));
  }
}
