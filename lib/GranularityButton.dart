import "package:flutter/material.dart";

class GranularityButton extends StatefulWidget {
  final Function(int) onGranularityChanged;
  final List<int> granularities;
  final ButtonStyle? buttonStyle;
  final TextStyle? textStyle;

  const GranularityButton({
    super.key,
    required this.onGranularityChanged,
    required this.granularities,
    this.buttonStyle,
    this.textStyle
  });

  @override
  State<GranularityButton> createState() => _GranularityButtonState();
}

class _GranularityButtonState extends State<GranularityButton> {
  late int _selectedGranularity;


  @override
  void initState() {
    super.initState();
    _selectedGranularity = widget.granularities.first;
  }

  String getGranularityLabel(int granularity) {
    switch (granularity) {
      case 5:
        return '5s';
      case 10:
        return '10s';
      case 15:
        return '15s';
      case 30:
        return '30s';
      case 60:
        return '1m';
      case 120:
        return '2m';
      case 180:
        return '3m';
      case 300:
        return '5m';
      case 900:
        return '15m';
      case 1800:
        return '30m';
      case 3600:
        return '1H';
      case 7200:
        return '2H';
      case 14400:
        return '4H';
      case 21600:
        return '6H';
      case 43200:
        return '12H';
      case 86400:
        return '1D';
      case 604800:
        return '1W';
      case 2592000:
        return '1M';
      case 31536000:
        return '1Y';
      case 63072000:
        return '2Y';
      case 94608000:
        return '3Y';
      case 157680000:
        return '5Y';
      case 315360000:
        return '10Y';
      case 630720000:
        return '20Y';
      case 1576800000:
        return '50Y';
      case 3153600000:
        return '100Y';
      default:
        return 'Unknown Granularity';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5.0,
      children: widget.granularities.map((int granularity) {
        return ElevatedButton(
          style: widget.buttonStyle ??
              ElevatedButton.styleFrom(
                backgroundColor:
                _selectedGranularity == granularity ? Colors.blue : Colors.grey[300],
                foregroundColor: _selectedGranularity == granularity ? Colors.white : Colors.black,
              ),
          onPressed: () {
            setState(() {
              _selectedGranularity = granularity;
            });
            widget.onGranularityChanged(granularity);
          },
          child: Text(getGranularityLabel(granularity), style: widget.textStyle ?? TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold
          ),),
        );
      }).toList(),
    );
  }
}
