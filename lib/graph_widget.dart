import 'package:deriv_chart/deriv_chart.dart';
import 'package:flutter/material.dart';

class DerivChartGraph extends StatelessWidget {
  final String activeSymbol;
  final ChartController controller;
  final int granularity;
  final List<Candle> candles;
  final ChartStyle chartStyle;
  final CandleStyle? candleStyle;
  final LineStyle? lineStyle;

  const DerivChartGraph({
    super.key,
    required this.activeSymbol,
    required this.controller,
    required this.candles,
    required this.granularity,
    required this.chartStyle,
    this.candleStyle,
    this.lineStyle,
  });

  DataSeries get mainSeries {
    return chartStyle == ChartStyle.candles
        ? CandleSeries(candles, style: candleStyle)
        : LineSeries(candles, style: lineStyle);
  }

  @override
  Widget build(BuildContext context) {
    return DerivChart(
      controller: controller,
      activeSymbol: activeSymbol,
      mainSeries: mainSeries,
      granularity: granularity,
    );
  }
}
