import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spout_app/app/app_base_view_model.dart';
import 'package:spout_app/ui/main/main_view_model.dart';
import 'package:stacked/stacked.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ViewModelBuilder<MainViewModel>.reactive(
        viewModelBuilder: () => MainViewModel(),
        builder: (context, viewModel, child) => Scaffold(
                body: Stack(
              alignment: Alignment.center,
              children: [
                Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SessionNameIndicator(
                      viewModel: viewModel,
                    ),
                    CountdownTimer(
                      viewModel: viewModel,
                    ),
                    SessionCountIndicator(
                      viewModel: viewModel,
                    ),
                  ],
                )),
                Positioned(
                  bottom: size.height * 0.08,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () => viewModel.resetAllSessions(),
                        icon: const Icon(
                          CupertinoIcons.refresh,
                          size: 30,
                        ),
                      ),
                      IconButton(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        onPressed: () => viewModel.toggleTimer(),
                        icon: Icon(
                          viewModel.isRunning
                              ? CupertinoIcons.pause
                              : CupertinoIcons.play,
                          size: 40,
                        ),
                      ),
                      IconButton(
                        onPressed: () => viewModel.jumpNextRound(),
                        icon: Icon(
                          viewModel.isBreakTime
                              ? CupertinoIcons.forward_end
                              : null,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: IconButton(
                      onPressed: () => viewModel.navigateToStats(),
                      icon: const Icon(
                        CupertinoIcons.chart_bar,
                        size: 30,
                      ),
                    )),
                Positioned(
                    bottom: 0,
                    left: 0,
                    child: IconButton(
                      onPressed: () => viewModel.navigateToSettings(),
                      icon: const Icon(
                        Icons.settings_outlined,
                        size: 30,
                      ),
                    )),
              ],
            )));
  }
}

class CountdownTimer extends StatelessWidget {
  final AppBaseViewModel viewModel;
  const CountdownTimer({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      viewModel.currentTimeDisplay,
      textAlign: TextAlign.center,
      style: GoogleFonts.robotoMono(
          fontSize: 80,
          color: Theme.of(context).colorScheme.secondary,
          fontWeight: FontWeight.w900),
    );
  }
}

class SessionCountIndicator extends StatelessWidget {
  final AppBaseViewModel viewModel;
  const SessionCountIndicator({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
          viewModel.userSettings.sessionCount,
          (index) => Container(
                margin: const EdgeInsets.all(5),
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).colorScheme.secondary,
                        width: 2),
                    color: viewModel.currentRound > index
                        ? Theme.of(context).colorScheme.secondary
                        : Colors.transparent,
                    shape: BoxShape.circle),
              )),
    );
  }
}

class SessionNameIndicator extends StatelessWidget {
  final AppBaseViewModel viewModel;
  const SessionNameIndicator({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      viewModel.isBreakTime
          ? viewModel.currentRound == viewModel.userSettings.sessionCount
              ? 'Long Break'
              : 'Break'
          : 'Spout',
      style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w500),
    );
  }
}
