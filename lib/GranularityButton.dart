import "package:flutter/material.dart";
import "package:deriv_chart_widget/TimeValues.dart";

class GranularityDropdown extends StatefulWidget {
  final Function(int) onGranularityChanged;
  final List<TimeValues> granularities;
  final TextStyle? textStyle;

  const GranularityDropdown({
    super.key,
    required this.onGranularityChanged,
    required this.granularities,
    this.textStyle,
  });

  @override
  State<GranularityDropdown> createState() => _GranularityDropdownState();
}

class _GranularityDropdownState extends State<GranularityDropdown> {
  late TimeValues _selectedGranularity;

  @override
  void initState() {
    super.initState();
    _selectedGranularity = widget.granularities.first;
  }

  String getGranularityLabel(TimeValues granularity) {
    switch (granularity) {
      case TimeValues.OneDay:
        return '1D';
      case TimeValues.OneWeek:
        return '1W';
      case TimeValues.OneMonth:
        return '1M';
      case TimeValues.SixMonths:
        return '6M';
      case TimeValues.OneYear:
        return '1Y';
      case TimeValues.FiveYears:
        return '5Y';
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<TimeValues>(
      value: _selectedGranularity,
      onChanged: (TimeValues? newValue) {
        if (newValue != null) {
          setState(() {
            _selectedGranularity = newValue;
          });
          widget.onGranularityChanged(_selectedGranularity.seconds);
        }
      },
      items: widget.granularities.map<DropdownMenuItem<TimeValues>>((TimeValues granularity) {
        return DropdownMenuItem<TimeValues>(
          value: granularity,
          child: Text(
            getGranularityLabel(granularity),
            style: widget.textStyle ?? const TextStyle(fontSize: 16),
          ),
        );
      }).toList(),
    )
    ;
  }
}


