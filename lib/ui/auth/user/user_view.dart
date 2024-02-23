import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spout_app/app/app.router.dart';
import 'package:spout_app/ui/auth/user/user_view_model.dart';
import 'package:stacked/stacked.dart';

class UserView extends StatelessWidget {
  const UserView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => UserViewModel(),
        onViewModelReady: (viewModel) => viewModel.initUserViewModel(),
        builder: (context, viewModel, child) => Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    viewModel.navigationService.navigateToMainView();
                  },
                ),
                title: Text('UserView'),
              ),
              body: Center(
                child: Text('UserView'),
              ),
            ));
  }
}
