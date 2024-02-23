import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.shape_line),
                  ),
                ],
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    viewModel.navigationService.navigateToMainView();
                  },
                ),
                bottom: TabBar(
                  controller: _tabController,
                  onTap: (value) {
                    if (value == 0) {
                      viewModel.getSpoutStatsByDay();
                    } else if (value == 1) {
                      viewModel.getSpoutStatsByWeek();
                    } else if (value == 2) {
                      viewModel.getSpoutStatsByMonth();
                    } else if (value == 3) {
                      viewModel.getSpoutStatsByYear();
                    }
                  },
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
                      width: size.width * 0.9,
                      child: TabBarView(
                        controller: _tabController,
                        children: <Widget>[
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                StatsDayController(viewModel: viewModel),
                                SizedBox(
                                    width: size.width * 0.95,
                                    height: size.height * 0.6,
                                    child: Card(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: size.width * 0.001,
                                            vertical: size.height * 0.05),
                                        child: DailyStatsChart(
                                          viewModel: viewModel,
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                StatsWeekController(viewModel: viewModel),
                                SizedBox(
                                    width: size.width * 0.95,
                                    height: size.height * 0.6,
                                    child: Card(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: size.width * 0.001,
                                            vertical: size.height * 0.05),
                                        child: WeeklyStatsChart(
                                          viewModel: viewModel,
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                StatsMonthController(viewModel: viewModel),
                                SizedBox(
                                    width: size.width * 0.95,
                                    height: size.height * 0.6,
                                    child: Card(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: size.width * 0.001,
                                            vertical: size.height * 0.05),
                                        child: MonthlyStatsChart(
                                          viewModel: viewModel,
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                StatsYearController(viewModel: viewModel),
                                SizedBox(
                                    width: size.width * 0.95,
                                    height: size.height * 0.6,
                                    child: Card(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: size.width * 0.001,
                                            vertical: size.height * 0.05),
                                        child: YearlyStatsChart(
                                          viewModel: viewModel,
                                        ),
                                      ),
                                    ))
                              ],
                            ),
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
            onPressed: () => viewModel.decrementDay(),
            icon: Icon(
              Icons.chevron_left,
              size: 40,
            )),
        Text(
          "${viewModel.currentDate.day} ${viewModel.months[viewModel.currentDate.month - 1]} ${viewModel.currentDate.year}",
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        IconButton(
            onPressed: () => viewModel.incrementDay(),
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
            onPressed: () => viewModel.decrementWeek(),
            icon: Icon(
              Icons.chevron_left,
              size: 40,
            )),
        Text(
          //hafta pazartesiden başlamalı ve pazar günü bitmeli
          "${viewModel.currentDate.day} - ${viewModel.currentDate.day + 7} ${viewModel.months[viewModel.currentDate.month - 1]} ${viewModel.currentDate.year}",
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        IconButton(
            onPressed: () => viewModel.incrementWeek(),
            icon: Icon(
              Icons.chevron_right,
              size: 40,
            )),
      ],
    );
  }
}

class StatsMonthController extends StatelessWidget {
  final StatsViewModel viewModel;
  const StatsMonthController({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            onPressed: () => viewModel.decrementMonth(),
            icon: Icon(
              Icons.chevron_left,
              size: 40,
            )),
        Text(
          "${viewModel.months[viewModel.currentDate.month - 1]} ${viewModel.currentDate.year}",
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        IconButton(
            onPressed: () => viewModel.incrementMonth(),
            icon: Icon(
              Icons.chevron_right,
              size: 40,
            )),
      ],
    );
  }
}

class StatsYearController extends StatelessWidget {
  final StatsViewModel viewModel;
  const StatsYearController({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            onPressed: () => viewModel.decrementYear(),
            icon: Icon(
              Icons.chevron_left,
              size: 40,
            )),
        Text(
          "${viewModel.currentDate.year}",
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        IconButton(
            onPressed: () => viewModel.incrementYear(),
            icon: Icon(
              Icons.chevron_right,
              size: 40,
            )),
      ],
    );
  }
}

