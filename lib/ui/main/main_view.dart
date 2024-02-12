import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
                body: SafeArea(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Center(child: CountdownTimer()),
                  Positioned(
                    bottom: size.height * 0.08,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            CupertinoIcons.refresh,
                            size: 40,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            CupertinoIcons.play_fill,
                            size: 40,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            CupertinoIcons.forward,
                            size: 40,
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
                          CupertinoIcons.chart_bar_alt_fill,
                          size: 30,
                        ),
                      )),
                  Positioned(
                      bottom: 0,
                      left: 0,
                      child: IconButton(
                        onPressed: () => viewModel.navigateToSettings(),
                        icon: const Icon(
                          Icons.settings,
                          size: 30,
                        ),
                      )),
                ],
              ),
            )));
  }
}

class CountdownTimer extends StatelessWidget {
  const CountdownTimer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("Spout"),
        Text(
          "25:57",
          textAlign: TextAlign.center,
          style: GoogleFonts.robotoMono(
              fontSize: 80, color: Colors.black, fontWeight: FontWeight.w900),
        ),
        Text("Pomodoro", style: GoogleFonts.robotoMono())
      ],
    );
  }
}
