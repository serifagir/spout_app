import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spout_app/app/app.router.dart';
import 'package:spout_app/ui/stats/stats_view_model.dart';
import 'package:stacked/stacked.dart';

class StatsView extends StatefulWidget {
  const StatsView({super.key});

  @override
  State<StatsView> createState() => _StatsViewState();
}

class _StatsViewState extends State<StatsView> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ViewModelBuilder.reactive(
        onViewModelReady: (viewModel) => viewModel.initStatsViewModel(),
        viewModelBuilder: () => StatsViewModel(),
        builder: (context, viewModel, child) => Scaffold(
              appBar: AppBar(
                title: const Text('Stats'),
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    viewModel.navigationService.navigateToMainView();
                  },
                ),
                bottom: TabBar(
                  controller: _tabController,
                  tabs: const <Widget>[
                    Tab(
                      text: "Daily",
                    ),
                    Tab(
                      text: "Weekly",
                    ),
                    Tab(
                      text: "Monthly",
                    ),
                    Tab(
                      text: "Yearly",
                    ),
                  ],
                ),
              ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                    child: SizedBox(
                      height: size.height * 0.7,
                      width: size.width * 0.8,
                      child: TabBarView(
                        controller: _tabController,
                        children: <Widget>[
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                StatsDayController(viewModel: viewModel),
                                Text("Daily stats"),
                              ],
                            ),
                          ),
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                StatsWeekController(viewModel: viewModel),
                                Text("It's rainy here"),
                              ],
                            ),
                          ),
                          Center(
                            child: Text("It's sunny here"),
                          ),
                          Center(
                            child: Text("It's sunny here"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ));
  }
}

class StatsDayController extends StatelessWidget {
  final StatsViewModel viewModel;
  const StatsDayController({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.chevron_left,
              size: 40,
            )),
        Text(
          "${viewModel.currentDate.day.toString()} ${viewModel.months[viewModel.currentDate.month - 1]} ${viewModel.currentDate.year.toString()}",
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.chevron_right,
              size: 40,
            )),
      ],
    );
  }
}

class StatsWeekController extends StatelessWidget {
  final StatsViewModel viewModel;
  const StatsWeekController({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.chevron_left,
              size: 40,
            )),
        Text(
          "${viewModel.currentDate.day} - ${viewModel.currentDate.day + 7} ${viewModel.months[viewModel.currentDate.month - 1]} ${viewModel.currentDate.year - 1}",
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.chevron_right,
              size: 40,
            )),
      ],
    );
  }
}