class DailyStatsChart extends StatelessWidget {
  final StatsViewModel viewModel;
  const DailyStatsChart({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        barTouchData: barTouchData,
        titlesData: titlesData,
        borderData: borderData,
        barGroups: barGroups,
        gridData: const FlGridData(show: false),
        alignment: BarChartAlignment.spaceAround,
        maxY: 4,
      ),
    );
  }

  BarTouchData get barTouchData => BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.transparent,
          tooltipPadding: EdgeInsets.zero,
          tooltipMargin: 8,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
              rod.toY.round().toString(),
              const TextStyle(
                color: Colors.cyan,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      );

  Widget getTitles(double value, TitleMeta meta) {
    final style = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = '00';
        break;
      case 1:
        text = '01';
        break;
      case 2:
        text = '02';
        break;
      case 3:
        text = '03';
        break;
      case 4:
        text = '04';
        break;
      case 5:
        text = '05';
        break;
      case 6:
        text = '06';
        break;
      case 7:
        text = '07';
        break;
      case 8:
        text = '08';
        break;
      case 9:
        text = '09';
        break;
      case 10:
        text = '10';
        break;
      case 11:
        text = '11';
        break;
      case 12:
        text = '12';
        break;
      case 13:
        text = '13';
        break;
      case 14:
        text = '14';
        break;
      case 15:
        text = '15';
        break;
      case 16:
        text = '16';
        break;
      case 17:
        text = '17';
        break;
      case 18:
        text = '18';
        break;
      case 19:
        text = '19';
        break;
      case 20:
        text = '20';
        break;
      case 21:
        text = '21';
        break;
      case 22:
        text = '22';
        break;
      case 23:
        text = '23';
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: RotatedBox(
        quarterTurns: 3,
        child: Text(
          text,
          style: style,
        ),
      ),
    );
  }

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: getTitles,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

  FlBorderData get borderData => FlBorderData(
        show: false,
      );

  LinearGradient get _barsGradient => LinearGradient(
        colors: [
          Colors.white,
          Colors.white,
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      );

  List<BarChartGroupData> get barGroups => [
        BarChartGroupData(
          x: 0,
          barRods: [
            BarChartRodData(
              toY: viewModel.getSpoutStatsByDay()[0]!,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 1,
          barRods: [
            BarChartRodData(
              toY: viewModel.getSpoutStatsByDay()[1]!,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 2,
          barRods: [
            BarChartRodData(
              toY: viewModel.getSpoutStatsByDay()[2]!,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 3,
          barRods: [
            BarChartRodData(
              toY: viewModel.getSpoutStatsByDay()[3]!,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 4,
          barRods: [
            BarChartRodData(
              toY: viewModel.getSpoutStatsByDay()[4]!,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 5,
          barRods: [
            BarChartRodData(
              toY: viewModel.getSpoutStatsByDay()[5]!,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 6,
          barRods: [
            BarChartRodData(
              toY: viewModel.getSpoutStatsByDay()[6]!,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 7,
          barRods: [
            BarChartRodData(
              toY: viewModel.getSpoutStatsByDay()[7]!,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 8,
          barRods: [
            BarChartRodData(
              toY: viewModel.getSpoutStatsByDay()[8]!,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 9,
          barRods: [
            BarChartRodData(
              toY: viewModel.getSpoutStatsByDay()[9]!,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 10,
          barRods: [
            BarChartRodData(
              toY: viewModel.getSpoutStatsByDay()[10]!,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 11,
          barRods: [
            BarChartRodData(
              toY: viewModel.getSpoutStatsByDay()[11]!,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 12,
          barRods: [
            BarChartRodData(
              toY: viewModel.getSpoutStatsByDay()[12]!,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 13,
          barRods: [
            BarChartRodData(
              toY: viewModel.getSpoutStatsByDay()[13]!,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 14,
          barRods: [
            BarChartRodData(
              toY: viewModel.getSpoutStatsByDay()[14]!,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 15,
          barRods: [
            BarChartRodData(
              toY: viewModel.getSpoutStatsByDay()[15]!,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 16,
          barRods: [
            BarChartRodData(
              toY: viewModel.getSpoutStatsByDay()[16]!,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 17,
          barRods: [
            BarChartRodData(
              toY: viewModel.getSpoutStatsByDay()[17]!,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 18,
          barRods: [
            BarChartRodData(
              toY: viewModel.getSpoutStatsByDay()[18]!,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 19,
          barRods: [
            BarChartRodData(
              toY: viewModel.getSpoutStatsByDay()[19]!,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 20,
          barRods: [
            BarChartRodData(
              toY: viewModel.getSpoutStatsByDay()[20]!,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 21,
          barRods: [
            BarChartRodData(
              toY: viewModel.getSpoutStatsByDay()[21]!,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 22,
          barRods: [
            BarChartRodData(
              toY: viewModel.getSpoutStatsByDay()[22]!,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 23,
          barRods: [
            BarChartRodData(
              toY: viewModel.getSpoutStatsByDay()[23]!,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
      ];
}

class WeeklyStatsChart extends StatelessWidget {
  final StatsViewModel viewModel;
  const WeeklyStatsChart({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        barTouchData: barTouchData,
        titlesData: titlesData,
        borderData: borderData,
        barGroups: barGroups,
        gridData: const FlGridData(show: false),
        alignment: BarChartAlignment.spaceAround,
        maxY: 4,
      ),
    );
  }

  BarTouchData get barTouchData => BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.transparent,
          tooltipPadding: EdgeInsets.zero,
          tooltipMargin: 8,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
              rod.toY.round().toString(),
              const TextStyle(
                color: Colors.cyan,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      );

  Widget getTitles(double value, TitleMeta meta) {
    final style = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Mon';
        break;
      case 1:
        text = 'Tue';
        break;
      case 2:
        text = 'Wed';
        break;
      case 3:
        text = 'Thu';
        break;
      case 4:
        text = 'Fri';
        break;
      case 5:
        text = 'Sat';
        break;
      case 6:
        text = 'Sun';
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: RotatedBox(
        quarterTurns: 3,
        child: Text(
          text,
          style: style,
        ),
      ),
    );
  }

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: getTitles,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

  FlBorderData get borderData => FlBorderData(
        show: false,
      );

  LinearGradient get _barsGradient => LinearGradient(
        colors: [
          Colors.white,
          Colors.white,
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      );

  List<BarChartGroupData> get barGroups => [
        BarChartGroupData(
          x: 0,
          barRods: [
            BarChartRodData(
              toY: viewModel.getSpoutStatsByDay()[0]!,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 1,
          barRods: [
            BarChartRodData(
              toY: viewModel.getSpoutStatsByDay()[1]!,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 2,
          barRods: [
            BarChartRodData(
              toY: viewModel.getSpoutStatsByDay()[2]!,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 3,
          barRods: [
            BarChartRodData(
              toY: viewModel.getSpoutStatsByDay()[3]!,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 4,
          barRods: [
            BarChartRodData(
              toY: viewModel.getSpoutStatsByDay()[4]!,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 5,
          barRods: [
            BarChartRodData(
              toY: viewModel.getSpoutStatsByDay()[5]!,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 6,
          barRods: [
            BarChartRodData(
              toY: viewModel.getSpoutStatsByDay()[6]!,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
      ];
}

class MonthlyStatsChart extends StatelessWidget {
  final StatsViewModel viewModel;
  const MonthlyStatsChart({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        barTouchData: barTouchData,
        titlesData: titlesData,
        borderData: borderData,
        barGroups: barGroups,
        gridData: const FlGridData(show: false),
        alignment: BarChartAlignment.spaceAround,
        maxY: 10,
      ),
    );
  }

  BarTouchData get barTouchData => BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.transparent,
          tooltipPadding: EdgeInsets.zero,
          tooltipMargin: 8,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
              rod.toY.round().toString(),
              const TextStyle(
                color: Colors.cyan,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      );

  Widget getTitles(double value, TitleMeta meta) {
    final style = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = '1';
        break;
      case 1:
        text = '2';
        break;
      case 2:
        text = '3';
        break;
      case 3:
        text = '4';
        break;
      case 4:
        text = '5';
        break;
      case 5:
        text = '6';
        break;
      case 6:
        text = '06';
        break;
      case 7:
        text = '07';
        break;
      case 8:
        text = '08';
        break;
      case 9:
        text = '09';
        break;
      case 10:
        text = '10';
        break;
      case 11:
        text = '11';
        break;
      case 12:
        text = '12';
        break;
      case 13:
        text = '13';
        break;
      case 14:
        text = '14';
        break;
      case 15:
        text = '15';
        break;
      case 16:
        text = '16';
        break;
      case 17:
        text = '17';
        break;
      case 18:
        text = '18';
        break;
      case 19:
        text = '19';
        break;
      case 20:
        text = '20';
        break;
      case 21:
        text = '21';
        break;
      case 22:
        text = '22';
        break;
      case 23:
        text = '23';
        break;
      case 24:
        text = '24';
        break;
      case 25:
        text = '25';
        break;
      case 26:
        text = '26';
        break;
      case 27:
        text = '27';
        break;
      case 28:
        text = '28';
        break;
      case 29:
        text = '29';
        break;
      case 30:
        text = '30';
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: RotatedBox(
        quarterTurns: 3,
        child: Text(
          text,
          style: style,
        ),
      ),
    );
  }

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: getTitles,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

  FlBorderData get borderData => FlBorderData(
        show: false,
      );

  LinearGradient get _barsGradient => LinearGradient(
        colors: [
          Colors.white,
          Colors.white,
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      );

  List<BarChartGroupData> get barGroups => [
        BarChartGroupData(
          x: 0,
          barRods: [
            BarChartRodData(
              toY: viewModel.getSpoutStatsByMonth()[0]!,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 1,
          barRods: [
            BarChartRodData(
              toY: viewModel.getSpoutStatsByMonth()[1]!,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 2,
          barRods: [
            BarChartRodData(
              toY: viewModel.getSpoutStatsByMonth()[2]!,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 3,
          barRods: [
            BarChartRodData(
              toY: viewModel.getSpoutStatsByMonth()[3]!,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 4,
          barRods: [
            BarChartRodData(
              toY: viewModel.getSpoutStatsByMonth()[4]!,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 5,
          barRods: [
            BarChartRodData(
              toY: viewModel.getSpoutStatsByMonth()[5]!,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 6,
          barRods: [
            BarChartRodData(
              toY: viewModel.getSpoutStatsByMonth()[6]!,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 7,
          barRods: [
            BarChartRodData(
              toY: viewModel.getSpoutStatsByMonth()[7]!,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 8,
          barRods: [
            BarChartRodData(
              toY: viewModel.getSpoutStatsByMonth()[8]!,
              gradient: _barsGradient,
            )
          ],
        ),
        BarChartGroupData(
          x: 9,
          barRods: [
            BarChartRodData(
              toY: viewModel.getSpoutStatsByMonth()[9]!,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 10,
          barRods: [
            BarChartRodData(
              toY: viewModel.getSpoutStatsByMonth()[10]!,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 11,
          barRods: [
            BarChartRodData(
              toY: viewModel.getSpoutStatsByMonth()[11]!,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 12,
          barRods: [
            BarChartRodData(
              toY: viewModel.getSpoutStatsByMonth()[12]!,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 13,
          barRods: [
            BarChartRodData(
              toY: viewModel.getSpoutStatsByMonth()[13]!,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 14,
          barRods: [
            BarChartRodData(
              toY: viewModel.getSpoutStatsByMonth()[14]!,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 15,
          barRods: [
            BarChartRodData(
              toY: viewModel.getSpoutStatsByMonth()[15]!,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 16,
          barRods: [
            BarChartRodData(
              toY: viewModel.getSpoutStatsByMonth()[16]!,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 17,
          barRods: [
            BarChartRodData(
              toY: viewModel.getSpoutStatsByMonth()[17]!,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 18,
          barRods: [
            BarChartRodData(
              toY: viewModel.getSpoutStatsByMonth()[18]!,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 19,
          barRods: [
            BarChartRodData(
              toY: viewModel.getSpoutStatsByMonth()[19]!,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 20,
          barRods: [
            BarChartRodData(
              toY: viewModel.getSpoutStatsByMonth()[20]!,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 21,
          barRods: [
            BarChartRodData(
              toY: viewModel.getSpoutStatsByMonth()[21]!,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 22,
          barRods: [
            BarChartRodData(
              toY: viewModel.getSpoutStatsByMonth()[22]!,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 23,
          barRods: [
            BarChartRodData(
              toY: viewModel.getSpoutStatsByMonth()[23]!,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 24,
          barRods: [
            BarChartRodData(
              toY: viewModel.getSpoutStatsByMonth()[24]!,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 25,
          barRods: [
            BarChartRodData(
              toY: viewModel.getSpoutStatsByMonth()[25] ?? 0,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 26,
          barRods: [
            BarChartRodData(
              toY: viewModel.getSpoutStatsByMonth()[26] ?? 0,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 27,
          barRods: [
            BarChartRodData(
              toY: viewModel.getSpoutStatsByMonth()[27] ?? 0,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 28,
          barRods: [
            BarChartRodData(
              toY: viewModel.getSpoutStatsByMonth()[28] ?? 0,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 29,
          barRods: [
            BarChartRodData(
              toY: viewModel.getSpoutStatsByMonth()[29] ?? 0,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 30,
          barRods: [
            BarChartRodData(
              toY: viewModel.getSpoutStatsByMonth()[29] ?? 0,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
      ];
}

class YearlyStatsChart extends StatelessWidget {
  final StatsViewModel viewModel;
  const YearlyStatsChart({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        barTouchData: barTouchData,
        titlesData: titlesData,
        borderData: borderData,
        barGroups: barGroups,
        gridData: const FlGridData(show: false),
        alignment: BarChartAlignment.spaceAround,
        maxY: 100,
      ),
    );
  }

  BarTouchData get barTouchData => BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.transparent,
          tooltipPadding: EdgeInsets.zero,
          tooltipMargin: 8,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
              rod.toY.round().toString(),
              const TextStyle(
                color: Colors.cyan,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      );

  Widget getTitles(double value, TitleMeta meta) {
    final style = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Jan';
        break;
      case 1:
        text = 'Feb';
        break;
      case 2:
        text = 'Mar';
        break;
      case 3:
        text = 'Apr';
        break;
      case 4:
        text = 'May';
        break;
      case 5:
        text = 'Jun';
        break;
      case 6:
        text = 'Jul';
        break;
      case 7:
        text = 'Aug';
        break;
      case 8:
        text = 'Sep';
        break;
      case 9:
        text = 'Oct';
        break;
      case 10:
        text = 'Nov';
        break;
      case 11:
        text = 'Dec';
        break;
      default:
        text = '';
        break;
    }
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0),
      child: SideTitleWidget(
        axisSide: meta.axisSide,
        space: 0,
        child: RotatedBox(
          quarterTurns: 3,
          child: Text(
            text,
            style: style,
          ),
        ),
      ),
    );
  }

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: getTitles,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

  FlBorderData get borderData => FlBorderData(
        show: false,
      );

  LinearGradient get _barsGradient => LinearGradient(
        colors: [
          Colors.white,
          Colors.white,
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      );

  List<BarChartGroupData> get barGroups => [
        BarChartGroupData(
          x: 0,
          barRods: [
            BarChartRodData(
              toY: viewModel.getSpoutStatsByYear()[0]!,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 1,
          barRods: [
            BarChartRodData(
              toY: viewModel.getSpoutStatsByYear()[1]!,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 2,
          barRods: [
            BarChartRodData(
              toY: viewModel.getSpoutStatsByYear()[2]!,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 3,
          barRods: [
            BarChartRodData(
              toY: viewModel.getSpoutStatsByYear()[3]!,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 4,
          barRods: [
            BarChartRodData(
              toY: viewModel.getSpoutStatsByYear()[4]!,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 5,
          barRods: [
            BarChartRodData(
              toY: viewModel.getSpoutStatsByYear()[5]!,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 6,
          barRods: [
            BarChartRodData(
              toY: viewModel.getSpoutStatsByYear()[6]!,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 7,
          barRods: [
            BarChartRodData(
              toY: viewModel.getSpoutStatsByYear()[7]!,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 8,
          barRods: [
            BarChartRodData(
              toY: viewModel.getSpoutStatsByYear()[8]!,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 9,
          barRods: [
            BarChartRodData(
              toY: viewModel.getSpoutStatsByYear()[9]!,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 10,
          barRods: [
            BarChartRodData(
              toY: viewModel.getSpoutStatsByYear()[10]!,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 11,
          barRods: [
            BarChartRodData(
              toY: viewModel.getSpoutStatsByYear()[11]!,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
      ];
}
