import 'package:flutter/material.dart';
import 'package:deriv_chart/deriv_chart.dart';
import 'FullScreenGraph.dart';
import 'TimeValues.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      home: FullScreenChart(
        activeSymbol: "1010",
        MarketName: "ADIB",
        candles: [
          Candle(epoch: DateTime(2020, 1, 1).millisecondsSinceEpoch ~/ 1000,
            high: 500,
            low: 300,
            open: 350,
            close: 400,),
          Candle(epoch: DateTime(2021, 1, 1).millisecondsSinceEpoch ~/ 1000,
            high: 700,
            low: 450,
            open: 400,
            close: 600,),
          Candle(epoch: DateTime(2022, 1, 1).millisecondsSinceEpoch ~/ 1000,
            high: 900,
            low: 600,
            open: 600,
            close: 750,),
          Candle(epoch: DateTime(2023, 1, 1).millisecondsSinceEpoch ~/ 1000,
            high: 1100,
            low: 800,
            open: 750,
            close: 950,),
          Candle(epoch: DateTime(2024, 1, 1).millisecondsSinceEpoch ~/ 1000,
            high: 1000,
            low: 700,
            open: 950,
            close: 850,),
          Candle(epoch: DateTime(2024, 2, 1).millisecondsSinceEpoch ~/ 1000,
            high: 1200,
            low: 850,
            open: 950,
            close: 1000,),
          Candle(epoch: DateTime(2024, 2, 8).millisecondsSinceEpoch ~/ 1000,
            high: 1250,
            low: 900,
            open: 1000,
            close: 1100,),
          Candle(epoch: DateTime(2024, 2, 15).millisecondsSinceEpoch ~/ 1000,
            high: 1300,
            low: 950,
            open: 1100,
            close: 1200,),
          Candle(epoch: DateTime(2024, 2, 22).millisecondsSinceEpoch ~/ 1000,
            high: 1350,
            low: 1000,
            open: 1200,
            close: 1250,),
          Candle(epoch: DateTime(2024, 2, 29).millisecondsSinceEpoch ~/ 1000,
            high: 1300,
            low: 950,
            open: 1250,
            close: 1100,),
          Candle(epoch: DateTime(2024, 3, 1).millisecondsSinceEpoch ~/ 1000,
            high: 1400,
            low: 1050,
            open: 1250,
            close: 1300,),
          Candle(epoch: DateTime(2024, 3, 2).millisecondsSinceEpoch ~/ 1000,
            high: 1450,
            low: 1080,
            open: 1300,
            close: 1350,),
          Candle(epoch: DateTime(2024, 3, 3).millisecondsSinceEpoch ~/ 1000,
            high: 1400,
            low: 1000,
            open: 1350,
            close: 1100,),
          Candle(
            epoch: DateTime(2024, 3, 2, 8, 0, 0).millisecondsSinceEpoch ~/ 1000,
            high: 1550,
            low: 1120,
            open: 1400,
            close: 1450,),
          Candle(
            epoch: DateTime(2024, 3, 2, 9, 0, 0).millisecondsSinceEpoch ~/ 1000,
            high: 1600,
            low: 1150,
            open: 1450,
            close: 1500,),
          Candle(epoch: DateTime(2024, 3, 2, 10, 0, 0).millisecondsSinceEpoch ~/
              1000,
            high: 1550,
            low: 1100,
            open: 1500,
            close: 1200,),
          Candle(
            epoch: DateTime(2024, 3, 2, 10, 15, 0).millisecondsSinceEpoch ~/
                1000,
            high: 1400,
            low: 1100,
            open: 1200,
            close: 1300,),
          Candle(
            epoch: DateTime(2024, 3, 2, 10, 30, 0).millisecondsSinceEpoch ~/
                1000,
            high: 1350,
            low: 1050,
            open: 1300,
            close: 1150,),
          Candle(
            epoch: DateTime(2024, 3, 2, 10, 45, 0).millisecondsSinceEpoch ~/
                1000,
            high: 1250,
            low: 950,
            open: 1150,
            close: 1000,),
        ],
        granularities: [
          TimeValues.OneDay,
          TimeValues.OneWeek,
          TimeValues.OneMonth,
          TimeValues.OneYear,
          TimeValues.SixMonths,
          TimeValues.FiveYears,
        ],),);
  }
}
