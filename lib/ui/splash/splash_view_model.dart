import 'package:spout_app/app/app.router.dart';
import 'package:spout_app/app/app_base_view_model.dart';

class SplashViewModel extends AppBaseViewModel {
  void handleSplashScreen() {
    print('SplashViewModel initialized');
    Future<void>.delayed(const Duration(seconds: 1),
        () => navigationService.replaceWith(Routes.mainView));
  }
}
