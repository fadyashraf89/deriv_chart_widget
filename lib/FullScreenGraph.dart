import 'package:deriv_chart/deriv_chart.dart';
import 'package:flutter/material.dart';

import 'GranularityButton.dart';
import 'TimeValues.dart';
import 'graph_widget.dart';

class FullScreenChart extends StatefulWidget {
  final List<Candle> candles;
  final List<TimeValues> granularities;
  final String activeSymbol;
  final String? MarketName;
  final TextStyle? MarketNameStyle;

  const FullScreenChart({
    Key? key,
    required this.candles,
    required this.granularities,
    required this.activeSymbol,
    this.MarketName,
    this.MarketNameStyle,
  }) : super(key: key);

  @override
  State<FullScreenChart> createState() => _FullScreenChartState();
}

class _FullScreenChartState extends State<FullScreenChart> {
  late int selectedGranularity;
  final ChartController controller = ChartController();
  bool isCandleChart = true;

  final CandleStyle candleStyle = CandleStyle(
    positiveColor: Colors.green,
    negativeColor: Colors.red,
    neutralColor: Colors.grey,
  );

  final LineStyle lineStyle = LineStyle(color: Colors.blue, markerRadius: 2.0);

  @override
  void initState() {
    super.initState();
    selectedGranularity = widget.granularities.first.seconds;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.MarketName ?? "Market",
              style:
                  widget.MarketNameStyle ??
                  TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    isCandleChart ? Icons.show_chart : Icons.candlestick_chart,
                  ),
                  onPressed: () {
                    setState(() {
                      isCandleChart = !isCandleChart;
                    });
                  },
                ),
                SizedBox(width: 8),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: GranularityDropdown(
                    onGranularityChanged: (granularity) {
                      setState(() {
                        selectedGranularity = granularity;
                      });
                    },
                    granularities: widget.granularities,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

      body: DerivChartGraph(
        activeSymbol: widget.activeSymbol,
        controller: controller,
        candles: widget.candles,
        granularity: selectedGranularity,
        chartStyle: isCandleChart ? ChartStyle.candles : ChartStyle.line,
        candleStyle: isCandleChart ? candleStyle : null,
        lineStyle: isCandleChart ? null : lineStyle,
      ),
    );
  }
}
